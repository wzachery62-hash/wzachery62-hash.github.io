#!/usr/bin/env bash
# Unstoppable U 365 — AI Video Editor setup (Mac)
# Run from inside your "AI video editor" folder:  bash setup-mac.sh
set -e
cd "$(dirname "$0")"

mkdir -p "raw footage" references exports

if ! command -v brew >/dev/null; then
  echo "Installing Homebrew (it will ask for your Mac password)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"
fi

brew install ffmpeg yt-dlp python@3.12 node@22
brew link --overwrite --force node@22 || true

# Whisper lives in its own Python sandbox so it can't break anything else
python3.12 -m venv .venv
./.venv/bin/pip install --upgrade pip
./.venv/bin/pip install openai-whisper

# Remotion + Hyperframes install into this folder (no extra subfolder)
[ -f package.json ] || npm init -y >/dev/null
npm install remotion @remotion/cli @remotion/bundler @remotion/renderer react react-dom hyperframes

bash verify.sh
