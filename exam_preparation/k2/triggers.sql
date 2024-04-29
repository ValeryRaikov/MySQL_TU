DROP DATABASE IF EXISTS test_db;
CREATE DATABASE test_db;
USE test_db;

CREATE TABLE employees(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay INT,
    job_title VARCHAR(50),
    hire_date DATE,
    supervisor_id INT
);

insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (1, 'Gale', 'O''Codihie', 32, 'Director of Sales', '2023-10-01', 5);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (2, 'Emylee', 'Chismon', 26, 'Statistician IV', '2023-12-01', 16);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (3, 'Boycie', 'Fisbey', 16, 'Nuclear Power Engineer', '2024-02-12', 17);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (4, 'Dael', 'Olesen', 10, 'Director of Sales', '2023-09-15', 11);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (5, 'Jerome', 'Jobin', 23, 'Web Designer IV', '2023-08-16', 10);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (6, 'Thekla', 'Isakson', 39, 'Operator', '2023-07-22', 10);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (7, 'Koral', 'Cardo', 18, 'Health Coach III', '2024-04-18', 10);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (8, 'Jacquelyn', 'Mackstead', 20, 'Sales Associate', '2023-08-24', 5);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (9, 'Sadella', 'Tweedie', 22, 'Financial Analyst', '2024-01-17', 18);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (10, 'Analiese', 'McNeachtain', 27, 'Community Outreach Specialist', '2023-09-10', 14);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (11, 'Anne', 'Alleway', 15, 'Technical Writer', '2023-06-07', 2);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (12, 'Rorie', 'Foden', 23, 'Software Engineer II', '2023-12-14', 2);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (13, 'Clarette', 'Tebbett', 27, 'Associate Professor', '2023-08-08', 17);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (14, 'Wit', 'Olyfant', 13, 'Software Engineer IV', '2023-11-07', 10);
insert into employees (id, first_name, last_name, hourly_pay, job_title, hire_date, supervisor_id) values (15, 'Ash', 'Cruickshank', 15, 'Junior Executive', '2023-06-25', 13);

ALTER TABLE employees
ADD COLUMN salary INT AFTER hourly_pay;

UPDATE employees
SET salary = hourly_pay * 2080;

-- 01 (BEFORE UPDATE)
DROP TRIGGER IF EXISTS before_hourly_pay_update;
CREATE TRIGGER before_hourly_pay_update
BEFORE UPDATE ON employees
FOR EACH ROW
SET NEW.salary = (NEW.hourly_pay * 2080);

UPDATE employees
SET hourly_pay = 40
WHERE id = 1;

SELECT * FROM employees;

UPDATE employees
SET hourly_pay = hourly_pay + 1;

SELECT * FROM employees;

-- 02 (BEFORE INSERT)
DROP TRIGGER IF EXISTS before_hourly_pay_insert;
CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW 
SET NEW.salary = (NEW.hourly_pay * 2080);

INSERT INTO employees
VALUES (16, 'Valery', 'Raikov', 25, NULL, 'Backend-Dev', '2024-06-12', 1);

SELECT * FROM employees;

-- 03
DROP TRIGGER IF EXISTS before_hourly_pay_insert;

DELIMITER $$ 

CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
	IF (NEW.hourly_pay < 10) THEN 
	SET NEW.hourly_pay = 10;
    END IF;
END
$$

DELIMITER ;