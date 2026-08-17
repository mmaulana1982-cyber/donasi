-- Migration: Add any pending schema adjustments
-- Run with: npx wrangler d1 execute donasi-db --remote --file=migration.sql

-- Example: Add missing columns or tables if needed
-- ALTER TABLE programs ADD COLUMN IF NOT EXISTS updated_at TEXT DEFAULT CURRENT_TIMESTAMP;

-- Ensure campaigns table exists with proper schema
CREATE TABLE IF NOT EXISTS campaigns (
    id TEXT PRIMARY KEY,
    program_id TEXT NOT NULL,
    title TEXT NOT NULL,
    slug TEXT NOT NULL,
    description TEXT,
    goal_amount INTEGER NOT NULL,
    raised_amount INTEGER DEFAULT 0,
    start_date TEXT,
    end_date TEXT,
    image TEXT,
    status TEXT DEFAULT 'ACTIVE',
    featured INTEGER DEFAULT 0,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

-- Add indexes for campaigns if they don't exist
CREATE INDEX IF NOT EXISTS idx_campaigns_program_id ON campaigns(program_id);
CREATE INDEX IF NOT EXISTS idx_campaigns_status ON campaigns(status);
