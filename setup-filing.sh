#!/bin/bash
# One-time filing system setup for Daniel Vega's Mac.
# Run this in Terminal on your Mac (not in Claude Code):
#   bash ~/Downloads/setup-filing.sh
#
# Safe to re-run — all operations check before acting.

set -e

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

echo "=== Filing System Setup ==="
echo ""

# ── BbV folder structure ──────────────────────────────────────────────────────
mkdir -p "$ICLOUD/BbV/Brand Assets"
mkdir -p "$ICLOUD/BbV/Research"
mkdir -p "$ICLOUD/BbV/V"
echo "✓ BbV/ created in iCloud"

# ── Job Search (replaces "resume docs for apps") ──────────────────────────────
mkdir -p "$ICLOUD/Job Search/Master Resume & Cover Letter"
mkdir -p "$ICLOUD/Job Search/Active Applications"
echo "✓ Job Search/ created in iCloud"

if [ -d "$ICLOUD/resume docs for apps" ]; then
    shopt -s nullglob
    files=("$ICLOUD/resume docs for apps"/*)
    if [ ${#files[@]} -gt 0 ]; then
        mv "${files[@]}" "$ICLOUD/Job Search/Active Applications/"
        echo "✓ Moved contents of 'resume docs for apps' → Job Search/Active Applications/"
    fi
    rmdir "$ICLOUD/resume docs for apps" 2>/dev/null \
        && echo "✓ Removed old 'resume docs for apps' folder" \
        || echo "  Note: 'resume docs for apps' still has contents — check manually"
fi

# ── Move EYJ from Claude Code/ to Deez/ ──────────────────────────────────────
if [ -d "$ICLOUD/Claude Code/EYJ" ]; then
    mv "$ICLOUD/Claude Code/EYJ" "$ICLOUD/Deez/EYJ"
    echo "✓ Moved EYJ → Deez/"
fi

if [ -d "$ICLOUD/Claude Code" ] && [ -z "$(ls -A "$ICLOUD/Claude Code" 2>/dev/null)" ]; then
    rmdir "$ICLOUD/Claude Code"
    echo "✓ Removed now-empty Claude Code/ folder"
fi

# ── Clean up home directory ───────────────────────────────────────────────────
if [ -d "$HOME/mkdir" ] && [ -z "$(ls -A "$HOME/mkdir" 2>/dev/null)" ]; then
    rmdir "$HOME/mkdir"
    echo "✓ Deleted ~/mkdir/ (accidental empty folder)"
fi

# Move loose brainstorm/test files from home to BbV/Research
for f in "$HOME"/brainstorm-test*.txt "$HOME"/brainstorm-test*.md \
          "$HOME"/test-*.txt "$HOME"/test-*.md; do
    if [ -f "$f" ]; then
        mv "$f" "$ICLOUD/BbV/Research/"
        echo "✓ Moved $(basename "$f") → BbV/Research/"
    fi
done

echo ""
echo "=== Done ==="
echo "Open iCloud Drive in Finder to verify the new structure."
echo "Still to do: sort ~/Downloads, ~/Desktop, ~/Documents (see cleanup script)"
