-- Create database boatdb
CREATE DATABASE IF NOT EXISTS boatdb;
USE boatdb;

-- Drop table boats
DROP TABLE IF EXISTS boats;

-- Create table boats
CREATE TABLE boats (
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(40),
    type VARCHAR(20),
    owner_id INT NOT NULL,
    date_made DATE,
    price_per_hour FLOAT
);

-- Load data from csv file
LOAD DATA LOCAL INFILE "./boats.csv" INTO TABLE boats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, name, type, owner_id, @datevar, price_per_hour)
set date_made = STR_TO_DATE(@datevar,'%m/%d/%Y');