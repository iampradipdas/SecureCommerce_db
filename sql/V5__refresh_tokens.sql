CREATE TABLE refresh_tokens (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    token TEXT,
    expiry_date TIMESTAMP,
    is_revoked BOOLEAN DEFAULT FALSE
);