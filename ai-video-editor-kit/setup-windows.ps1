# Unstoppable U 365 — AI Video Editor setup (Windows)
# Right-click this file > "Run with PowerShell" from inside your "AI video editor" folder.
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
New-Item -ItemType Directory -Force "raw footage","references","exports" | Out-Null

winget install -e --id Gyan.FFmpeg --accept-source-agreements --accept-package-agreements
winget install -e --id yt-dlp.yt-dlp --accept-source-agreements --accept-package-agreements
winget install -e --id Python.Python.3.12 --accept-source-agreements --accept-package-agreements
winget install -e --id OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements
$env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")

py -3.12 -m venv .venv
.\.venv\Scripts\pip install --upgrade pip
.\.venv\Scripts\pip install openai-whisper

if (-not (Test-Path package.json)) { npm init -y | Out-Null }
npm install remotion @remotion/cli @remotion/bundler @remotion/renderer react react-dom hyperframes

Write-Host "Checking tools..."
ffmpeg -version | Select-Object -First 1
yt-dlp --version
.\.venv\Scripts\whisper --help | Select-Object -First 1
npx --no-install remotion versions; npx --no-install hyperframes --help | Select-Object -First 1
ffmpeg -y -loglevel error -f lavfi -i color=c=black:s=1080x1920:d=2 -f lavfi -i sine=frequency=440:duration=2 -c:v libx264 -pix_fmt yuv420p -c:a aac -shortest exports\_setup_test.mp4
Write-Host "Done. Test clip: exports\_setup_test.mp4"
