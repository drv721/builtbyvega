#!/bin/bash
set -euo pipefail

# Only run in remote Claude Code sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"

echo "=== Built by Vega — Session Context ==="
echo ""

# Current branch
BRANCH=$(git -C "$PROJECT_DIR" branch --show-current 2>/dev/null || echo "unknown")
echo "Branch: $BRANCH"

# Working tree state
if ! git -C "$PROJECT_DIR" diff --quiet 2>/dev/null || ! git -C "$PROJECT_DIR" diff --cached --quiet 2>/dev/null; then
  echo "WARNING: Uncommitted changes present"
else
  echo "Working tree: clean"
fi

# Untracked files
UNTRACKED=$(git -C "$PROJECT_DIR" ls-files --others --exclude-standard 2>/dev/null)
if [ -n "$UNTRACKED" ]; then
  echo "WARNING: Untracked files: $UNTRACKED"
fi

# Unpushed commits
if git -C "$PROJECT_DIR" rev-parse "origin/$BRANCH" >/dev/null 2>&1; then
  UNPUSHED=$(git -C "$PROJECT_DIR" rev-list "origin/$BRANCH..HEAD" --count 2>/dev/null || echo "0")
  if [ "$UNPUSHED" -gt 0 ]; then
    echo "WARNING: $UNPUSHED unpushed commit(s) on $BRANCH"
  fi
fi

echo ""

# Wrangler availability check
if npx wrangler --version >/dev/null 2>&1; then
  WRANGLER_VER=$(npx wrangler --version 2>/dev/null)
  echo "Wrangler: $WRANGLER_VER (available)"
else
  echo "WARNING: Wrangler not available — deployment commands will fail"
fi

echo ""
echo "Ref: CLAUDE.md for project context, brand, constraints, and rules of engagement."
