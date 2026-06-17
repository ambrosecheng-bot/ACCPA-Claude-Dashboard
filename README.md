# ACCPA Claude Implementation Dashboard

**Adonis Chu CPA & Associates Limited**  
AI Implementation Playbook · Project Dashboard

Live site: https://ambrosecheng-bot.github.io/ACCPA-Claude-Dashboard/

---

## Overview

This dashboard tracks the firm's Claude AI implementation programme across four service lines. It provides a real-time view of operations being automated, time cost savings, task progress, and key decisions — backed by a Supabase PostgreSQL database.

---

## Features

### Operations by Business Unit
- 28 operations across four business units, grouped and colour-coded
- Collapsible by business unit with status (⚪ / 🟡 / 🟢), priority (P1–P5), and cost saved per year displayed inline
- Click any operation row to navigate directly to its detail view

| Business Unit | Ref Format | Operations |
|---|---|---|
| 🔍 Audit & Tax | A1.01 – A1.18 | 18 |
| 🧾 Accounting | A2.01 – A2.03 | 3 |
| 🏢 Company Secretary | A3.01 – A3.06 | 6 |
| 💬 Admin | A4.01 | 1 |

### Operations & Time Cost Saved
- Single-operation detail viewer (navigate via Operations by Business Unit)
- Shows ref, category, title, description, status, priority, and owner
- Inline time cost saved table: hours/job × hourly rate per grade (Staff / Manager / Partner) × number of jobs per year = **total annual cost saved**
- ✏️ Edit / ✓ Save buttons — no popup; edit directly in the record
- Status and priority editable via dropdown; changes sync to Supabase instantly

### Implementation Phases
- Three-phase rollout: ⚡ Efficiency · 📊 Visualisation · 📣 Acquisition
- Tasks completed table per phase with calendar date picker, task description, and **Added / Edited by** dropdown (team member selection)
- All tasks stored in Supabase `phase_tasks` table; localStorage fallback when offline

### Project Flight Map
- SVG cockpit-style flight map showing current position and planned waypoints
- Phase 1: Sep 2026 · Phase 2: Dec 2026 · Phase 3: Mar 2027

### Key Decisions
- Five founding decisions with tick-off status

---

## Database (Supabase)

**Project URL:** `https://ktniezsldanlvtwygrax.supabase.co`

### Tables

| Table | Purpose |
|---|---|
| `phase1_operations` | 28 operations with ref, name, category, priority, status |
| `time_cost_savings` | Hours/job, rates, jobs/year per operation per grade |
| `phase_tasks` | Tasks completed per implementation phase |

### SQL Setup Scripts (in this repo)

| File | Purpose |
|---|---|
| `supabase_rebuild_ops.sql` | Full rebuild of `phase1_operations` (28 rows) |
| `supabase_timecost.sql` | Create/update `time_cost_savings` table |
| `supabase_phase_tasks.sql` | Create/update `phase_tasks` table with `added_by` column |

Run each script in **Supabase → SQL Editor** in the order listed above.

---

## File Structure

```
ACCPA-Claude-Dashboard/
├── index.html                  # Main dashboard (Overview)
├── phase1.html                 # Phase 1 detail page
├── phase2.html                 # Phase 2 detail page
├── phase3.html                 # Phase 3 detail page
├── style.css                   # Brand styles (#03692F)
├── data.json                   # Static config: phases, decisions, team, operations
├── supabase_rebuild_ops.sql    # Rebuild phase1_operations table
├── supabase_timecost.sql       # Create time_cost_savings table
├── supabase_phase_tasks.sql    # Create phase_tasks table
└── README.md                   # This file
```

---

## Team

| Name | Role |
|---|---|
| Adonis Chu | CPA Partner · Sign-off authority |
| Ambrose Cheng | Planning Consultant |
| May Cheung | Manager — Co-Sec & Admin |
| Jaden | Audit Staff |
| Diana | Accounting Staff |

---

## Technology

- **Frontend:** Vanilla HTML / CSS / JavaScript (no framework)
- **Hosting:** GitHub Pages
- **Database:** Supabase (PostgreSQL, free tier)
- **API:** Supabase REST API via native `fetch()` — no JS client library
- **AI Platform:** Anthropic Claude (Team Plan, 4 seats)

---

## Deployment

1. Upload all files to this GitHub repository
2. Enable **GitHub Pages** under Settings → Pages → Source: `main` branch / root
3. Run the three SQL scripts in Supabase SQL Editor
4. Add `https://ambrosecheng-bot.github.io` to Supabase → Settings → API → Allowed Origins

---

*Last updated: June 2026*
