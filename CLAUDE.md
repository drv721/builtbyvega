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

## Open PRs to be aware of

- **PR #1** — Cloudflare Workers autoconfig (`cloudflare/workers-autoconfig`) — not yet merged
- **PR #2** — Claude Code settings (`claude/add-context-mode-plugin-eWyVo`) — not yet merged

## Branch conventions

Feature/task branches use the prefix `claude/`.
Always develop on the designated branch and push before ending a session.

## Constraints

- No additional dependencies without explicit approval
- Keep `index.html` self-contained unless the architecture is intentionally changing
- Do not touch `wrangler.jsonc` without confirming deployment impact
- The private section (passion projects) is a future workstream — do not conflate it with the public portfolio/brand work
