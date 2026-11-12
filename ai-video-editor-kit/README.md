# AI Video Editor Starter Kit — Unstoppable U 365

## On your laptop (about 15 minutes, mostly waiting)
1. Install the **Claude Desktop app** and sign in (Pro plan or higher).
2. Make a folder called **AI video editor** (Desktop or Documents is fine).
3. Copy these files into it: `setup-mac.sh`, `setup-windows.ps1`, `verify.sh`, `CLAUDE.md`, `SETUP_PROMPT.txt`.
4. Open the **Claude Code** tab → **Local** → pick the **AI video editor** folder.
5. Paste the text from `SETUP_PROMPT.txt`. Approve the install commands when it asks.
6. Done when you see 5 green checks and `exports/_setup_test.mp4` plays with a beep.

## First real edit
Drop one clip into `raw footage/`, then tell Claude:
> Edit the newest clip in raw footage into a 30–45 second vertical short with captions. Cut the dead air. Save to exports.

## What each tool does
| Tool | Job |
|---|---|
| FFmpeg | Cuts, trims, mixes audio, renders the MP4 |
| Whisper | Turns your voice into timed captions (runs on your laptop, free) |
| yt-dlp | Downloads reference videos so Claude can study pacing |
| Remotion | Builds animated layouts/intros from code |
| Hyperframes | Animated captions, lower-thirds, motion graphics |

Needs: Node 22+ (Hyperframes requires it — the scripts install it), about 5 GB free disk.
Whisper's first run downloads its model (~500 MB) once.
