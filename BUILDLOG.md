# BUILDLOG — Built by Vega

Session-by-session record of what was built, changed, or decided.

---

## 2026-05-10 — Filing system, dashboard v3, skills install

**Branch:** `claude/add-context-mode-plugin-eWyVo` → merged to main

### What was built

**Filing system**
- Created `FILING.md` — master routing doc mapping every project/file type to its correct destination (GitHub vs. iCloud folder)
- Created `setup-filing.sh` — one-time Mac script to build the iCloud folder structure: `BbV/`, `Job Search/`, `Deez/EYJ/`, `DV/Medical`, `DV/Mateo`
- Created `cleanup-sorting.sh` — ~300 file sort script covering Downloads, Desktop, and Documents: Firefly renders → `BbV/Brand Assets/`, resumes/CLs → `Job Search/`, EYJ files → `Deez/`, medical → `DV/Medical`, IEP docs → `DV/Mateo`, Welcome.US → `Archive/Welcome-US/`
- Added Filing System section to `CLAUDE.md` so Claude routes files correctly in every future session

**Dan's Playbook**
- Pinned playbook location in `CLAUDE.md`: `iCloud/Learning/Dan's Playbook/`
- Claude Apps iCloud folder organized: courses → `Learning/`, BbV prototypes → `BbV/Research/`

**Dashboard v3** (`bbv-master-ecosystem_3.html`)
- Added Priority Queue nav tab — 4 phases: NOW (orange), NEXT (cyan), THEN (purple), LATER (muted)
- Priority Queue reuses existing task data and localStorage state — no duplication, syncs with Tasks tab
- Updated 6 task notes with installed skill tags: `/doc-coauthoring` on r1, `/mcp-builder` on v1+v7, `/xlsx` on f1, `/webapp-testing` on b3, v8 marked installed ✓

**Skills installed** (`npx skills add`)

| Skill | Source | Use case |
|-------|--------|----------|
| `cloudflare` | `cloudflare/skills` | Workers, KV, D1, R2 operations |
| `wrangler` | `cloudflare/skills` | Deploy and manage Cloudflare Workers |
| `claude-api` | `anthropics/skills` | Claude API patterns, prompt caching, tool use |
| `webapp-testing` | `anthropics/skills` | Browser testing and QA |
| `xlsx` | `anthropics/skills` | Read/write spreadsheets and CSV with pandas + openpyxl |
| `doc-coauthoring` | `anthropics/skills` | Structured doc collaboration: gather → refine → reader test |
| `mcp-builder` | `anthropics/skills` | Build MCP servers connecting Claude to external services |

All skills live in `.agents/skills/` and are symlinked to `.claude/skills/`. Hashes locked in `skills-lock.json`.

### Key decisions

- **Claude Design** ruled out for image work — token-burn too high for renders. Adobe Firefly confirmed as the render tool for Southside (Shogun line).
- **Memory MCP** deferred until V development begins — not enough cross-session context to justify it yet.
- **Tier 2 skills** installed same session (xlsx, doc-coauthoring, mcp-builder) — all from `anthropics/skills`.

### Still open

- Merge PR #2 (done in this session)
- Dashboard v3 — download from GitHub, replace version in `iCloud/BbV/Research/`
- Tier 2 skills decision resolved — all three installed
- `NEED TO MOVE - Vega Fam Photo Shoot.pptx` (2.27 GB) parked in iCloud root — decide destination

---
