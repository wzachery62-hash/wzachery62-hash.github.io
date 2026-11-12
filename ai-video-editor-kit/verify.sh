#!/usr/bin/env bash
# Checks all 5 tools and renders a 2-second 1080x1920 test clip into exports/
cd "$(dirname "$0")"
ok(){ echo "  ✅ $1"; }; bad(){ echo "  ❌ $1"; FAIL=1; }
echo "Checking tools..."
ffmpeg -version >/dev/null 2>&1 && ok "FFmpeg" || bad "FFmpeg"
yt-dlp --version >/dev/null 2>&1 && ok "yt-dlp" || bad "yt-dlp"
./.venv/bin/whisper --help >/dev/null 2>&1 && ok "Whisper" || bad "Whisper"
(cd studio && npx --no-install remotion versions >/dev/null 2>&1) && ok "Remotion" || bad "Remotion"
(cd studio && npx --no-install hyperframes --help >/dev/null 2>&1) && ok "Hyperframes" || bad "Hyperframes"

echo "Rendering vertical test clip (with a tone, so audio is proven)..."
ffmpeg -y -loglevel error -f lavfi -i color=c=black:s=1080x1920:d=2 \
  -f lavfi -i sine=frequency=440:duration=2 -c:v libx264 -pix_fmt yuv420p \
  -c:a aac -shortest exports/_setup_test.mp4 \
  && ok "exports/_setup_test.mp4 (1080x1920, has audio)" || bad "Test render"
[ -z "$FAIL" ] && echo "All set. 🎬" || echo "Something failed — paste this output to Claude."
