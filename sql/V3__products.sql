CREATE TABLE products (
    id UUID PRIMARY KEY,
    name VARCHAR(200),
    description TEXT,
    price NUMERIC,
    stock INT,
    vendor_id UUID REFERENCES users(id)
);