-- Add role_id to users
ALTER TABLE users ADD COLUMN role_id INTEGER;

-- Migrate existing roles (picking the first one if multiple exist)
UPDATE users u
SET role_id = (SELECT role_id FROM user_roles ur WHERE ur.user_id = u.id LIMIT 1);

-- Set default role for those without one (3 = Customer)
UPDATE users SET role_id = 3 WHERE role_id IS NULL;

-- Add foreign key constraint
ALTER TABLE users ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES roles(id);

-- Drop the mapping table
DROP TABLE user_roles;
