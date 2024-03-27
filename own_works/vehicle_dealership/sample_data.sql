-- Inserting data into the factories table
INSERT INTO factories (country, end_contract_date, production_ratio)
VALUES
    ('USA', '2024-12-31', 1500),
    ('Germany', '2025-06-30', 2000),
    ('Japan', '2025-09-30', 1800),
    ('France', '2024-10-31', 1200),
    ('Italy', '2025-08-31', 1700),
    ('China', '2025-12-31', 1600),
    ('UK', '2025-07-31', 1900),
    ('South Korea', '2024-11-30', 1300),
    ('India', '2025-05-31', 1400),
    ('Canada', '2025-03-31', 2200),
    ('Mexico', '2025-02-28', 2300),
    ('Brazil', '2024-04-30', 2100),
    ('Russia', '2024-01-31', 2400),
    ('Australia', '2025-01-31', 2500),
    ('South Africa', '2024-06-30', 2600);

-- Inserting data into the engines table
INSERT INTO engines (vin, engine_type, fuel_type, fuel_consumption, horse_power)
VALUES
    ('ABCD123456789012', 'Inline 4 Cylinder', 'petrol', 7.5, 150),
    ('EFGH123456789012', 'V6', 'diesel', 6.2, 200),
    ('IJKL123456789012', 'V8', 'petrol', 10.5, 300),
    ('MNOP123456789012', 'Inline 6 Cylinder', 'diesel', 8.0, 250),
    ('QRST123456789012', 'V12', 'petrol', 15.2, 400),
    ('UVWX123456789012', 'Electric Motor', 'electric', 0.0, 300),
    ('ABCD123456789013', 'Inline 4 Cylinder', 'petrol', 7.5, 150),
    ('EFGH123456789013', 'V6', 'diesel', 6.2, 200),
    ('IJKL123456789013', 'V8', 'petrol', 10.5, 300),
    ('MNOP123456789013', 'Inline 6 Cylinder', 'diesel', 8.0, 250),
    ('QRST123456789013', 'V12', 'petrol', 15.2, 400),
    ('UVWX123456789013', 'Electric Motor', 'electric', 0.0, 300),
    ('ABCD123456789014', 'Inline 4 Cylinder', 'petrol', 7.5, 150),
    ('EFGH123456789014', 'V6', 'diesel', 6.2, 200),
    ('IJKL123456789014', 'V8', 'petrol', 10.5, 300),
    ('MNOP123456789014', 'Inline 6 Cylinder', 'diesel', 8.0, 250),
    ('QRST123456789014', 'V12', 'petrol', 15.2, 400),
    ('UVWX123456789014', 'Electric Motor', 'electric', 0.0, 300);

-- Inserting data into the customers table
INSERT INTO customers (first_name, last_name, egn, phone_number, iban)
VALUES
    ('John', 'Doe', '1234567890', '1234567890', 'BG12ABCD1234567890'),
    ('Alice', 'Smith', '2345678901', '2345678901', 'BG34EFGH1234567890'),
    ('Michael', 'Johnson', '3456789012', '3456789012', 'BG56IJKL1234567890'),
    ('Emma', 'Williams', '4567890123', '4567890123', 'BG78MNOP1234567890'),
    ('William', 'Brown', '5678901234', '5678901234', 'BG90QRST1234567890'),
    ('John', 'Tate', '1234567891', '1234567891', 'BG12ABCD1234567891'),
    ('Andrew', 'Smith', '2345678902', '2345678902', 'BG34EFGH1234567892'),
    ('Michael', 'Peterson', '3456789013', '3456789013', 'BG56IJKL1234567893'),
    ('Emma', 'Watson', '4567890124', '4567890124', 'BG78MNOP1234567894'),
    ('William', 'Shakespear', '5678901235', '5678901235', 'BG90QRST1234567895');

-- Inserting data into the vehicles table
INSERT INTO vehicles (engine_id, customer_id, make, model, year, mileage, price)
VALUES
    (1, 1, 'Toyota', 'Camry', 2018, 50000, 15000.00),
    (2, 2, 'Ford', 'F-150', 2019, 40000, 25000.00),
    (3, 3, 'BMW', '5 Series', 2020, 30000, 35000.00),
    (4, 4, 'Audi', 'A4', 2017, 60000, 20000.00),
    (5, 5, 'Tesla', 'Model S', 2021, 20000, 60000.00),
    (6, 6, 'Toyota', 'Camry', 2018, 50000, 15000.00),
    (7, 7, 'Ford', 'F-150', 2019, 40000, 25000.00),
    (8, 8, 'BMW', '5 Series', 2020, 30000, 35000.00),
    (9, 9, 'Audi', 'A4', 2017, 60000, 20000.00),
    (10, 10, 'Tesla', 'Model S', 2021, 20000, 60000.00);

-- Inserting data into the dealerships table
INSERT INTO dealerships (vehicle_id, factory_id, name, location, start_time, end_time)
VALUES
    (1, 1, 'Toyota Showroom', 'New York', '09:00:00', '18:00:00'),
    (2, 2, 'Ford Dealership', 'Los Angeles', '08:00:00', '17:00:00'),
    (3, 3, 'BMW Showroom', 'Berlin', '10:00:00', '19:00:00'),
    (4, 4, 'Audi Dealership', 'Munich', '09:30:00', '18:30:00'),
    (5, 5, 'Tesla Store', 'San Francisco', '10:30:00', '19:30:00');