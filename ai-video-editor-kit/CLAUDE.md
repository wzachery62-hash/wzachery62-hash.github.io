# Unstoppable U 365 — AI Video Editor house rules

Claude reads this file every time you open this folder in Claude Code.

## Folders
- `raw footage/` — unedited phone/camera clips. Never modify or delete these.
- `references/` — style/pacing examples (yt-dlp downloads go here).
- `exports/` — finished videos only.
- `studio/` — Remotion + Hyperframes projects.
- Whisper: `./.venv/bin/whisper` (Windows: `.\.venv\Scripts\whisper`). Default model `small`, `--language en`.

## Output spec (every export)
- 1080x1920, 9:16, H.264 MP4, yuv420p, 30fps, AAC audio.
- 15–60 seconds. Trim dead air and "ums" over ~0.6s.
- Captions: burned in, synced from Whisper, sitting in the UPPER-MIDDLE safe zone
  (roughly 25–45% down from the top). Nothing important in the bottom 20%
  (platform buttons/captions cover it) or the top 10%.
- Big, bold, high-contrast caption text; 2–5 words per line.

## Quality gate — do NOT call a video done unless:
1. File is a real MP4 video (not a still image or thumbnail). Check with `ffprobe`.
2. It has an audio stream AND it is not silent (check with ffmpeg `volumedetect`;
   mean volume below about -50 dB = silent). If there's no music bed, STOP and ask me:
   - Option 1: give a royalty-free music file to mix in, or
   - Option 2: flag the post to use native trending audio on the platform.
3. Captions are in the upper-middle safe zone and match what was said.
4. No banned words on screen or in copy: journey, navigate, clarity, resilience, grind, unshakable.

## Voice
Raw, personal, table-talk. Humble and kind. No preachy lectures, no hustle hype, no corporate words.

## Never
- Never post or schedule anything. Exports stop at the `exports/` folder; publishing is a separate step I approve.
