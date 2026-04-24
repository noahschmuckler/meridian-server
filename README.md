# meridian-server

On-prem deployment of Meridian for a Windows dev/staging host. Bundles the
static single-page app with a small HTTP server that persists docx-uploaded
modules to disk — closing the single biggest gap in the Cloudflare Pages
deployment, which is read-only.

Two equivalent runtimes ship together:

- **`server.ps1`** — Windows PowerShell 5.1 + .NET Framework. Zero install,
  compatible with Secure Admin Workstation (SAW) environments where
  third-party language runtimes aren't permitted. **Primary on Windows.**
- **`server.py`** — Python 3.9+ stdlib only. Used for local dev on Linux /
  Mac, and remains available on Windows wherever Python is installable.

Both speak the same wire contract; switch between them freely.

Source of truth for clinical content lives in
[`noahschmuckler/meridian`](https://github.com/noahschmuckler/meridian). This
repo is a snapshot intended for local hosting, plus the persistence layer.

## Quick start — Windows dev server (PowerShell, SAW-compatible)

No prereqs beyond what's already on the machine. From an **elevated**
PowerShell:

```powershell
git clone https://github.com/noahschmuckler/meridian-server.git
cd meridian-server
.\server.ps1
```

First run triggers a Windows Firewall prompt for PowerShell on port 8090 —
allow it. If `HttpListener` fails to start with "access denied", the shell
isn't elevated; reopen with Run as administrator.

If `ExecutionPolicy` blocks the script (unlikely on `RemoteSigned`; seen on
`Restricted` or `AllSigned`), bypass it just for this session:

```powershell
powershell -ExecutionPolicy Bypass -File .\server.ps1
```

## Quick start — Linux / Mac dev, or Windows with Python

```bash
git clone https://github.com/noahschmuckler/meridian-server.git
cd meridian-server
python3 server.py
```

## Open it

From any orange-network machine (including the dev server itself):

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
├── server.ps1                   Windows runtime (PowerShell 5.1 + .NET)
├── server.py                    cross-platform runtime (Python 3.9+ stdlib)
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

1. Install the server as a Windows service (auto-start on boot). On SAW
   environments this may need an explicit policy sanction — confirm before
   registering a service.
2. Configure IIS reverse proxy from the `meridian-preview` site's DNS
   binding to `http://localhost:8090/` so the URL is
   `https://meridian-preview/` rather than `http://WN000210934:8090/`.
3. Port the patient API backend (`api/` from upstream) with its Postgres
   schema. Blocked on Python runtime approval for SAW, or reimplementation
   in a SAW-permitted stack.
4. Layer Judy (the admin-tier brain from `SteadyHand_Distill`) onto the
   same runtime. Same Python-approval dependency as #3.

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

| Var | Default | Purpose | Supported by |
|-----|---------|---------|--------------|
| `MERIDIAN_PORT` | `8090` | Bind port | `server.ps1`, `server.py` |
| `MERIDIAN_HOST` | `0.0.0.0` | Bind address | `server.py` only (PowerShell always binds to all interfaces via `http://+:<port>/`) |

## Updating the static snapshot

When the upstream `noahschmuckler/meridian` repo releases a change to
`index-rendered.html` or the module JSON schema, re-sync manually:

1. Copy the updated files from an upstream clone into this repo
2. Re-apply the `persistUploadedModule` server-POST patch (the patch is
   localized to one function — see the code around `STORAGE_KEY` in
   `index-rendered.html`)
3. Keep `index.html` identical to `index-rendered.html`
