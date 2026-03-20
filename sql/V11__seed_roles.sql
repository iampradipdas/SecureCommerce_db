INSERT INTO roles (name) VALUES ('Admin'), ('Vendor'), ('Customer') ON CONFLICT (name) DO NOTHING;
