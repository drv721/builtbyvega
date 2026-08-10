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

### 2026-08-10 (iteration 2 — v14, Daniel's direct feedback)
- **V split mark colors now follow the headline + tagline** in both themes: `--split-a:var(--ink)` (headline), `--split-b:var(--accent)` (tagline) — no more navy/ember in the V.
- **Wave divider = accent orange (`var(--accent)`) in light, ice (`#D2E8E3`) in dark.**
- **Section order changed** (was: Two paths → Work → Services → About): now **Hero → The work → The studio → What we build → Choose your path → Contact**.
- Nav chips relabeled to match (WORK / THE STUDIO / WHAT WE BUILD / CONTACT); section indexes renumbered / 02–/ 05.
- Built via `build_v14.py` script from v13 source. File: `bbv_landing-v14.html` → synced to repo `index.html`.
### 2026-08-10 (iteration 3 — v15, Daniel's direct feedback)
- **The studio moved ABOVE the work** — new order: **Hero → The studio → The work → What we build → Choose your path → Contact**. Indexes renumbered (/ 02 = The studio, / 03 = The work); nav chips flipped to THE STUDIO / WORK / WHAT WE BUILD / CONTACT.
- **"activated" in the leading tagline is now underlined** with the logo-creation treatment: `.underline-mark` — a 4px accent line at 92% under the word (`background-image` method, matching the step1 landing variants).
- **The sputnik white box is filled**: the `visual-card` in The studio (previously just the V-star SVG alone) now carries a status stack — “V active” (pulsing dot), and the line “Daniel runs the studio. V runs the tools.” — real content, no fabricated stats.
- **The V split now sits exactly at the stroke seam**: gradient changed from `100deg` → `72deg` (diagonal following the right stroke's inner edge), stops `50.5% / 49.5%`. Verified by pixel-map: left stroke fully ink, right stroke FULLY accent orange, apex cut clean — no orange creep onto the left arm.
- **Wave mark now has color variants** (accent / verdigris / ice), driven by a `--wave` token (light + dark each). The three looks render as separate files so Daniel can pick:
  - `bbv_landing-v15.html` (default) + `bbv_landing-v15-wave-accent.html` — light = accent orange, dark = ice
  - `bbv_landing-v15-wave-verdigris.html` — verdigris `#2F6F6A` in both themes
  - `bbv_landing-v15-wave-ice.html` — ice `#D2E8E3` in both themes
- Built via `build_v15.py` from v14 source. Files: `bbv_landing-v15*.html` → synced to repo `index.html` (base v15).


## Verification state (2026-08-10, v15)
- Local preview served at `http://127.0.0.1:8787/bbv_landing-v15.html` (base) + `bbv_landing-v15-wave-{accent,verdigris,ice}.html` (wave looks); repo copy at `/bbv-repo/index.html`
- Headless render: order ABOUT→WORK→SERVICES→TWO PATHS in DOM (studio above work), indexes / 02–/ 05, themes apply (light + dark screenshots on Desktop: bbv-v15-*.png, incl. per-wave variants)
- V fold pixel-verified: left stroke ink, right stroke fully orange, clean seam at apex (72deg)
- Wave variants render distinct (checksums differ per color, light AND dark)
- Live links verified: murakami (301→/), red.builtbyvega.com (200), meals.html (200), red-api feed (200 JSON), builtbyvega.com (200)

## Open items
- [ ] Daniel reviews v15 (Desktop previews + localhost): pick wave color (accent / verdigris / ice) → anything to change
- [ ] Deploy to Cloudflare Workers (needs token + Daniel's go)
- [ ] Stage 2: "What's Your Idea?" V-backend centerpiece, logo via OpenDesign, contact form backend, real case-study depth