ALTER TABLE orders 
ADD COLUMN shipping_full_name VARCHAR(100),
ADD COLUMN shipping_address VARCHAR(255),
ADD COLUMN shipping_city VARCHAR(100),
ADD COLUMN shipping_zip_code VARCHAR(20),
ADD COLUMN shipping_country VARCHAR(100),
ADD COLUMN payment_status VARCHAR(50),
ADD COLUMN payment_method VARCHAR(50);
