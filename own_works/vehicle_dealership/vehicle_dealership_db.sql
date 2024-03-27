DROP DATABASE IF EXISTS vehicle_dealership;

CREATE DATABASE vehicle_dealership;

USE vehicle_dealership;

CREATE TABLE factories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(100),
    end_contract_date DATE NOT NULL,
    production_ratio BIGINT
);

CREATE TABLE engines(
	id INT AUTO_INCREMENT PRIMARY KEY,
	vin VARCHAR(30) NOT NULL UNIQUE,
    engine_type VARCHAR(100) NOT NULL,
    fuel_type ENUM(
		'petrol',
        'diesel',
        'electric'
    ),
    fuel_consumption DECIMAL(2, 2) NOT NULL CHECK (fuel_consumption > 0),
    horse_power INT CHECK (horse_power > 60)
);

CREATE TABLE customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    egn VARCHAR(10) NOT NULL UNIQUE,
    phone_number VARCHAR(10) NOT NULL,
    iban VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE vehicles(
	id INT AUTO_INCREMENT PRIMARY KEY,
    engine_id INT,
    customer_id INT, 
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    year INT NOT NULL CHECK (year >= 2000),
    mileage INT NOT NULL CHECK (mileage > 0 ),
    price DECIMAL(10, 2) NOT NULL CHECK (price > 5000),
    FOREIGN KEY (engine_id)
		REFERENCES engines(id)
        ON UPDATE SET NULL
        ON DELETE SET NULL,
	FOREIGN KEY (customer_id)
		REFERENCES customers(id)
        ON UPDATE SET NULL
        ON DELETE SET NULL
);

CREATE TABLE dealerships(
	id INT AUTO_INCREMENT PRIMARY KEY,
    vehicle_id INT,
    factory_id INT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    start_time TIME, 
    end_time TIME,
    FOREIGN KEY (vehicle_id)
		REFERENCES vehicles(id)
        ON UPDATE SET NULL 
        ON DELETE SET NULL,
	FOREIGN KEY (factory_id)
		REFERENCES factories(id)
        ON UPDATE SET NULL
        ON DELETE SET NULL
);

-- queries
SELECT 
	v.make,
    v.model,
    v.year,
    v.mileage,
    e.engine_type,
    e.fuel_type,
    e.fuel_consumption,
    e.horse_power,
    v.price
FROM vehicles v
INNER JOIN engines e
	ON v.engine_id = e.id
WHERE
	v.year > 2015 AND 
    v.mileage < 150000 AND
    e.fuel_type = 'diesel'
ORDER BY 
	v.price,
    v.mileage;

SELECT 
    CONCAT_WS(' ', c.first_name, c.last_name) AS full_name,
    c.phone_number,
    c.iban,
    v.make,
    v.model,
    v.year,
    v.mileage,
    v.price
FROM customers c
INNER JOIN vehicles v
	ON c.id = v.customer_id
WHERE
	v.make = 'Volkswagen' AND
    v.price < 25000
ORDER BY 
	full_name;

SELECT 
    CONCAT_WS(' ', c.first_name, c.last_name) AS full_name,
    c.phone_number,
    v.make,
    v.model,
    v.year,
	e.fuel_type,
    e.horse_power
FROM customers c
INNER JOIN vehicles v
	ON c.id = v.customer_id
INNER JOIN engines e
	ON v.engine_id = e.id
WHERE
	e.fuel_type = 'electric'
ORDER BY 
	e.horse_power DESC;

SELECT 
    CONCAT_WS(' ', v.make, v.model) AS make_model,
    v.year,
    v.mileage,
    e.vin,
	e.fuel_type,
    e.horse_power,
    d.name,
    d.location,
    d.start_time
FROM vehicles v
INNER JOIN engines e
	ON v.engine_id = e.id
INNER JOIN dealerships d
	ON v.id = d.vehicle_id
ORDER BY 
	d.name,
    make_model;

SELECT 
    d.name,
    d.location,
    d.start_time,
    CONCAT_WS(' ', c.first_name, c.last_name) AS full_name,
    c.phone_number
FROM dealerships d
INNER JOIN vehicles v
	ON d.vehicle_id = v.id
INNER JOIN customers c
	ON v.customer_id = c.id
WHERE
	d.location = 'Sofia'
ORDER BY 
	full_name;

SELECT 
    d.name,
    d.location,
    f.country,
    f.end_contract_date,
    f.production_ratio
FROM dealerships d
INNER JOIN factories f
	ON d.factory_id = f.id
WHERE
	f.production_ratio > 10000 AND
    f.end_contract_date > '2026-06-06'
ORDER BY 
	d.name,
    f.country;

SELECT 
    d.name,
    d.location,
    d.end_time - d.start_time AS open_hours,
    SUM(v.price) AS total_price
FROM dealerships d
INNER JOIN vehicles v
	ON d.vehicle_id = v.id
WHERE
	d.name = 'Porsche Zapad'
GROUP BY 
	d.name,
    d.location,
    open_hours;

SELECT 
	CONCAT_WS(' ', make, model) AS make_model,
    AVG(mileage) AS avg_mileage
FROM 
	vehicles
GROUP BY 
	make_model;

SELECT 
	CONCAT_WS(' ', v.make, v.model) AS make_model,
    e.fuel_type,
    MAX(e.horse_power) AS most_powerful
FROM  vehicles v
INNER JOIN engines e 
	ON v.engine_id = e.id
GROUP BY 
	make_model,
    e.fuel_type
HAVING
	e.fuel_type <> 'electric'
ORDER BY 
	most_powerful;

SELECT 
    d.name,
    (SELECT COUNT(*) FROM vehicles v WHERE v.id = d.vehicle_id) AS total_vehicles_sold
FROM 
    dealerships d;

SELECT 
    engine_type,
    (SELECT AVG(fuel_consumption) FROM engines e WHERE e.engine_type = eng.engine_type) AS avg_fuel_consumption
FROM 
    (SELECT DISTINCT engine_type FROM engines) AS eng;

CREATE VIEW view_general_info AS
SELECT
	f.country,
    f.end_contract_date,
    f.production_ratio,
    d.name,
    d.location,
    d.end_time - d.start_time AS open_hours,
    CONCAT(v.make, ' ', v.model) AS make_model,
    v.year,
    v.mileage,
    v.price,
    e.vin,
    e.engine_type,
    e.fuel_type,
    e.fuel_consumption,
    e.horse_power,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    c.egn,
    c.phone_number,
    c.iban
FROM factories f
LEFT JOIN dealerships d
	ON f.id = d.factory_id
LEFT JOIN vehicles v
	ON d.vehicle_id = v.id
LEFT JOIN engines e
	ON v.engine_id = e.id
LEFT JOIN customers c
	ON v.customer_id = c.id
ORDER BY 
	d.name,
    make_model,
    v.price;
    
SELECT * FROM view_general_info;