INSERT INTO categories (id, name, description) VALUES 
(gen_random_uuid(), 'Electronics', 'Gadgets, appliances, and tech accessories.'),
(gen_random_uuid(), 'Clothing', 'Fashionable apparel for men, women, and children.'),
(gen_random_uuid(), 'Home & Kitchen', 'Furniture, cookware, and home decor.'),
(gen_random_uuid(), 'Books', 'A wide range of fiction, non-fiction, and educational books.'),
(gen_random_uuid(), 'Beauty & Personal Care', 'Skincare, makeup, and grooming products.'),
(gen_random_uuid(), 'Sports & Outdoors', 'Gear for fitness, camping, and sports activities.'),
(gen_random_uuid(), 'Toys & Games', 'Fun and educational toys for all ages.')
ON CONFLICT (name) DO NOTHING;
