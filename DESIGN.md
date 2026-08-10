# DESIGN.md — builtbyvega.com
> **Claude Code reads this before every build session.**
> Last updated: 2026-08-10 — reflects the shipped stage-1 build (v14, iteration 2).

---

## Brand Identity

| | |
|---|---|
| **Project** | builtbyvega.com |
| **Leading tagline** | "Ideas, activated." (top promise — set large, italic) |
| **Brand line** | "Built by Vega. Run by V." ("Run" singular) |
| **Positioning** | People-forward, tech-backed. A person using intelligent tools (the AI sub-agent "V") to build considered, purposeful, lasting things. |
| **Owner** | Daniel R. Vega, Chicago IL |
| **Story angle** | The AI-augmented marketer who builds what others just talk about. |

## The "V" mark
The sub-brand symbol: a simple geometric uppercase "V", split **headline / tagline** (clean 50% linear-gradient split — `--split-a:var(--ink)` (headline) on the left, `--split-b:var(--accent)` (tagline orange) on the right, in BOTH themes). Not a tech swoosh, not a gimmick. Appears:
- in the hero: the `V` in "Built by Vega" uses the split gradient (`.split-v`)
- the "V" is a *symbol*, never an extra text mention — max 2× brand name per viewport
- Rendered inline via CSS `background-clip:text` — no image asset needed

## Color Tokens

**Theme system:** the site ships with a light theme (original builtbyvega) + a dark theme (mission-control observatory). `html.light` / `html.dark` set CSS custom properties. Auto by local hour (dark 19:00–07:00), manual toggle ◐ in nav, persisted to `localStorage` (`bbv_theme`), `?theme=light|dark` URL param overrides.

### Light (default day)

```css
--bg:#F2F5FA; --bg-deep:#E6EBF3; --ink:#12203D; --ink-soft:#3A4A6B;
--navy:#002D72; --accent:#FF5910; --tert:#2F6F6A;
--line:rgba(18,32,61,0.14); --rule:rgba(0,45,114,0.14);
--surface:#FFFFFF; --on-accent:#FFFFFF;
--split-a:var(--ink); --split-b:var(--accent);   /* V follows headline + tagline */
```

### Dark (mission-control r1)

```css
--bg:#0E2433; --bg-deep:#0A1B27; --ink:#E8F0ED; --ink-soft:#D2E8E3;
--navy:#153544; --accent:#C65A2E; --tert:#2F6F6A;
--line:rgba(47,111,106,0.3); --surface:rgba(21,53,68,0.9); --on-accent:#0E2433;
--split-a:var(--ink); --split-b:var(--accent);   /* V follows headline + tagline */
```

**Tertiary accent:** verdigris `#2F6F6A` (mint/teal from the mission-control palette) — used for eyebrows, section labels, module accents.

## Typography

```css
--font-display: 'EB Garamond', Georgia, serif;  /* 600 — headlines, section titles */
--font-promise: 'Instrument Serif', Georgia, serif; /* italic — tagline, accents */
--font-body:    'Inter', system-ui, sans-serif;     /* 400/500/600 — body copy */
--font-mono:    'JetBrains Mono', monospace;        /* eyebrows, labels, tags */
```

**Google Fonts import (single link):**
```html
<link href="https://fonts.googleapis.com/css2?family=EB+Garamond:ital,wght@0,400;0,600;0,700&family=Instrument+Serif:ital@0;1&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

**Design rationale (approved direction):** heritage serif, people-forward. The headline moved off the thin sans (Inter Tight 500 was the disliked baseline) onto EB Garamond 600 — warm, bookish, humanist trust register. "Ideas, activated." is Instrument Serif italic, set **LARGER** than sub copy, as the contrast.

**Type scale:** 12 / 14 / 16 / 20 / 24 / 32 / 48 / 64 / 84px
- Section labels: mono 10px, `letter-spacing:.16em`, uppercase, `--tert`
- Hero headline: EB Garamond 600, `clamp(44px, 8vw, 84px)`, `-0.02em`
- Tagline: Instrument Serif italic, `clamp(26px, 5vw, 46px)`

## Layout

```css
--max-w: 1200px;   /* max content width */
--pad-v: clamp(48px, 8vw, 96px);
--pad-h: clamp(20px, 5vw, 48px);
```

- **12-column grid background** — vertical tie-lines via `.bg-grid` (fixed, `opacity:.45`, `calc(100%/12)`; 4 columns under 720px). Lines never extend above the top horizontal edge. This is the single most-praised element — keep it.
- Ambient radial glows via `.bg-glow` (themes' `--glow-1`/`--glow-2`).
- Mobile-first — iPhone Safari primary target.

## Interaction Principles

- **Two-path flip cards** — `#paths`. Two cards ("I have an idea" / "I need marketing"), each a 3D flip (`.inner` rotateY 180°, `.65s` cubic-bezier). Front = colored label; back = headline + body, second click returns. Tap-friendly.
- **Theme toggle** — sticky nav, persisted, auto-by-hour default.
- **Notify-me box** — `#contact`. Email validates (regex), on success form swaps to confirmation. No backend wired yet (stage-1).
- **No autoplay audio/video.**
- `prefers-reduced-motion` respected (all animations ~0).

## Section Order

| # | Section | id | Notes |
|---|---------|----|-------|
| 01 | Hero | — | "Build by V+" split-V, tagline, wave divider, promise, CTA |
| 02 | Work | `#work` | real project cards (Southside Drops, R.E.D., My Plan, "Your next thing") — first content section |
| 03 | The studio | `#about` | Daniel Vega with V at the controls; V-star SVG |
| 04 | What we build | `#services` | Strategy Sprint · Campaign Execution · V Deployment (T1/T2/T3 flywheel) |
| 05 | Choose your path | `#paths` | flip cards — the "what's missing is being found" moment |
| 06 | Contact | `#contact` | notify-me + email link |
| — | Footer | — | "Built by Vega · Run by V", `$ stage-1 · coming soon` |

**Wave divider** (`.wave-divider`, hero): stroke `var(--accent)` (orange) in light theme; `#D2E8E3` (ice) in dark theme — part of the observatory palette, never navy.

## Logo / lockup
Logo redesign tracked separately (OpenDesign) — **not final**. Site uses the text lockup "Built by Vega · Run by V" in EB Garamond with the split-V rendered via CSS. Favicon is a simple orange V stroke (inline SVG data URI).

## Voice / Copy Principles

- First person, direct. Short sentences. Strong verbs.
- No buzzwords: "synergy", "leverage", "holistic", "full-stack solutions". Avoid the word "small" — use considered, purposeful, lasting.
- No fake data, no invented case studies, no fabrication — real only (all project links verified live).
- Max 2× brand name per viewport.
- Headline reads "Built by Vega" — no period after "Vega."
- CTAs: action-first ("Let's build something" not "Submit").

## Live Links (verified 2026-08-10)

| Project | URL | Status |
|---------|-----|--------|
| Southside Drops | https://drv721.github.io/murakami/ | live |
| R.E.D. (app) | https://red.builtbyvega.com | live |
| R.E.D. (API) | https://red-api.builtbyvega.com/api/feed?tz=America/Chicago | live |
| My Plan | https://drv721.github.io/claude-apps/meals.html | live |

## Open Items (update as resolved)

| Item | Priority | Phase |
|------|----------|-------|
| Logo — new mark via OpenDesign | High | 2 |
| Contact form backend (Web3Forms / Cloudflare Worker) | Medium | 2 |
| Notify-me email actually capturing submissions | Medium | 2 |
| "What's Your Idea?" centerpiece (V backend, stage-2 hero) | High | 2 |
| Work section case-study depth (per-project pages) | Medium | 2 |
| Analytics (Cloudflare, deliberate + transparent) | Low | 2 |
| Stage-2 6-section depth: real pricing tiers | Medium | 2 |