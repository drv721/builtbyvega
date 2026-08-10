# Built by Vega (builtbyvega.com)

Portfolio & brand site — builtbyvega.com.

**Stack:** Cloudflare Workers (wrangler) · static single-file HTML · AI-assisted builds
**Docs:** see `DESIGN.md` (design system) and `CLAUDE.md` (build conventions)
**Status:** live · stage-1 landing live (hero, two-path flip cards, work, services, about, contact) · stage-2 full build planned
**Theme:** light (navy/orange) + dark (observatory) with auto-by-hour + manual toggle

## Structure

`index.html` is the whole site — a self-contained single file (inline CSS + JS, no build step).
The previous ~1.7MB React-compiled bundle was replaced 2026-08-10 by the hand-built v13 page.

## Run locally

```bash
python3 -m http.server 8787
# then open http://127.0.0.1:8787/
```

## Deploy

Deployed to **Cloudflare Workers** as a static site via Wrangler (assets from project root):

```bash
npx wrangler deploy          # production
npx wrangler versions upload # non-production / preview
```

Config lives in `wrangler.jsonc`. Requires a Cloudflare API token (see Cloudflare inventory).
`builtbyvega.com` is Daniel's domain, live on Cloudflare, verified 2026-08-06.

## Design source of truth

`DESIGN.md` — theme tokens, type, section order, copy rules, verified live links.
Iteration history lives in `Vega/Deliverables/BbV-Design/` (v4→v13 landings, OpenDesign packs).