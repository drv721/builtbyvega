# DESIGN.md — builtbyvega.com
> **Claude Code reads this before every build session.**
> Last updated: 2026-04-28

---

## Brand Identity

| | |
|---|---|
| **Project** | builtbyvega.com |
| **Tagline** | Built by Vega. Runs by V. |
| **Positioning** | I help people — brands, nonprofits, and SMBs — do the things they dream of, so they can focus on the things they do best. |
| **Owner** | Daniel R. Vega, Chicago IL |
| **Story angle** | The AI-augmented marketer who builds what others just talk about. |

---

## Color Tokens

```css
:root {
  --color-navy:      #002D72;  /* Primary brand — dark section base */
  --color-navy-deep: #001a44;  /* Darker navy for V/tools section */
  --color-orange:    #FF5910;  /* Accent — CTAs, highlights, live indicators */
  --color-white:     #FFFFFF;
  --color-off-white: #F5F5F5;  /* Light section backgrounds */
  --color-dark:      #111111;  /* Work section base */
  --color-mid:       #444444;  /* Body text on light sections */
  --color-border:    #CCCCCC;
}
```

**Palette approach (hybrid):**
- **Dark sections** (Hero, Work, V/Tools): `--color-navy` or `--color-dark` base + orange accents + white type
- **Light sections** (Services, About, Contact): `--color-white` / `--color-off-white` base + navy type + orange accents
- `prefers-color-scheme` auto-detection: no toggle required; both modes adapt within this palette

---

## Typography

```css
--font-display: 'Syne', sans-serif;       /* 700 / 800 — headlines, card titles, section titles */
--font-body:    'Inter', system-ui, sans-serif; /* 300 / 400 / 500 / 600 — all body copy */
--font-mono:    'JetBrains Mono', monospace;    /* 400 / 500 — V references, eyebrows, tags, code */
```

**Google Fonts import:**
```html
<link href="https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=Inter:ital,wght@0,300;0,400;0,500;0,600;1,300&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
```

**Type scale:** 12 / 14 / 16 / 20 / 24 / 32 / 48 / 64 / 80px

**Eyebrow labels:** `font-mono`, 11px, `letter-spacing: .2em`, uppercase, color: `--color-orange`
**Section titles:** `font-display`, 800, `clamp(36px, 5vw, 60px)`, `letter-spacing: -.025em`
**Hero headline:** `font-display`, 800, `clamp(56px, 10.5vw, 112px)`, `letter-spacing: -.03em`

---

## Layout

```css
--max-w:    1200px;   /* Max content width */
--pad-v:    clamp(48px, 8vw, 96px);   /* Section vertical padding */
--pad-h:    clamp(20px, 5vw, 48px);   /* Section horizontal padding */
```

- **Grid:** 12-column, 24px gutters
- **Inner wrapper:** `max-width: var(--max-w); margin: 0 auto;`
- **Card stack perspective:** `perspective: 1400px`

---

## Interaction Principles

- **Rotating 3D card stack** — Work section hero. Manually controllable + auto-rotation (4.2s). Pause on hover. Touch swipe on mobile.
- **Scroll-triggered reveals** — `IntersectionObserver`, `threshold: 0.08`, `opacity 0→1` + `translateY(28px→0)`, `.75s ease`
- **Hover states** — subtle `translateY(-2px)` on cards, `border-color` + `color` shift on links/buttons
- **No autoplay audio/video**
- **Mobile-first** — iPhone Safari is primary target. All interactions work via touch.

---

## Section Order

| # | Section | Dark/Light | Status |
|---|---------|-----------|--------|
| 01 | Hero | Dark (navy) | Phase 1 |
| 02 | Work / Card Stack | Dark (dark) | Phase 1 |
| 03 | Services | Light (off-white) | Phase 1 placeholder |
| 04 | About | Light (white) | Phase 1 placeholder |
| 05 | V / AI Tools | Dark (navy-deep) | Phase 1 |
| 06 | Contact | Light (off-white) | Phase 1 |

---

## Logo

> Status: **not final**. Use `BbV` block text (`font-display`, 800) until logo is locked.

```html
<!-- Current logo markup -->
<a href="#" class="nav-logo">Bb<em style="color: var(--color-orange); font-style: normal;">V</em></a>
```

When the final logo lands: replace with `<img>` referencing the SVG asset. Update this section with the file path and usage rules.

---

## Voice / Copy Principles

- First person, direct
- No buzzwords: "synergy", "leverage", "holistic", "full-stack solutions"
- Short sentences. Strong verbs.
- Show the work. Let results speak.
- CTAs: action-first ("Let's build something" not "Submit")
- Confidence without arrogance — built, not assembled

---

## Live Links

| Project | URL |
|---------|-----|
| My Plan App | https://drv721.github.io/claude-apps/meals.html |
| Southside Drops | https://drv721.github.io/murakami |

---

## Open Items (update as resolved)

| Item | Priority | Phase |
|------|----------|-------|
| Logo — finalize with Claude Design + these tokens | High | 1 |
| Hero subhead final copy | High | 1 |
| Headshot / illustration for About section | Medium | 2 |
| Services tiers pricing (after BbV positioning research) | Medium | 2 |
| T-Mobile UFC NY case study written | Medium | 2 |
| 3D card stack fully built (Southside Drops, My Plan, UFC NY) | High | 2 |
| V section demo / walkthrough format | Medium | 2 |
| V monitors contact form → intake survey | Low | 3 |
| Visitor analytics (Cloudflare, no cookies) | Low | 2 |
