DROP TABLE IF EXISTS chat_messages;
DROP TABLE IF EXISTS payment_banks;
DROP TABLE IF EXISTS payment_gateways;
DROP TABLE IF EXISTS admin_accounts;
DROP TABLE IF EXISTS about_content;
DROP TABLE IF EXISTS content_items;
DROP TABLE IF EXISTS audit_logs;
DROP TABLE IF EXISTS expenses;
DROP TABLE IF EXISTS donations;
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS programs;

CREATE TABLE programs (
    id TEXT PRIMARY KEY,
    slug TEXT NOT NULL,
    title TEXT NOT NULL,
    category TEXT NOT NULL,
    description TEXT,
    target INTEGER NOT NULL,
    deadline TEXT,
    image TEXT,
    featured INTEGER DEFAULT 0,
    status TEXT DEFAULT 'ACTIVE',
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE campaigns (
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

CREATE TABLE donations (
    id TEXT PRIMARY KEY,
    code TEXT NOT NULL,
    program_id TEXT NOT NULL,
    donor_name TEXT,
    donor_email TEXT,
    donor_phone TEXT,
    amount INTEGER NOT NULL,
    payment_method TEXT NOT NULL,
    status TEXT DEFAULT 'PENDING',
    is_anonymous INTEGER DEFAULT 0,
    notes TEXT,
    proof_url TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    verified_at TEXT,
    verified_by TEXT,
    reject_reason TEXT,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

CREATE TABLE expenses (
    id TEXT PRIMARY KEY,
    program_id TEXT NOT NULL,
    category TEXT NOT NULL,
    description TEXT NOT NULL,
    amount INTEGER NOT NULL,
    date TEXT NOT NULL,
    proof_url TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (program_id) REFERENCES programs(id)
);

CREATE TABLE audit_logs (
    id TEXT PRIMARY KEY,
    timestamp TEXT DEFAULT CURRENT_TIMESTAMP,
    user TEXT NOT NULL,
    action TEXT NOT NULL,
    details TEXT
);

CREATE TABLE content_items (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    slug TEXT NOT NULL,
    category TEXT NOT NULL,
    excerpt TEXT,
    body TEXT,
    image TEXT,
    published INTEGER DEFAULT 0,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE about_content (
    id TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT,
    image TEXT,
    sort_order INTEGER DEFAULT 0,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admin_accounts (
    id TEXT PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE app_settings (
    id TEXT PRIMARY KEY,
    name TEXT,
    app_name TEXT,
    tagline TEXT,
    address TEXT,
    phone TEXT,
    email TEXT,
    logo TEXT,
    facebook_url TEXT,
    instagram_url TEXT,
    youtube_url TEXT,
    tiktok_url TEXT,
    bank_bsi TEXT,
    bank_mandiri TEXT,
    qris_merchant TEXT,
    hero_image TEXT,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment_gateways (
    id TEXT PRIMARY KEY,
    default_method TEXT NOT NULL,
    qris_image TEXT,
    qris_label TEXT,
    active INTEGER DEFAULT 1,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment_banks (
    id TEXT PRIMARY KEY,
    gateway_id TEXT NOT NULL,
    name TEXT NOT NULL,
    account TEXT NOT NULL,
    holder TEXT NOT NULL,
    active INTEGER DEFAULT 1,
    FOREIGN KEY (gateway_id) REFERENCES payment_gateways(id)
);

CREATE TABLE chat_messages (
    id TEXT PRIMARY KEY,
    sender TEXT NOT NULL,
    text TEXT NOT NULL,
    role TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_donations_program_id ON donations(program_id);
CREATE INDEX idx_donations_status ON donations(status);
CREATE INDEX idx_expenses_program_id ON expenses(program_id);
CREATE INDEX idx_campaigns_program_id ON campaigns(program_id);
CREATE INDEX idx_campaigns_status ON campaigns(status);
CREATE INDEX idx_content_items_category ON content_items(category);
CREATE INDEX idx_content_items_published ON content_items(published);
CREATE INDEX idx_audit_logs_timestamp ON audit_logs(timestamp);
CREATE INDEX idx_chat_messages_created_at ON chat_messages(created_at);
