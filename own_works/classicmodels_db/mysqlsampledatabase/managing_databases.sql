-- display databases
SHOW DATABASES;

-- create database
CREATE DATABASE IF NOT EXISTS demo_db;

SHOW CREATE DATABASE demo_db;

-- change to the new database 
USE demo_db;

-- delete database
DROP DATABASE IF EXISTS demo_db;

SHOW DATABASES;