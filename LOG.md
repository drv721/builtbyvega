# Built by Vega — Daily Log

## 2026-04-28

### Initial site

- Created `index.html` — coming soon page (self-contained bundle, no src/ directory)

### Cloudflare Workers deployment

- Added `wrangler.jsonc` — deploys to Cloudflare Workers as a static site via Wrangler
- Added `.gitignore`
- Key settings: `compatibility_date: 2026-04-21`, `nodejs_compat`, observability enabled

### Claude Code setup

- Created `CLAUDE.md` — project context, brand, rules of engagement
- Created `.claude/settings.json` — permission allowlist, PreToolUse safety guard
- Created `.claude/hooks/session-start.sh` — runs at session start; reports branch, uncommitted changes, unpushed commits, Wrangler availability
- Configured Cloudflare and GitHub MCP servers in `~/.claude.json`

### Playbook (CLAUDE.md)

- Added design skill routing table: `/huashu-design`, `/impeccable`, `/taste`,
  `/ui-ux-pro-max`, `/playwright`, `/design-review`

---

## 2026-05-04

### Formatting hooks

- Added `PostToolUse` hooks to `.claude/settings.json` that run after every file write:
  - `prettier --write` — auto-formats files (active; reformatted `index.html` on first run)
  - `eslint --fix` — silent until `eslint.config.js` is added
  - `tsc --noEmit` — silent until `tsconfig.json` is added
- Added stop hook (`~/.claude/stop-hook-git-check.sh`) — blocks session exit if uncommitted changes exist

### Agent teams

- Enabled `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in `.claude/settings.json`
- Allows spawning parallel Claude sessions for independent subtasks
- Launch by asking: _"Create a team of three agents to review X, Y, Z"_

### Playbook (CLAUDE.md)

- Expanded "Session Start Hook" → "Hooks" section covering all three configured hooks
- Added "Agent Teams" section
