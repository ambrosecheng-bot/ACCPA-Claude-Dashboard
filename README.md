# Claude Playbook Dashboard
**Adonis Chu CPA & Associates Limited**

A lightweight, static project dashboard to monitor the firm's AI implementation progress — hosted on GitHub Pages, no server required.

---

## Files

| File | Purpose |
|---|---|
| `index.html` | Main dashboard — overview, KPIs, operations table, decisions |
| `phase1.html` | Phase 1 · Efficiency — detail page |
| `phase2.html` | Phase 2 · Data Visualisation — detail page |
| `phase3.html` | Phase 3 · Client Acquisition — detail page |
| `style.css` | Brand colours and layout (green `#03692F` on white) |
| `data.json` | **All project data — edit this file to update the dashboard** |

---

## Updating progress

All progress data lives in **`data.json`**. You never need to touch the HTML files for routine updates.

### What you can change in `data.json`

```json
// Update overall progress
"overallProgress": 35,

// Update a phase's progress % and status
"progress": 60,
"status": "active",   // "active" | "pending" | "done"

// Update an operation's status
"status": "in-progress",   // "not-started" | "in-progress" | "done"

// Record actual hours saved once a pilot is complete
"actualHoursSaved": 5,

// Tick off a founding decision
"done": true,

// Update last-updated date
"lastUpdated": "2026-07-15"
```

### Adding a new operation

Either:
1. Click **"+ Add operation"** on the main dashboard (session-only — copy the console output to `data.json`), or
2. Directly add a new object to the `"operations"` array in `data.json` following the existing structure.

---

## Publishing to GitHub Pages

### First time

1. Create a new GitHub repository (e.g. `claude-playbook-dashboard`)
2. Upload all 6 files to the repository root
3. Go to **Settings → Pages**
4. Under **Source**, select **Deploy from a branch**
5. Choose **main** branch, **/ (root)** folder
6. Click **Save**
7. Your dashboard will be live at `https://<your-username>.github.io/claude-playbook-dashboard/`

### Updating

1. Edit `data.json` locally with the latest progress
2. Commit and push (or upload via GitHub web UI)
3. GitHub Pages rebuilds automatically — live within ~60 seconds

### Keeping it private (optional, for later)

GitHub Pages on a **public** repository is visible to anyone with the URL. Options to restrict access:
- Make the repository **private** and use a GitHub Pro / Team account (Pages on private repos requires paid plan)
- Add a simple password overlay (JavaScript-based — note: not cryptographically secure)
- Move to Netlify + Netlify Identity for proper access control

---

## Colour palette

| Token | Hex | Use |
|---|---|---|
| Brand green | `#03692F` | Primary accent, headers, circles |
| Dark green | `#024A21` | Headings, sidebar |
| Mid green | `#3E8E5E` | Supporting elements |
| Light tint | `#EAF3EC` | Card backgrounds, badges |
| Amber | `#C8860A` | In-progress / Med risk |
| Text | `#1E2B23` | Body copy |
| Muted | `#5C6B62` | Secondary text |

---

## Compliance note

This dashboard contains internal implementation progress data only. No client financial data, personal data, CDD information or STR-related content should ever be recorded here.

---

*"Whatever your hand finds to do, do it with all your might." · Ecclesiastes 9:10*
