#!/usr/bin/env bash
#
# Capture the visible GitHub Copilot app window by its CoreGraphics window id.
#
# Why this exists: the app is WebKit-backed, and `System Events` sometimes
# reports `count of windows = 0` even when a window is visible, which breaks the
# Accessibility-rectangle approach in capture-copilot-window.sh. Capturing by
# CoreGraphics window id is more reliable and also lets us poll for the window
# to appear, which solves the "tell me when ready" problem.
#
# CONSTRAINTS (verified on this machine, app v1.0.4):
#   - The Copilot window must be on the SAME macOS Space as the process running
#     this script. CoreGraphics + `screencapture` only see the active Space; a
#     window on another desktop/Space is invisible to capture. Drag the app onto
#     this desktop first.
#   - The caller needs macOS Screen Recording permission (separate from
#     Accessibility). A denied capture comes back blank/near-solid-color.
#   - Requires: swift (Command Line Tools), screencapture, and a WebP encoder
#     (cwebp preferred, then magick, then ffmpeg).
#
# PRIVACY: this captures real window content (project names, prompts, diffs,
# tokens can appear). Capture from a SANITIZED training account on the training
# fork, and review every image before committing it to course assets.
#
# Usage:
#   capture-window.sh <output_dir> <base_name> [timeout_seconds]
#
# Example:
#   capture-window.sh 04-skills-custom-agents/assets app-settings-skills 40
set -euo pipefail

out_dir="${1:?output_dir required}"
base="${2:?base_name required}"
timeout="${3:-30}"
quality="${WEBP_QUALITY:-82}"

here="$(cd "$(dirname "$0")" && pwd)"
swift_src="$here/find-copilot-window.swift"
[ -f "$swift_src" ] || { echo "Missing $swift_src" >&2; exit 1; }
for tool in swift swiftc screencapture python3; do
  command -v "$tool" >/dev/null 2>&1 || { echo "Missing required tool: $tool" >&2; exit 1; }
done

mkdir -p "$out_dir"
lister="$(mktemp -t findcopilot)"
trap 'rm -f "$lister"' EXIT
swiftc "$swift_src" -o "$lister" 2>/dev/null || { echo "swiftc failed to build the window lister" >&2; exit 1; }

pick_largest() {
  "$lister" | python3 -c '
import sys
best=None; area=0
for ln in sys.stdin:
    d=dict(p.split("=",1) for p in ln.strip().split("|") if "=" in p)
    try:
        if int(d.get("layer","9"))!=0: continue
        a=int(d["w"])*int(d["h"])
        if a>area and int(d["h"])>120: area=a; best=d["id"]
    except Exception: pass
print(best or "")
'
}

echo "Polling up to ${timeout}s for a Copilot window on THIS desktop/Space..." >&2
deadline=$(( $(date +%s) + timeout ))
winid=""
while [ "$(date +%s)" -lt "$deadline" ]; do
  winid="$(pick_largest)"
  [ -n "$winid" ] && break
  sleep 2
done
[ -n "$winid" ] || {
  echo "No Copilot window found on the active Space within ${timeout}s." >&2
  echo "Move the GitHub Copilot window onto this desktop/Space and retry." >&2
  exit 2
}

png="$out_dir/$base.png"
webp="$out_dir/$base.webp"

screencapture -x -l "$winid" "$png"
[ -s "$png" ] || { echo "Capture produced no file. Grant Screen Recording permission to the caller." >&2; exit 3; }

verdict="$(python3 - "$png" <<'PY'
import sys
from PIL import Image, ImageStat
s = ImageStat.Stat(Image.open(sys.argv[1]).convert("L"))
m, sd = s.mean[0], s.stddev[0]
print(f"mean={m:.1f} stddev={sd:.1f} verdict={'BLANK-or-Screen-Recording-denied' if sd < 3 else 'REAL-content'}")
PY
)"

if command -v cwebp >/dev/null 2>&1; then
  cwebp -quiet -q "$quality" -m 6 -metadata none "$png" -o "$webp"
elif command -v magick >/dev/null 2>&1; then
  magick "$png" -strip -quality "$quality" "$webp"
elif command -v ffmpeg >/dev/null 2>&1; then
  ffmpeg -hide_banner -loglevel error -y -i "$png" "$webp"
else
  echo "No WebP encoder found. Install cwebp, ImageMagick, or ffmpeg." >&2
  exit 4
fi

echo "png=$png ($(wc -c <"$png") bytes)"
echo "webp=$webp ($(wc -c <"$webp") bytes) quality=$quality"
echo "$verdict"
echo "REVIEW for private data (repo names, prompts, tokens) before committing to course assets."
