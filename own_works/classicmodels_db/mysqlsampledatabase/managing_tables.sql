DROP DATABASE IF EXISTS demo_db;

CREATE DATABASE demo_db;

USE demo_db;

CREATE TABLE tasks (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    start_date DATE,
    due_date DATE
);

SHOW TABLES;

CREATE TABLE checklists (
	id INT,
    task_id INT,
    title VARCHAR(50) NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id)
		REFERENCES tasks(id)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
); 

-- RENAME TABLE
/*
RENAME TABLE tasks 
TO chores;
*/

-- ADD COLUMN
ALTER TABLE tasks
ADD COLUMN description TEXT AFTER title;

-- DROP COLUMN
ALTER TABLE tasks
DROP COLUMN description;

DESCRIBE tasks;

-- DROP TABLES
SET foreign_key_checks = 0;
DROP TABLE tasks;
DROP TABLE checklists;

-- TEMPORARY TABLES
CREATE TEMPORARY TABLE top_customers
SELECT p.customerNumber, 
       c.customerName, 
       ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c 
    ON c.customerNumber = p.customerNumber
GROUP BY 
    p.customerNumber
ORDER BY 
    sales DESC
LIMIT 10;

DROP TEMPORARY TABLE top_customers;

-- GENERATED COLUMNS
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    fullname varchar(101) GENERATED ALWAYS AS (CONCAT(first_name,' ',last_name)),
    email VARCHAR(100) NOT NULL
);