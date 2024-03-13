-- Create the database 
CREATE DATABASE IF NOT EXISTS classicmodels;
 
-- Use the classicmodels database
USE classicmodels;
 
-- Drop existing tables
DROP TABLE IF EXISTS productlines;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS offices;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers; 
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS orderdetails;
 
-- Create the needed tables
CREATE TABLE productlines (
    productLine varchar(50),
    textDescription varchar(4000) DEFAULT NULL,
    htmlDescription mediumtext,
    image mediumblob,
    PRIMARY KEY (productLine)
);
 
CREATE TABLE products (
    productCode varchar(15),
    productName varchar(70) NOT NULL,
    productLine varchar(50) NOT NULL,
    productScale varchar(10) NOT NULL,
    productVendor varchar(50) NOT NULL,
    productDescription text NOT NULL,
    quantityInStock smallint(6) NOT NULL,
    buyPrice decimal(10,2) NOT NULL,
    MSRP decimal(10,2) NOT NULL,
    PRIMARY KEY (productCode),
    FOREIGN KEY (productLine) 
        REFERENCES productlines (productLine)
);
 
CREATE TABLE offices (
    officeCode varchar(10),
    city varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressLine1 varchar(50) NOT NULL,
    addressLine2 varchar(50) DEFAULT NULL,
    state varchar(50) DEFAULT NULL,
    country varchar(50) NOT NULL,
    postalCode varchar(15) NOT NULL,
    territory varchar(10) NOT NULL,
    PRIMARY KEY (officeCode)
);
 
CREATE TABLE employees (
    employeeNumber int,
    lastName varchar(50) NOT NULL,
    firstName varchar(50) NOT NULL,
    extension varchar(10) NOT NULL,
    email varchar(100) NOT NULL,
    officeCode varchar(10) NOT NULL,
    reportsTo int DEFAULT NULL,
    jobTitle varchar(50) NOT NULL,
    PRIMARY KEY (employeeNumber),
    FOREIGN KEY (reportsTo) 
        REFERENCES employees (employeeNumber),
    FOREIGN KEY (officeCode) 
        REFERENCES offices (officeCode)
);
 
CREATE TABLE customers (
    customerNumber int,
    customerName varchar(50) NOT NULL,
    contactLastName varchar(50) NOT NULL,
    contactFirstName varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    addressLine1 varchar(50) NOT NULL,
    addressLine2 varchar(50) DEFAULT NULL,
    city varchar(50) NOT NULL,
    state varchar(50) DEFAULT NULL,
    postalCode varchar(15) DEFAULT NULL,
    country varchar(50) NOT NULL,
    salesRepEmployeeNumber int DEFAULT NULL,
    creditLimit decimal(10,2) DEFAULT NULL,
    PRIMARY KEY (customerNumber),
    FOREIGN KEY (salesRepEmployeeNumber) 
        REFERENCES employees (employeeNumber)
);
 
CREATE TABLE payments (
    customerNumber int,
    checkNumber varchar(50) NOT NULL,
    paymentDate date NOT NULL,
    amount decimal(10,2) NOT NULL,
    PRIMARY KEY (customerNumber,checkNumber),
    FOREIGN KEY (customerNumber) 
        REFERENCES customers (customerNumber)
);
 
CREATE TABLE orders (
    orderNumber int,
    orderDate date NOT NULL,
    requiredDate date NOT NULL,
    shippedDate date DEFAULT NULL,
    status varchar(15) NOT NULL,
    comments text,
    customerNumber int NOT NULL,
    PRIMARY KEY (orderNumber),
    FOREIGN KEY (customerNumber) 
        REFERENCES customers (customerNumber)
);
 
CREATE TABLE orderdetails (
    orderNumber int,
    productCode varchar(15) NOT NULL,
    quantityOrdered int NOT NULL,
    priceEach decimal(10,2) NOT NULL,
    orderLineNumber smallint(6) NOT NULL,
    PRIMARY KEY (orderNumber,productCode),
    FOREIGN KEY (orderNumber) 
        REFERENCES orders (orderNumber),
    FOREIGN KEY (productCode) 
        REFERENCES products (productCode)
);
 
-- Insert some sample data
INSERT INTO productlines (productLine, textDescription, htmlDescription, image)
VALUES 
    ('Classic Cars', 'Classic cars from the 1950s to the late 1970s.', NULL, NULL),
    ('Motorcycles', 'Classic and vintage motorcycles.', NULL, NULL),
    ('Planes', 'Classic and vintage planes.', NULL, NULL),
    ('Ships', 'Classic and vintage ships.', NULL, NULL),
    ('Trucks and Buses', 'Vintage trucks and buses.', NULL, NULL),
    ('Vintage Cars', 'Vintage cars from different eras.', NULL, NULL),
    ('Boats', 'Vintage boats and yachts.', NULL, NULL),
    ('Trains', 'Classic and vintage trains.', NULL, NULL),
    ('Race Cars', 'Classic and vintage race cars.', NULL, NULL),
    ('Aircraft Parts', 'Parts and accessories for vintage aircraft.', NULL, NULL);
 
INSERT INTO products (productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES 
    ('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, 48.81, 95.7),
    ('S10_1949', '1952 Alpine Renault 1300', 'Classic Cars', '1:10', 'Classic Metal Creations', 'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, 98.58, 214.3),
    ('S10_2016', '1996 Moto Guzzi 1100i', 'Motorcycles', '1:10', 'Highway 66 Mini Classics', 'Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, 68.99, 118.94),
    ('S10_4698', '2003 Harley-Davidson Eagle Drag Bike', 'Motorcycles', '1:10', 'Red Start Diecast', 'Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, 91.02, 193.66),
    ('S12_1099', '1968 Ford Mustang', 'Classic Cars', '1:12', 'Autoart Studio Design', 'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, 95.34, 194.57),
    ('S12_3380', '1968 Dodge Charger', 'Classic Cars', '1:12', 'Classic Metal Creations', '1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, 75.16, 117.44),
    ('S12_3990', '1970 Plymouth Hemi Cuda', 'Classic Cars', '1:12', 'Studio M Art Models', 'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Hemi Cuda is widely recognized as one of the greatest muscle cars of all time.  Superb detail and accuracy, with features such as opening hood, doors, and trunk.', 5663, 31.92, 79.8),
    ('S12_4675', '1969 Dodge Charger', 'Classic Cars', '1:12', 'Classic Metal Creations', 'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features.', 7323, 58.73, 115.16),
    ('S18_1129', '1993 Mazda RX-7', 'Classic Cars', '1:18', 'Highway 66 Mini Classics', 'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, 83.51, 141.54),
    ('S18_1589', '1965 Aston Martin DB5', 'Classic Cars', '1:18', 'Classic Metal Creations', 'Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, 65.96, 124.44);
 
INSERT INTO offices (officeCode, city, phone, addressLine1, addressLine2, state, country, postalCode, territory)
VALUES 
    ('1000000000', 'San Francisco', '+1 650 219 4782', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'NA'),
    ('1000000001', 'Boston', '+1 215 837 0825', '1550 Court Place', 'Suite 102', 'MA', 'USA', '02107', 'NA'),
    ('1000000002', 'NYC', '+1 212 555 3000', '523 East 53rd Street', 'apt. 5A', 'NY', 'USA', '10022', 'NA'),
    ('1000000003', 'Paris', '+33 14 723 4404', '43 Rue Jouffroy Dabbans', NULL, NULL, 'France', '75017', 'EMEA'),
    ('1000000004', 'Tokyo', '+81 33 224 5000', '4-1 Kioicho', NULL, 'Chiyoda-Ku', 'Japan', '102-8578', 'Japan'),
    ('1000000005', 'Sydney', '+61 2 9264 2451', '5-11 Wentworth Avenue', 'Floor #2', 'NSW', 'Australia', '2010', 'APAC'),
    ('1000000006', 'London', '+44 20 7877 2041', '25 Old Broad Street', 'Level 7', NULL, 'UK', 'EC2N 1HN', 'EMEA'),
    ('1000000007', 'Osaka', '+81 06 6342 5555', '1-6-20 Dojima', 'Kita-ku', NULL, 'Japan', '530-0003', 'Japan'),
    ('1000000008', 'Madrid', '+34 91 555 22 82', 'Gran Vía, 1', NULL, NULL, 'Spain', '28001', 'EMEA'),
    ('1000000009', 'Manchester', '+44 161 445 2212', 'Riverside', 'New Bailey Street', NULL, 'UK', 'M3 5FS', 'EMEA');
 
INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES 
    (1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', 1102, 'President'),
    (1056, 'Patterson', 'Mary', 'x4611', 'mpatterso@classicmodelcars.com', '1', 1002, 'VP Sales'),
    (1076, 'Firrelli', 'Jeff', 'x9273', 'jfirrelli@classicmodelcars.com', '1', 1002, 'VP Marketing'),
    (1088, 'Patterson', 'William', 'x4871', 'wpatterson@classicmodelcars.com', '6', 1056, 'Sales Manager (APAC)'),
    (1102, 'Bondur', 'Gerard', 'x5408', 'gbondur@classicmodelcars.com', '4', 1056, 'Sale Manager (EMEA)'),
    (1143, 'Bow', 'Anthony', 'x5428', 'abow@classicmodelcars.com', '1', 1102, 'Sales Manager (NA)'),
    (1165, 'Jennings', 'Leslie', 'x3291', 'ljennings@classicmodelcars.com', '1', 1143, 'Sales Rep'),
    (1166, 'Thompson', 'Leslie', 'x4065', 'lthompson@classicmodelcars.com', '1', 1143, 'Sales Rep'),
    (1188, 'Firrelli', 'Julie', 'x2173', 'jfirrelli@classicmodelcars.com', '2', 1143, 'Sales Rep'),
    (1216, 'Patterson', 'Steve', 'x4334', 'spatterson@classicmodelcars.com', '2', 1143, 'Sales Rep');
 
INSERT INTO customers (customerNumber, customerName, contactLastName, contactFirstName, phone, addressLine1, addressLine2, city, state, postalCode, country, salesRepEmployeeNumber, creditLimit)
VALUES 
    (103, 'Atelier graphique', 'Schmitt', 'Carine ', '40.32.2555', '54, rue Royale', NULL, 'Nantes', NULL, '44000', 'France', 1370, 21000.00),
    (112, 'Signal Gift Stores', 'King', 'Jean', '7025551838', '8489 Strong St.', NULL, 'Las Vegas', 'NV', '83030', 'USA', 1166, 71800.00),
    (114, 'Australian Collectors, Co.', 'Ferguson', 'Peter', '03 9520 4555', '636 St Kilda Road', 'Level 3', 'Melbourne', 'Victoria', '3004', 'Australia', 1611, 117300.00),
    (119, 'La Rochelle Gifts', 'Labrune', 'Janine ', '40.67.8555', '67, rue des Cinquante Otages', NULL, 'Nantes', NULL, '44000', 'France', 1370, 118200.00),
    (121, 'Baane Mini Imports', 'Bergulfsen', 'Jonas ', '07-98 9555', 'Erling Skakkes gate 78', NULL, 'Stavern', NULL, '4110', 'Norway', 1504, 81700.00),
    (124, 'Mini Gifts Distributors Ltd.', 'Nelson', 'Susan', '4155551450', '5677 Strong St.', NULL, 'San Rafael', 'CA', '97562', 'USA', 1165, 210500.00),
    (125, 'Havel & Zbyszek Co', 'Piestrzeniewicz', 'Zbyszek ', '(26) 642-7555', 'ul. Filtrowa 68', NULL, 'Warszawa', NULL, '01-012', 'Poland', 1504, 0.00),
    (128, 'Blauer See Auto, Co.', 'Keitel', 'Roland', '+49 69 66 90 2555', 'Lyonerstr. 34', NULL, 'Frankfurt', NULL, '60528', 'Germany', 1504, 59700.00),
    (129, 'Mini Wheels Co.', 'Murphy', 'Julie', '6505555787', '5557 North Pendale Street', NULL, 'San Francisco', 'CA', '94217', 'USA', 1165, 64600.00),
    (131, 'Land of Toys Inc.', 'Lee', 'Kwai', '2125557818', '897 Long Airport Avenue', NULL, 'NYC', 'NY', '10022', 'USA', 1323, 114900.00);
 
INSERT INTO payments (customerNumber, checkNumber, paymentDate, amount)
VALUES 
    (103, 'HQ336336', '2004-10-19', 6066.78),
    (103, 'JM555205', '2003-06-05', 14571.44),
    (103, 'OM314933', '2004-12-18', 1676.14),
    (112, 'BO864823', '2004-12-17', 14191.12),
    (112, 'HQ55022', '2003-06-06', 32641.98),
    (112, 'ND748579', '2004-08-20', 33347.88),
    (114, 'GG31455', '2003-05-20', 45864.03),
    (114, 'MA765515', '2004-12-15', 82261.22),
    (114, 'NP603840', '2003-05-31', 7565.08),
    (119, 'DB933704', '2004-11-14', 19501.82);
 
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES 
    (10100, '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped', NULL, 363),
    (10101, '2003-01-09', '2003-01-18', '2003-01-11', 'Shipped', 'Check on availability.', 128),
    (10102, '2003-01-10', '2003-01-18', '2003-01-14', 'Shipped', NULL, 181),
    (10103, '2003-01-29', '2003-02-07', '2003-02-02', 'Shipped', NULL, 121),
    (10104, '2003-01-31', '2003-02-09', '2003-02-01', 'Shipped', NULL, 141),
    (10105, '2003-02-11', '2003-02-19', '2003-02-12', 'Shipped', NULL, 145),
    (10106, '2003-02-17', '2003-02-24', '2003-02-21', 'Shipped', NULL, 278),
    (10107, '2003-02-24', '2003-03-03', '2003-02-26', 'Shipped', NULL, 131),
    (10108, '2003-03-03', '2003-03-10', '2003-03-04', 'Shipped', NULL, 385),
    (10109, '2003-03-10', '2003-03-20', '2003-03-11', 'Shipped', NULL, 398);
 
INSERT INTO orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
VALUES 
    (10100, 'S18_1749', 30, 136.00, 3),
    (10100, 'S18_2248', 50, 55.09, 2),
    (10100, 'S18_4409', 22, 75.46, 4),
    (10100, 'S24_3969', 49, 35.29, 1),
    (10101, 'S18_2325', 25, 108.06, 4),
    (10101, 'S18_2795', 26, 167.06, 1),
    (10101, 'S24_1937', 45, 32.53, 3),
    (10101, 'S24_2022', 46, 44.35, 2),
    (10102, 'S18_1342', 39, 99.66, 2),
    (10102, 'S18_1367', 41, 95.55, 1);
 