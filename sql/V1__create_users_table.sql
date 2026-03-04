CREATE TABLE users (
    id UUID PRIMARY KEY,
    name VARCHAR(150),
    email VARCHAR(200) UNIQUE,
    password_hash TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);