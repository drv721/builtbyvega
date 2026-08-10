# BbV Website — REBUILD log

> G1: state lives in files, not threads. This log is the locked-decision record for the builtbyvega.com build. Sessions die; this file doesn't.
> Repo: `drv721/builtbyvega` (clone used in build sessions: `~/OpenWorker/<workspace>/bbv-repo`)

## Budget envelope (G6)
Smallest shippable slice: stage-1 landing, single-file, deployable. Soft budget: one focused build session (no metering).

## Locked decisions (append only)

### 2026-08-06 (walkthrough — bbv_decisions_log.md, full record in Vega/Deliverables/BbV-Design/)
- Taglines: leading = "Ideas, activated." · brand line = "Built by Vega. Run by V." (run, singular)
- Type: EB Garamond 600 headline · Instrument Serif italic promise (set LARGER) · Inter body · JetBrains Mono accents
- "What's Your Idea?" centerpiece = stage 2 (needs V backend). Stage 1 ships without it.
- Logo: NOT final — text lockup + OpenDesign iterations
- Sequencing: no piecemeal deploys. Step 1 = landing w/ interactive element ASAP; Step 2 = full 6-section site at once
- Services: full T1/T2/T3 tiers (Strategy Sprint → Campaign Execution → V Deployment) in stage 2
- Domain: builtbyvega.com (live). Analytics: Cloudflare, deliberate + transparent

### 2026-08-07 (design brief v3 + step1 landings v4–v8, then OpenDesign round-3 prep)
- Color: **ORIGINAL navy #002D72 + orange #FF5910** won (over verdigris/harvest-java/slate explorations). Off-white #FAFAF7 12-col grid bg kept. Optional mint tertiary in stage 2.
- Hero that LANDED: centered "Ideas, activated." (not oversized) → two flip-path cards below (solid-color faces, no /01 /02 markers) → summary subhead, "That's where we come in." italic + orange
- Final card copy locked (see bbv_landing_design_brief_v3.html)
- Approved landing built: bbv_landing-step1 (navy + palette)

### 2026-08-10 (this session — v13 complete build)
- **Picked up from v12-standalone.html** (Desktop, the other chat's latest): full single-page — hero, two-path flip cards, capabilities, about, contact. Adopted it as the base.
- **Built v13 (bbv_landing-v13-complete.html):**
  - Added **Work section** (#work): Southside Drops, R.E.D. (red.builtbyvega.com), My Plan, "Your next thing" — every link VERIFIED live 2026-08-10 (curl 200/301)
  - Renamed capabilities → **Services** with the T1/T2/T3 tiers (Strategy Sprint / Campaign Execution / V Deployment)
  - Fixed About copy: "Daniel Vega, with V at the controls" (was "one AI partner" — read oddly)
  - Added email link `hello@builtbyvega.com`, nav anchor chips, reduced-motion support, meta description
  - Kept: light/dark theme system, split-V, wave divider, flip cards, notify-me
- **Repo rebuilt:** index.html = v13 (replaced 1.7MB stale React bundle), DESIGN.md + README + CLAUDE.md updated to reality.
- **Deploy: NOT DONE — awaiting Daniel's explicit go** (irreversible bucket rule). Command: `npx wrangler deploy` from bbv-repo.

## Verification state (2026-08-10)
- Local preview served at `http://127.0.0.1:8787/bbv_landing-v13-complete.html` (and repo copy at `/bbv-repo/index.html`)
- Headless render: all sections present, no JS errors, themes apply (light + dark screenshots on Desktop: bbv-v13-preview-*.png)
- Live links verified: murakami (301→/), red.builtbyvega.com (200), meals.html (200), red-api feed (200 JSON), builtbyvega.com (200)

## Open items
- [ ] Daniel reviews v13 (Desktop previews + localhost) → picks anything to change
- [ ] Deploy to Cloudflare Workers (needs token + Daniel's go)
- [ ] Stage 2: "What's Your Idea?" V-backend centerpiece, logo via OpenDesign, contact form backend, real case-study depth