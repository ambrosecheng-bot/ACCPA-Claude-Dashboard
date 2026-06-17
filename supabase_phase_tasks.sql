-- ── phase_tasks table ──────────────────────────────────────
-- Run in Supabase SQL Editor (safe to run multiple times)

CREATE TABLE IF NOT EXISTS phase_tasks (
  id         SERIAL PRIMARY KEY,
  phase_id   INTEGER NOT NULL,
  date       TEXT NOT NULL,
  task       TEXT NOT NULL,
  added_by   TEXT DEFAULT '',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add added_by if table already exists without it
ALTER TABLE phase_tasks ADD COLUMN IF NOT EXISTS added_by TEXT DEFAULT '';

-- RLS
ALTER TABLE phase_tasks ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Allow anon all" ON phase_tasks;
CREATE POLICY "Allow anon all" ON phase_tasks
  FOR ALL USING (true) WITH CHECK (true);

-- Pre-populate Phase 1 tasks (skip if already present)
INSERT INTO phase_tasks (phase_id, date, task, added_by)
SELECT 1, '11 Jun 2026 (Thu)', 'Team meeting', 'Ambrose'
WHERE NOT EXISTS (SELECT 1 FROM phase_tasks WHERE task = 'Team meeting');

INSERT INTO phase_tasks (phase_id, date, task, added_by)
SELECT 1, '12 Jun 2026 (Fri)', 'VPN and Claude (team plan) subscribed', 'Ambrose'
WHERE NOT EXISTS (SELECT 1 FROM phase_tasks WHERE task = 'VPN and Claude (team plan) subscribed');
