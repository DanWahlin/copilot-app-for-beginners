# Capturing the Course Screenshots

The chapter READMEs are the **single source of truth** for which app screenshots
are still needed. Each pending shot is an HTML comment:

```html
<!-- app-screenshot: <description> -->
```

Nothing about the individual shots is hardcoded in this skill — they are
**discovered dynamically** from those comments, so this workflow keeps working as
chapters add, edit, or remove placeholders over time.

> From the repo root, with:
> `SK=.github/skills/github-copilot-app-automation/sample_codes/macos-accessibility`

## 1. Discover what's pending

```bash
bash "$SK/screenshots.sh" list
```

Lists every remaining `<!-- app-screenshot: ... -->` with its file, line, and
description. As shots are embedded, they drop off the list automatically.

## 2. Do them one at a time

Capture is semi-automated (a human navigates the app; the CLI has no
`navigate_to`), so process one shot per loop:

```bash
# a) Pick the next pending shot (prints description, a derived slug, assets dir,
#    and the exact capture/embed commands for THAT shot).
bash "$SK/screenshots.sh" next          # or: next 13   for a specific index

# b) Get the app to that state — sanitized training account, on the SAME macOS
#    Space as this terminal. Run the Node.js setup script first for data shots.

# c) Capture (PNG + WebP into the chapter's assets/). Use the slug from step (a),
#    or any name you prefer:
bash "$SK/capture-window.sh" <assets_dir> <slug> 40

# d) Review <assets_dir>/<slug>.webp for private data.

# e) Replace the placeholder with the embed:
bash "$SK/screenshots.sh" embed <file> <line> <slug>.webp "<alt text>"
```

`screenshots.sh next` prints the ready-to-paste commands for the current shot.
Re-run `screenshots.sh list` any time to see what's left.

## Which shots can be done when

Judge each shot from its description — don't rely on a stored list:

- **App-chrome shots** (settings tabs, composer, pickers, the new-automation
  form): capturable any time; no seeded data needed. Keep private panels (e.g.,
  the sidebar session list) out of frame, or capture from a clean account.
- **Data shots** (My work, issue/PR details, diffs, failing checks, run history,
  a live session or canvas): need the **training fork** with
  `node .github/scripts/setup-training-scenarios.js --yes` run, from a
  sanitized account.
- **Policy/build-gated shots** (Agent Merge, cloud automations, canvas authoring):
  capture when available; otherwise leave the placeholder as demo-only.

## Filenames

Derived at runtime from each shot's description (`screenshots.sh next` shows the
slug); override per shot by passing your own name. The captured `.webp` lands in
that chapter's `assets/`, and the chapter README references the `.webp`. Keep or
drop the `.png` source per the repo's asset convention.

## Privacy reminder

Real captures expose live project/session names, prompts, diffs, and possibly
tokens (see the redaction note in [app-ui-map.md](app-ui-map.md)). Always capture
from a sanitized account and review every image before committing.
