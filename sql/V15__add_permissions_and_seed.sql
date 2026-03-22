-- 1. Ensure permissions table exists and has the description column
CREATE TABLE IF NOT EXISTS permissions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- Note: V2 didn't have description. If it already exists, ADD it if missing.
DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='permissions' AND column_name='description') THEN
        ALTER TABLE permissions ADD COLUMN description VARCHAR(255);
    END IF;
END $$;

-- 2. Ensure role_permissions join table exists with correct constraints
CREATE TABLE IF NOT EXISTS role_permissions (
    role_id INTEGER NOT NULL,
    permission_id INTEGER NOT NULL,
    PRIMARY KEY (role_id, permission_id),
    CONSTRAINT fk_role_permissions_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    CONSTRAINT fk_role_permissions_permission FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE
);

-- 3. Seed Permissions (Idempotent)
INSERT INTO permissions (name, description) VALUES
('product:read', 'Allow viewing products'),
('product:write', 'Allow creating and editing products'),
('product:delete', 'Allow deleting products'),
('category:read', 'Allow viewing categories'),
('category:write', 'Allow managing categories'),
('order:read', 'Allow viewing order history'),
('order:ship', 'Allow updating order status to shipped'),
('user:manage', 'Allow managing users and roles')
ON CONFLICT (name) DO NOTHING;

-- 4. Seed Role Permissions (Admin: 1 gets everything)
INSERT INTO role_permissions (role_id, permission_id)
SELECT 1, id FROM permissions
ON CONFLICT DO NOTHING;

-- 5. Seed Role Permissions (Vendor: 2)
INSERT INTO role_permissions (role_id, permission_id)
SELECT 2, id FROM permissions WHERE name IN ('product:read', 'product:write', 'category:read', 'order:read', 'order:ship')
ON CONFLICT DO NOTHING;

-- 6. Seed Role Permissions (Customer: 3)
INSERT INTO role_permissions (role_id, permission_id)
SELECT 3, id FROM permissions WHERE name IN ('product:read', 'category:read', 'order:read')
ON CONFLICT DO NOTHING;
