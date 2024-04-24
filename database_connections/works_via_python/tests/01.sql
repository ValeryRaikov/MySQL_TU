CREATE DATABASE test_db;

USE test_db;

CREATE TABLE IF NOT EXISTS products(
	id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT,
    price INT
);

INSERT INTO products (quantity, price)
VALUES 
	(4, 10),
    (7, 15);

CREATE OR REPLACE VIEW products_view AS
SELECT quantity, price, quantity * price AS total
FROM products;

SELECT * FROM products_view;

CREATE TABLE IF NOT EXISTS stores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(100)
);

INSERT INTO stores (name, location)
VALUES 
	('First shop', 'Sofia'),
    ('Second shop', 'Varna');

ALTER TABLE products 
ADD COLUMN store_id INT,
ADD CONSTRAINT 
	FOREIGN KEY(store_id)
    REFERENCES stores(id);

UPDATE products
SET store_id = 1
WHERE id = 1;

UPDATE products
SET store_id = 2
WHERE id = 2;

CREATE OR REPLACE VIEW products_stores_views AS
SELECT p.quantity, p.price, p.quantity * p.price AS total, s.name, s.location
FROM products AS p 
JOIN stores AS s 
ON p.store_id = s.id; 

SELECT * FROM products_stores_views;