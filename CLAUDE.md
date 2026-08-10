# CLAUDE.md — builtbyvega.com build conventions
> Update: 2026-08-10. This file reflects the current stack and conventions after the stage-1 rebuild.

## What this is
**Built by Vega (builtbyvega.com)** — "Ideas, activated." Portfolio & brand site for Daniel Vega, demonstrating AI-powered brand building delivered through **V**, his AI agent. Serves two audiences: public (hiring managers, clients) and future private (passion projects).

## Project structure (current)
**Single-file build output.** `index.html` is a self-contained page — HTML + CSS + JS inlined, no build step, no `src/` directory. Google Fonts is the only external dependency. Do not split or restructure the file layout unless explicitly asked.

## Brand (source: DESIGN.md — read it first)
- **Type:** EB Garamond 600 (headline) · Instrument Serif italic (tagline, set larger) · Inter (body) · JetBrains Mono (labels/accents)
- **Light theme:** bg `#F2F5FA` · navy `#002D72` · accent orange `#FF5910` · tertiary verdigris `#2F6F6A`
- **Dark theme:** space `#0E2433` · ember `#C65A2E` · ice `#EAF4F2` (mission-control observatory palette)
- **Split-V mark:** the "V" rendered half navy / half orange via `background-clip:text` — always, everywhere
- **Copy rules:** no period after "Vega"; "Run by V" (singular); max 2× brand name per viewport; no fake data/stats/case studies — real links only; avoid "small"

## Running locally
```bash
python3 -m http.server 8787   # then open http://127.0.0.1:8787/
```

## Deployment
Cloudflare Workers static site via Wrangler (assets from project root). `npx wrangler deploy` = production. Requires a Cloudflare API token. Domain: builtbyvega.com (Daniel's, live on Cloudflare).

## Conventions
- **Single self-contained file** — keep it that way; inline everything (CSS + JS), no external libs.
- **Real data only** — every project link must be verified live before adding/updating. Never invent case studies, stats, or testimonials.
- **Theme system is load-bearing** — light/dark via `html.light` / `html.dark` custom properties; auto-by-hour + manual toggle (localStorage `bbv_theme`), `?theme=` param. Preserve it.
- **Mobile-first** — iPhone Safari is the primary target. All interactions (flip cards, toggle, notify) must work via touch.
- **prefers-reduced-motion** respected.
- **No additional dependencies without explicit approval.** Keep `index.html` self-contained unless architecture intentionally changes. Do not touch `wrangler.jsonc` without confirming deployment impact.
- **Deploy is an irreversible bucket action** — requires Daniel's explicit go before running wrangler.

## State / handoff
Multi-session builds append locked decisions to the project's **REBUILD.md** at session close (G1: state lives in files, not threads). Iteration history + design variants live in `Vega/Deliverables/BbV-Design/`. Locked direction (2026-08-06 decisions log + 2026-08-07 design brief v3): navy/orange original palette, EB Garamond/Instrument Serif, two-path flip cards, notify-me, stage-2 "What's Your Idea?" centerpiece via V backend.

## Working style
Preview → write → commit are separate steps. Commit after Daniel approves content. Batch related changes into one commit. Plain language for Daniel (non-coder): define technical terms, give exact paths + commands.