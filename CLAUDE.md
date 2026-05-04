# Built by Vega

"Ideas, activated." — a portfolio and brand-building site for Daniel Vega, demonstrating his ability to leverage AI to take a product, service, or idea and deliver it as a fully formed brand — complete with marketing strategy and campaign recommendations.

The site serves two audiences:

1. **Public** — hiring managers, recruiters, and consulting clients who want to see Daniel's AI-powered brand-building capabilities in action, delivered through **V**, his dedicated AI agent.
2. **Private** (to be built) — a personal hub for Daniel's passion projects: fantasy baseball, his wellness plan, his son's game builds, and others.

## Project structure

Single-file build output. `index.html` is a self-contained compiled bundle (~1.7MB) with HTML, CSS, JS, and assets base64-encoded and embedded via a manifest system. There is no separate `src/` directory in this repo — the bundle is the artifact.

Do not split or restructure the file layout unless explicitly asked.

## Brand

- Colors: `#002D72` (navy), `#FF5910` (orange accent), `#FAFAF7` (off-white background)
- Logo: chevron V-shape in navy with an orange circle on the upper-right arm
- Font: system stack (`-apple-system, BlinkMacSystemFont, sans-serif`)
- Tone: clean, minimal, confident

## Running locally

Open `index.html` directly in a browser, or serve it statically:

```bash
npx serve .
# or
python3 -m http.server
```

## Deployment

Deployed to **Cloudflare Workers** as a static site via Wrangler.

```bash
npx wrangler deploy          # production
npx wrangler versions upload # non-production / preview
```

Config lives in `wrangler.jsonc` (pending merge via PR #1). Key settings:

- `compatibility_date: 2026-04-21`
- `nodejs_compat` flag enabled
- Observability enabled
- Assets served from `.` (project root)

Cloudflare bindings (KV, D1, R2) are available but not yet configured.

## MCP Servers

Permanently configured in `~/.claude.json` (project scope):

| MCP                                       | Purpose                                                                                                                                                                                              |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Cloudflare** (`mcp.cloudflare.com`)     | Manage Workers, KV, D1, R2, Pages, and Wrangler directly from Claude Code. First use requires OAuth to authorize your Cloudflare account. Works best from project root where `wrangler.jsonc` lives. |
| **GitHub** (`api.githubcopilot.com/mcp/`) | Read/write issues, PRs, branches, and files. Used in every session — permanently configured so it's available outside CCR environments too.                                                          |

**Memory MCP**: Hold off until V development begins and there's sufficient cross-session context worth persisting.

## Hooks

Three hooks are configured in `.claude/settings.json`.

**SessionStart** — `.claude/hooks/session-start.sh` runs synchronously at session start:

- Current git branch
- Uncommitted/untracked file warnings
- Unpushed commit count
- Wrangler availability check

**Stop** — `~/.claude/stop-hook-git-check.sh` blocks session exit if there are uncommitted changes. Always commit and push before ending a session.

**PostToolUse (Edit|Write)** — Three formatters run automatically after every file write:

- `prettier --write` — reformats the file in place (confirmed working on `index.html`)
- `eslint --fix` — silent for now (no `eslint.config.js` yet)
- `tsc --noEmit` — silent for now (no `tsconfig.json` yet)

Prettier is the canonical formatter for this project — do not manually reformat files.

## Open PRs to be aware of

- **PR #1** — Cloudflare Workers autoconfig (`cloudflare/workers-autoconfig`) — not yet merged
- **PR #2** — Claude Code settings (`claude/add-context-mode-plugin-eWyVo`) — not yet merged

## Agent Teams

Enabled via `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in `.claude/settings.json`.

Allows spawning multiple coordinated Claude sessions in parallel — one lead directing several teammates on independent subtasks. Best for parallel research, reviewing separate concerns, or tackling independent features simultaneously. Avoid when tasks share files or depend on each other.

To launch, just ask in plain language: _"Create a team of three agents to review X, Y, and Z."_

- **Shift+Down** — cycle through active teammates
- **Ctrl+T** — toggle shared task list
- Experimental: uses more tokens, no session resumption for in-process teammates

## Branch conventions

Feature/task branches use the prefix `claude/`.
Always develop on the designated branch and push before ending a session.

## Constraints

- No additional dependencies without explicit approval
- Keep `index.html` self-contained unless the architecture is intentionally changing
- Do not touch `wrangler.jsonc` without confirming deployment impact
- The private section (passion projects) is a future workstream — do not conflate it with the public portfolio/brand work

## Rules of Engagement

Claude should proactively recommend the right model, tool, or skill for each task without waiting to be asked. Use this as a decision guide.

### Model selection

| Task type                                                                                             | Model                |
| ----------------------------------------------------------------------------------------------------- | -------------------- |
| Quick lookups, summarization, simple edits, one-liners                                                | Haiku 4.5            |
| Most coding tasks, feature work, debugging, PRs, research                                             | Sonnet 4.6 (default) |
| Architecture decisions, complex reasoning, brand/strategy work, anything involving V's output quality | Opus 4.7             |

If a task clearly warrants a different model than the one currently running, say so at the start of the response: _"This would be better handled by Opus — consider switching with /model."_

### Tool / interface selection

| Situation                                                                                                                   | Recommended tool                                                                                                                                                                         |
| --------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Writing, editing, or running code; git operations; file changes                                                             | **Claude Code** (CLI / IDE extension)                                                                                                                                                    |
| Brainstorming, copy, strategy, brand voice, V prompt design, long-form thinking                                             | **Claude.ai chat**                                                                                                                                                                       |
| Visual work — UI mockups, layouts, logos, brand assets, design iterations                                                   | **Claude Design** (claude.ai/design)                                                                                                                                                     |
| Real-time pairing, collaborative back-and-forth on a task                                                                   | **CoWork** (within Claude app)                                                                                                                                                           |
| Autonomous agent tasks; connecting messaging platforms (Slack, Discord, etc.) to Claude; running skills outside Claude Code | **OpenClaw** (openclaw.ai) — runs locally, own CLI and skills system. Note: Claude Pro/Max subscription usage cannot be piped through OpenClaw as of April 2026; use a separate API key. |

If the task is clearly better suited to a different interface, say so upfront rather than attempting it in the wrong context.

### Skill selection (Claude Code)

| Situation                                                  | Skill                       |
| ---------------------------------------------------------- | --------------------------- |
| Starting work in a new or unfamiliar repo                  | `/init`                     |
| Code changes feel sprawling or over-engineered             | `/simplify`                 |
| Pre-merge check on a feature branch                        | `/review`                   |
| Any auth, data handling, or API surface changes            | `/security-review`          |
| Permission prompts are getting repetitive                  | `/fewer-permission-prompts` |
| Need a recurring or automated task                         | `/loop`                     |
| New page, hi-fi mockup, prototype, animation, brand design | `/huashu-design`            |
| Polish existing UI (typeset, animate, colorize, layout)    | `/impeccable`               |
| Frontend looks generic or AI-ish                           | `/taste`                    |
| Need a UI style, color palette, or font pairing            | `/ui-ux-pro-max`            |
| Write or run Playwright browser tests                      | `/playwright`               |
| Visual QA before deploying                                 | `/design-review`            |

### Communication style

Daniel is a non-coder learning on the fly. Every response should reflect that:

- **Default to plain language.** Write like you're explaining to a smart friend who doesn't code, not a developer.
- **Always define technical terms** the first time they appear in a response. Put the definition in plain English immediately after the term — don't assume prior knowledge. Example: "a `branch` (a separate copy of the project you can edit without affecting the main version)."
- **Never assume familiarity** with terminal commands, git concepts, config file syntax, or developer tooling.
- **When giving instructions**, say _what to do_, _where to do it_, and _why it matters_ — all three.
- **If a simpler word exists, use it.** "Save and publish" instead of "commit and push." "Settings file" with the path, not just "config."

### General principles

- **Don't wait to be directed.** If the task warrants Opus, a different interface, or a specific skill, say so immediately.
- **One tool at a time.** Don't context-switch mid-task — flag the better tool and let Daniel decide.
- **V work defaults to Opus.** Any task involving V's brand output, strategy recommendations, or client-facing copy should use Opus 4.7.
- **Design work goes to Claude Design.** Don't attempt visual/layout work in Claude Code — flag it and redirect.
- **Private section work is separate.** Passion project tasks don't carry the same brand/quality bar as the public portfolio. Sonnet is fine there.

## Working Style

### Always be specific with directions

When giving instructions involving tools, terminals, or file locations, always specify exactly:

- **Which tool or interface** — e.g. "in the Claude Code terminal", "in claude.ai/design", "in the Claude app CoWork tab"
- **Which terminal or shell** — e.g. "open a new terminal in VS Code", "in the same Claude Code session terminal"
- **Exact file paths** — never just "the settings file"; always `/full/path/to/file`
- **Exact commands to run** — copy-pasteable, no ambiguity

Bad: "update the config file and run the install command"
Good: "Edit `~/.claude/settings.json`, then run `npm install` in the Claude Code terminal at `/home/user/builtbyvega`"

### Preview vs. write vs. commit are three separate steps

- **Preview** = show the content inline in the response. Do not write to disk.
- **Write** = create or edit files on disk. Only after Daniel says "looks good", "go ahead", or similar approval.
- **Commit** = stage and commit. Only after all files for the change are written and Daniel has seen them.

When showing a draft for review, end with: _"Ready to write this? Say 'go ahead' or tell me what to change."_
"Looks good" counts as approval to write and commit.

### Batch related changes

When a task involves multiple files (e.g. a config + a doc + a hook):

1. Write all files to disk first
2. Show a summary of what was written
3. Commit everything together in one commit — don't commit partial sets

### Ask before searching blindly

If Daniel says something is incomplete or missing and you've already done a thorough search, don't chain more tool calls assuming docs exist. Ask:
_"I searched X, Y, Z and found [summary]. What specifically is missing — I'll look for it directly."_

Let Daniel steer the search rather than exhausting every possible location speculatively.

### Never assume — look it up

If an unfamiliar tool, term, product, or technology is mentioned and you're not certain what it is, **look it up before responding**. Do not guess, infer from context, or note it as a possible typo. Use WebSearch to get a confident answer first.

This applies to: tool names, product names, CLI commands, platforms, features, integrations — anything where being wrong would send Daniel in the wrong direction.
