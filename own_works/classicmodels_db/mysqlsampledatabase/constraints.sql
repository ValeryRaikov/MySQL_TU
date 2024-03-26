-- PRIMARY KEY
CREATE TABLE products (
	id INT,
    name VARCHAR(100),
    year INT,
    price NUMERIC(10, 5)
);

ALTER TABLE products
ADD PRIMARY KEY (id);

CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    year INT,
    price NUMERIC(10, 5)
);

CREATE TABLE products (
	id INT AUTO_INCREMENT,
    name VARCHAR(100),
    year INT,
    price NUMERIC(10, 5),
    PRIMARY KEY (id)
);

-- FOREIGN KEY
CREATE TABLE commerce_shops (
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    address VARCHAR(100),
    start_time TIME,
    end_time TIME,
    CONSTRAINT fk_commerce_shops_products
    FOREIGN KEY (product_id)
		REFERENCES products(id)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE = INNODB;

ALTER TABLE commerce_shops
DROP FOREIGN KEY fk_commerce_shops_products;

CREATE TABLE commerce_shops (
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    address VARCHAR(100),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (product_id)
		REFERENCES products(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- DISABLE FOREIGN KEY CHECKS
SET foreign_key_checks = 0;

-- UNIQUE CONSTRAINT
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(100) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name, address)
);

DROP INDEX uc_name_address ON suppliers;

CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    egn VARCHAR(10) NOT NULL,
    job_title VARCHAR(50)
);

ALTER TABLE employees
ADD CONSTRAINT uc_employees_egn
UNIQUE (egn);

-- NOT NULL
ALTER TABLE employees
CHANGE
	job_title
    job_title VARCHAR(50) NOT NULL;

-- DEFAULT
CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARChar(50),
    full_name VARCHAR(100) GENERATED ALWAYS AS (CONCAT(first_name, ' ', last_name)),
    age INT DEFAULT 0,
    office_id INT DEFAULT 0,
    project_id INT DEFAULT 0
);

ALTER TABLE employees
ALTER COLUMN first_name SET DEFAULT '',
ALTER COLUMN last_name SET DEFAULT '',
ALTER COLUMN age SET DEFAULT 1;

ALTER TABLE employees
ALTER COLUMN first_name DROP DEFAULT,
ALTER COLUMN last_name DROP DEFAULT;

-- CHECK
CREATE TABLE parts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    quantity INT NOT NULL CHECK (quantity >= 0)
);

CREATE TABLE parts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(50),
    cost DECIMAL(10,2 ) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT ck_parts_cost
        CHECK(cost > 0),
    CONSTRAINT ck_parts_price
        CHECK(price > 0),
    CONSTRAINT ck_parts_quantity 
        CHECK(quantity >= 0)
);

ALTER TABLE parts 
DROP CONSTRAINT ck_parts_cost,
DROP CONSTRAINT ck_parts_price,
DROP CONSTRAINT ck_parts_quantity;