# server.ps1 — meridian-server PowerShell runtime.
#
# Serves the Meridian SPA (index.html / index-rendered.html + modules/*.json +
# templates/) and accepts uploaded modules via POST /api/modules/<id>, which
# persists modules/<id>.json and upserts modules/index.json. Mirrors server.py
# byte-for-byte on the wire contract.
#
# Chosen over server.py on Windows Secure Admin Workstations (SAW) where
# third-party language runtimes aren't permitted — PowerShell is built-in.
#
# Run (from elevated PowerShell in the repo root):
#   .\server.ps1
#
# Listens on http://+:8090/ (all interfaces). Binding to non-localhost
# prefixes requires admin OR a netsh urlacl reservation.

$ErrorActionPreference = 'Stop'

$Port        = if ($env:MERIDIAN_PORT) { [int]$env:MERIDIAN_PORT } else { 8090 }
$Prefix      = "http://+:$Port/"
$Root        = $PSScriptRoot
$ModulesDir  = Join-Path $Root 'modules'
$IndexPath   = Join-Path $ModulesDir 'index.json'
$MaxBody     = 5MB
$IdRegex     = '^[a-z0-9][a-z0-9-]{0,63}$'

$Mime = @{
    '.html'  = 'text/html; charset=utf-8'
    '.htm'   = 'text/html; charset=utf-8'
    '.json'  = 'application/json; charset=utf-8'
    '.js'    = 'application/javascript; charset=utf-8'
    '.mjs'   = 'application/javascript; charset=utf-8'
    '.css'   = 'text/css; charset=utf-8'
    '.png'   = 'image/png'
    '.jpg'   = 'image/jpeg'
    '.jpeg'  = 'image/jpeg'
    '.gif'   = 'image/gif'
    '.svg'   = 'image/svg+xml'
    '.ico'   = 'image/x-icon'
    '.txt'   = 'text/plain; charset=utf-8'
    '.md'    = 'text/markdown; charset=utf-8'
    '.docx'  = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    '.pptx'  = 'application/vnd.openxmlformats-officedocument.presentationml.presentation'
    '.xml'   = 'application/xml'
    '.woff'  = 'font/woff'
    '.woff2' = 'font/woff2'
}

# Mutex for index.json so concurrent uploads don't stomp each other.
$IndexMutex = New-Object System.Threading.Mutex($false, 'meridian_server_index_mutex')


function Write-AtomicBytes {
    param([string]$Path, [byte[]]$Bytes)
    $tmp = $Path + '.tmp'
    [System.IO.File]::WriteAllBytes($tmp, $Bytes)
    # Move-Item -Force is an atomic replace on NTFS (same volume).
    Move-Item -LiteralPath $tmp -Destination $Path -Force
}


function Split-EmDash {
    param([string]$Title)
    $sep = ' ' + [char]0x2014 + ' '
    $idx = $Title.IndexOf($sep)
    if ($idx -ge 0) {
        return @{ Head = $Title.Substring(0, $idx); Tail = $Title.Substring($idx + $sep.Length) }
    }
    return @{ Head = $Title; Tail = '' }
}


function Upsert-IndexEntry {
    param([psobject]$Mod)

    $modId = [string]$Mod.module_id
    $title = if ($Mod.PSObject.Properties['default_title'] -and $Mod.default_title) {
        [string]$Mod.default_title
    } else {
        $modId
    }
    $split = Split-EmDash -Title $title

    [void]$IndexMutex.WaitOne()
    try {
        $idxText = Get-Content -LiteralPath $IndexPath -Raw -Encoding UTF8
        $idx = $idxText | ConvertFrom-Json

        if (-not $idx.PSObject.Properties['modules'] -or -not $idx.modules) {
            $idx | Add-Member -MemberType NoteProperty -Name modules -Value @() -Force
        }

        $list = [System.Collections.ArrayList]::new()
        foreach ($entry in $idx.modules) { [void]$list.Add($entry) }

        $found = $false
        for ($i = 0; $i -lt $list.Count; $i++) {
            if ($list[$i].module_id -eq $modId) {
                $list[$i].title         = $split.Head
                $list[$i].subtitle      = $split.Tail
                $list[$i].default_title = $title
                $list[$i].file          = "$modId.json"
                if (-not $list[$i].PSObject.Properties['status']) {
                    $list[$i] | Add-Member -MemberType NoteProperty -Name status -Value 'uploaded'
                }
                $found = $true
                break
            }
        }

        if (-not $found) {
            [void]$list.Add([pscustomobject]@{
                module_id     = $modId
                title         = $split.Head
                subtitle      = $split.Tail
                default_title = $title
                status        = 'uploaded'
                file          = "$modId.json"
            })
        }

        $idx.modules = $list.ToArray()
        $json = $idx | ConvertTo-Json -Depth 50
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($json + "`n")
        Write-AtomicBytes -Path $IndexPath -Bytes $bytes
    } finally {
        [void]$IndexMutex.ReleaseMutex()
    }
}


function Send-TextError {
    param([System.Net.HttpListenerResponse]$Response, [int]$Status, [string]$Message)
    try {
        $Response.StatusCode = $Status
        $Response.ContentType = 'text/plain; charset=utf-8'
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($Message)
        $Response.ContentLength64 = $bytes.Length
        $Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } finally {
        $Response.Close()
    }
}


function Handle-Post {
    param([System.Net.HttpListenerContext]$Context)

    $m = [regex]::Match($Context.Request.Url.AbsolutePath, '^/api/modules/([^/]+)/?$')
    if (-not $m.Success) {
        Send-TextError -Response $Context.Response -Status 404 -Message 'not found'
        return
    }

    $moduleId = $m.Groups[1].Value
    if ($moduleId -notmatch $IdRegex) {
        Send-TextError -Response $Context.Response -Status 400 -Message 'invalid module id'
        return
    }

    $length = $Context.Request.ContentLength64
    if ($length -le 0) {
        Send-TextError -Response $Context.Response -Status 400 -Message 'empty body'
        return
    }
    if ($length -gt $MaxBody) {
        Send-TextError -Response $Context.Response -Status 413 -Message 'payload too large'
        return
    }

    $reader = New-Object System.IO.StreamReader($Context.Request.InputStream, [System.Text.Encoding]::UTF8)
    try { $raw = $reader.ReadToEnd() } finally { $reader.Close() }

    try {
        $mod = $raw | ConvertFrom-Json -ErrorAction Stop
    } catch {
        Send-TextError -Response $Context.Response -Status 400 -Message ('invalid json: ' + $_.Exception.Message)
        return
    }

    if (-not $mod -or $mod -isnot [psobject]) {
        Send-TextError -Response $Context.Response -Status 400 -Message 'body must be a JSON object'
        return
    }

    # URL is authoritative for the id.
    if ($mod.PSObject.Properties['module_id']) {
        $mod.module_id = $moduleId
    } else {
        $mod | Add-Member -MemberType NoteProperty -Name module_id -Value $moduleId
    }

    try {
        $json = $mod | ConvertTo-Json -Depth 50
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($json + "`n")
        $modulePath = Join-Path $ModulesDir ("$moduleId.json")
        Write-AtomicBytes -Path $modulePath -Bytes $bytes
        Upsert-IndexEntry -Mod $mod
    } catch {
        Write-Host "persist failed for ${moduleId}: $($_.Exception.Message)" -ForegroundColor Red
        Send-TextError -Response $Context.Response -Status 500 -Message 'persist failed'
        return
    }

    $ok = [pscustomobject]@{ status = 'ok'; module_id = $moduleId } | ConvertTo-Json -Compress
    $okBytes = [System.Text.Encoding]::UTF8.GetBytes($ok)
    try {
        $Context.Response.StatusCode = 200
        $Context.Response.ContentType = 'application/json; charset=utf-8'
        $Context.Response.ContentLength64 = $okBytes.Length
        $Context.Response.OutputStream.Write($okBytes, 0, $okBytes.Length)
    } finally {
        $Context.Response.Close()
    }
}


function Handle-Static {
    param([System.Net.HttpListenerContext]$Context)

    $urlPath = $Context.Request.Url.AbsolutePath
    if ($urlPath -eq '/') { $urlPath = '/index.html' }

    $decoded = [System.Uri]::UnescapeDataString($urlPath).TrimStart('/')
    if ($decoded.Contains('..')) {
        Send-TextError -Response $Context.Response -Status 400 -Message 'invalid path'
        return
    }

    $candidate = Join-Path $Root $decoded
    $full = [System.IO.Path]::GetFullPath($candidate)
    if (-not $full.StartsWith($Root, [System.StringComparison]::OrdinalIgnoreCase)) {
        Send-TextError -Response $Context.Response -Status 400 -Message 'invalid path'
        return
    }

    if (-not (Test-Path -LiteralPath $full -PathType Leaf)) {
        Send-TextError -Response $Context.Response -Status 404 -Message 'not found'
        return
    }

    $ext = [System.IO.Path]::GetExtension($full).ToLowerInvariant()
    $ct = if ($Mime.ContainsKey($ext)) { $Mime[$ext] } else { 'application/octet-stream' }

    try {
        $bytes = [System.IO.File]::ReadAllBytes($full)
        $Context.Response.StatusCode = 200
        $Context.Response.ContentType = $ct
        $Context.Response.ContentLength64 = $bytes.Length
        if ($Context.Request.HttpMethod -ne 'HEAD') {
            $Context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
        }
    } finally {
        $Context.Response.Close()
    }
}


# ---- main ----

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($Prefix)

try {
    $listener.Start()
} catch [System.Net.HttpListenerException] {
    Write-Host "Failed to start listener on $Prefix" -ForegroundColor Red
    Write-Host 'Likely cause: not running elevated. Start an admin PowerShell, or reserve the URL once with:' -ForegroundColor Yellow
    Write-Host "  netsh http add urlacl url=$Prefix user=$env:USERDOMAIN\$env:USERNAME" -ForegroundColor Yellow
    throw
}

Write-Host 'Meridian server' -ForegroundColor Green
Write-Host "  root: $Root"
Write-Host "  UI:   http://<host>:$Port/"
Write-Host "  API:  POST http://<host>:$Port/api/modules/<id>"
Write-Host '(Ctrl-C to stop)'

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        try {
            switch ($context.Request.HttpMethod) {
                'POST' { Handle-Post   -Context $context }
                'GET'  { Handle-Static -Context $context }
                'HEAD' { Handle-Static -Context $context }
                default {
                    Send-TextError -Response $context.Response -Status 405 -Message 'method not allowed'
                }
            }
        } catch {
            Write-Host "handler error: $($_.Exception.Message)" -ForegroundColor Red
            try { Send-TextError -Response $context.Response -Status 500 -Message 'internal error' } catch {}
        }
    }
} finally {
    $listener.Stop()
    $listener.Close()
}
