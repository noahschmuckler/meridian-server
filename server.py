#!/usr/bin/env python3
"""
Meridian dev-server runtime.

Serves the Meridian single-page app (index-rendered.html + modules/*.json +
templates/) and accepts uploaded modules via POST /api/modules/<id>. Uploaded
modules are written to modules/<id>.json and registered in modules/index.json,
so they survive restarts and appear for every client hitting this host
(unlike the Cloudflare Pages deployment, which is read-only).

Run:    python server.py
Listen: 0.0.0.0:8090
"""

import json
import os
import re
import threading
from http.server import HTTPServer, SimpleHTTPRequestHandler
from socketserver import ThreadingMixIn

HOST = os.environ.get("MERIDIAN_HOST", "0.0.0.0")
PORT = int(os.environ.get("MERIDIAN_PORT", "8090"))
ROOT = os.path.dirname(os.path.abspath(__file__))
MODULES_DIR = os.path.join(ROOT, "modules")
INDEX_PATH = os.path.join(MODULES_DIR, "index.json")
MAX_BODY_BYTES = 5 * 1024 * 1024  # 5 MB — modules are JSON, not huge

# Module IDs become filenames, so constrain them aggressively.
ID_RE = re.compile(r"^[a-z0-9][a-z0-9-]{0,63}$")

_index_lock = threading.Lock()


def _atomic_write(path, data_bytes):
    tmp = path + ".tmp"
    with open(tmp, "wb") as f:
        f.write(data_bytes)
    os.replace(tmp, path)


def _split_em_dash(title):
    sep = " — "
    if sep in title:
        head, tail = title.split(sep, 1)
        return head, tail
    return title, ""


def _upsert_index_entry(mod):
    module_id = mod.get("module_id", "")
    title = mod.get("default_title") or module_id
    head, tail = _split_em_dash(title)

    with _index_lock:
        with open(INDEX_PATH, "r", encoding="utf-8") as f:
            idx = json.load(f)

        modules = idx.setdefault("modules", [])
        for entry in modules:
            if entry.get("module_id") == module_id:
                entry["title"] = head
                entry["subtitle"] = tail
                entry["default_title"] = title
                entry["file"] = module_id + ".json"
                entry.setdefault("status", "uploaded")
                break
        else:
            modules.append({
                "module_id": module_id,
                "title": head,
                "subtitle": tail,
                "default_title": title,
                "status": "uploaded",
                "file": module_id + ".json",
            })

        payload = json.dumps(idx, indent=2, ensure_ascii=False).encode("utf-8")
        _atomic_write(INDEX_PATH, payload)


class ThreadingHTTPServer(ThreadingMixIn, HTTPServer):
    daemon_threads = True
    allow_reuse_address = True


class Handler(SimpleHTTPRequestHandler):
    def do_POST(self):
        m = re.match(r"^/api/modules/([^/]+)/?$", self.path)
        if not m:
            self.send_error(404, "not found")
            return
        module_id = m.group(1)
        if not ID_RE.match(module_id):
            self.send_error(400, "invalid module id")
            return

        length = int(self.headers.get("Content-Length") or "0")
        if length <= 0:
            self.send_error(400, "empty body")
            return
        if length > MAX_BODY_BYTES:
            self.send_error(413, "payload too large")
            return

        raw = self.rfile.read(length)
        try:
            mod = json.loads(raw)
        except json.JSONDecodeError as e:
            self.send_error(400, "invalid json: " + str(e))
            return
        if not isinstance(mod, dict):
            self.send_error(400, "body must be a JSON object")
            return

        # URL is authoritative for the id; overwrite any body field.
        mod["module_id"] = module_id

        try:
            payload = json.dumps(mod, indent=2, ensure_ascii=False).encode("utf-8")
            _atomic_write(os.path.join(MODULES_DIR, module_id + ".json"), payload)
            _upsert_index_entry(mod)
        except Exception as e:
            self.log_error("persist failed for %s: %s", module_id, e)
            self.send_error(500, "persist failed")
            return

        body = json.dumps({"status": "ok", "module_id": module_id}).encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


def main():
    os.chdir(ROOT)
    server = ThreadingHTTPServer((HOST, PORT), Handler)
    print("Meridian server")
    print("  root: %s" % ROOT)
    print("  UI:   http://<host>:%d/" % PORT)
    print("  API:  POST http://<host>:%d/api/modules/<id>" % PORT)
    print("(Ctrl-C to stop)")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        print("\nshutting down")
        server.server_close()


if __name__ == "__main__":
    main()
