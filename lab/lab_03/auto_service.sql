-- auto_service DB
DROP DATABASE IF EXISTS auto_service;

CREATE DATABASE auto_service;

USE auto_service;

CREATE TABLE services (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE repairs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_id INT NOT NULL,
    description TEXT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    date_completed DATE NOT NULL,
    FOREIGN KEY (service_id) 
		REFERENCES services(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(10) NOT NULL
);

CREATE TABLE vehicles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    vin VARCHAR(17) NOT NULL UNIQUE,
    FOREIGN KEY (customer_id) 
		REFERENCES customers(id)
);

CREATE TABLE employee_vehicle (
    employee_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    PRIMARY KEY (employee_id, vehicle_id),
    FOREIGN KEY (employee_id) 
		REFERENCES employees(id),
    FOREIGN KEY (vehicle_id) 
		REFERENCES vehicles(id)
);
