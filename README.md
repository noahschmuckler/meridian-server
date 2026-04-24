# meridian-server

On-prem deployment of Meridian for a Windows dev/staging host. Bundles the
static single-page app with a small Python HTTP server that persists
docx-uploaded modules to disk — closing the single biggest gap in the
Cloudflare Pages deployment, which is read-only.

Source of truth for clinical content lives in
[`noahschmuckler/meridian`](https://github.com/noahschmuckler/meridian). This
repo is a snapshot intended for local hosting, plus the persistence layer.

## Quick start (Windows dev server)

Prereq: Python 3.9 or newer on `PATH`.

```powershell
git clone https://github.com/noahschmuckler/meridian-server.git
cd meridian-server
python server.py
```

First run will trigger a Windows firewall prompt for Python on port 8090 —
allow it.

Then from any orange-network machine (including the dev server itself):

```
http://WN000210934:8090/
```

Uploading a DOCX from the header (**Upload DOCX** button in Expanded view)
will:

1. Parse the file client-side via mammoth.js (no server parsing needed)
2. Save the parsed JSON to the browser's `localStorage` (unchanged behavior)
3. `POST` the parsed JSON to `/api/modules/<id>`, which writes
   `modules/<id>.json` and registers the module in `modules/index.json`

Step 3 is the new behavior: uploaded modules now survive restarts and are
visible to every other client hitting this host. If the server isn't
reachable (e.g. viewed on Cloudflare Pages), step 3 fails silently and the
UX falls back to the localStorage-only behavior of the upstream repo.

## Layout

```
meridian-server/
├── server.py                    stdlib Python HTTP server + upload API
├── index-rendered.html          the Meridian SPA (patched: POSTs uploads)
├── index.html                   byte-identical copy (kept in sync)
├── modules/                     clinical module JSON (snapshot + new uploads)
│   ├── index.json               module registry — server updates on upload
│   ├── adhd.json
│   ├── ...
├── templates/                   pre-built Word templates for each module
├── meridian-docx-format-guide.txt   authoring conventions reference
└── README.md
```

## What's deliberately NOT here

Kept upstream in `noahschmuckler/meridian`; not needed for this host today:

- `api/` — FastAPI + PostgreSQL patient-data backend (next stage)
- `functions/` — Cloudflare Pages Functions
- `.wrangler/`, `_headers`, `_redirects`, `manifest.json` — Cloudflare config
- `node_modules/`, `package.json`, `playwright.config.js` — npm/test tooling
- `deploy.sh` — Cloudflare Pages deploy script

## Next stages (unblocked, not yet done)

Local admin is available on the target dev server, so the following are
unblocked whenever we choose to do them:

1. Install the Python server as a Windows service (auto-start on boot)
2. Configure IIS reverse proxy from the `meridian-preview` site's DNS
   binding to `http://localhost:8090/` so the URL is
   `https://meridian-preview/` rather than `http://WN000210934:8090/`
3. Port the patient API backend (`api/` from upstream) with its Postgres
   schema, on the same host
4. Layer Judy (the admin-tier brain from `SteadyHand_Distill`) onto the
   same runtime

## API contract

### `POST /api/modules/<id>`

Body: JSON matching the module schema (see `modules/adhd.json` for an
example shape). The `<id>` in the URL is authoritative; any `module_id`
field inside the body is overwritten on write.

`<id>` must match `^[a-z0-9][a-z0-9-]{0,63}$`.

Responses:

| Status | Meaning |
|--------|---------|
| `200` | `{"status":"ok","module_id":"<id>"}` — persisted, index updated |
| `400` | Invalid id, empty body, or malformed JSON |
| `413` | Body exceeds 5 MB |
| `500` | Disk write failed |

## Configuration

Environment variables (all optional):

| Var | Default | Purpose |
|-----|---------|---------|
| `MERIDIAN_HOST` | `0.0.0.0` | Bind address |
| `MERIDIAN_PORT` | `8090` | Bind port |

## Updating the static snapshot

When the upstream `noahschmuckler/meridian` repo releases a change to
`index-rendered.html` or the module JSON schema, re-sync manually:

1. Copy the updated files from an upstream clone into this repo
2. Re-apply the `persistUploadedModule` server-POST patch (the patch is
   localized to one function — see the code around `STORAGE_KEY` in
   `index-rendered.html`)
3. Keep `index.html` identical to `index-rendered.html`
