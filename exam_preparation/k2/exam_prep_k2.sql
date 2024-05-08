CREATE DATABASE exam_prep2;
USE exam_prep2;

-- Create table for customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_address VARCHAR(255) NOT NULL
);

-- Create table for departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create table for companies
CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Create table for projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

-- Create table for employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    employee_position VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE,
    company_id INT,
    project_id INT,
    FOREIGN KEY (company_id) REFERENCES companies(company_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert sample data into customers table
INSERT INTO customers (customer_name, customer_address) VALUES
('Customer A', '123 Main St'),
('Customer B', '456 Elm St'),
('Customer C', '789 Oak St'),
('Customer D', '101 Pine St'),
('Customer E', '202 Maple St');

-- Insert sample data into departments table
INSERT INTO departments (department_name, customer_id) VALUES
('Sales', 1),
('Marketing', 2),
('Finance', 3),
('Human Resources', 4),
('IT', 5);

-- Insert sample data into companies table
INSERT INTO companies (company_name, department_id) VALUES
('Company 1', 1),
('Company 2', 2),
('Company 3', 3),
('Company 4', 4),
('Company 5', 5);

-- Insert sample data into projects table
INSERT INTO projects (project_name, start_date, end_date, company_id) VALUES
('Project 1', '2023-01-01', '2023-12-31', 1),
('Project 2', '2023-02-01', '2023-11-30', 2),
('Project 3', '2023-03-01', '2023-10-31', 3),
('Project 4', '2023-04-01', '2023-09-30', 4),
('Project 5', '2023-05-01', '2023-08-31', 5);

-- Insert sample data into employees table
INSERT INTO employees (employee_name, employee_position, salary, hire_date, company_id, project_id) VALUES
('Employee 1', 'Manager', 5000.00, '2023-01-01', 1, 1),
('Employee 2', 'Developer', 4000.00, '2023-02-01', 2, 2),
('Employee 3', 'Designer', 4500.00, '2023-03-01', 3, 3),
('Employee 4', 'Accountant', 3500.00, '2023-04-01', 4, 4),
('Employee 5', 'HR Specialist', 3800.00, '2023-05-01', 5, 5);

drop procedure if exists test_proc1;

delimiter $$
create procedure test_proc1(in employeeName varchar(100), out companyName varchar(50), out departmentName varchar(50), out totalProjects int)
begin
	declare compName varchar(50);
    declare depName varchar(50);
    declare projects int;
    
	select 
		c.company_name,
        d.department_name,
        count(p.project_name) 
	into compName, depName, projects
	from companies c 
    join departments d on c.department_id = d.department_id
    join projects p on c.company_id = p.company_id
    join employees e on p.project_id = e.project_id
    where e.employee_name = employeeName
    group by 
		e.employee_name,
		c.company_name,
        d.department_name;
        
	set companyName = compName;
    set departmentName = depName;
    set totalProjects = projects;
end
$$

delimiter ;

call test_proc1('Employee 1', @companyName, @depName, @totalProjects);

select @companyName as 'company', @depName as 'department', @totalProjects as 'total projects';

drop procedure if exists test_proc2;

delimiter $$
create procedure test_proc2() 
begin
declare finished int;
declare empName varchar(50);
declare compName varchar(50);

declare employee_cursor cursor for 
select 
	e.employee_name,
	c.company_name
    from employees e 
    join companies c on e.company_id = c.company_id;
    
declare continue handler for not found set finished = 1;
set finished = 0;

open employee_cursor;
employee_loop: loop
fetch employee_cursor into empName, compName;

if finished = 1 then leave employee_loop;
end if;
select empName, compName;
end loop;
close employee_cursor;
end
$$

delimiter ;

call test_proc2();

drop procedure if exists test_proc3;

delimiter $$
create procedure test_proc3(in depId int)
begin 
declare finished int;
declare custName varchar(50);
declare custAddress varchar(100);

declare customer_cursor cursor for 
select 
	c.customer_name,
    c.customer_address
from customers c
join departments d on c.customer_id = d.customer_id
where d.department_id = depId;

declare continue handler for not found set finished = 1;
set finished = 0;

open customer_cursor;
customer_loop: loop
fetch customer_cursor into custName, custAddress;
if finished = 1 then 
	leave customer_loop;
end if;

select concat(custName, '-', custAddress) as 'Customer Data';
end loop;
close customer_cursor;
end 
$$

delimiter ;

call test_proc3(1);

drop trigger if exists before_company_insert;

delimiter $$
create trigger before_company_insert before insert on companies
for each row
begin
declare testCond condition for sqlstate '45000';

if (select count(*) from companies where company_name = new.company_name) > 0 then
	signal testCond	set message_text = 'Such company already exists';
end if;
end 
$$
delimiter ;

insert into companies(company_name, department_id)
values
	('Company 8', 1);
    
drop trigger if exists before_employee_update;

delimiter $$
create trigger before_employee_update before update on employees
for each row
begin
declare exceptionCond condition for sqlstate '45000';

if new.salary < 1200 then 
	set new.salary = 1200;
end if;
end
$$

delimiter ;

update employees 
set salary = 1000
where employee_name = 'Employee 1';

select * from employees;

drop trigger if exists before_employee_insert;

delimiter $$
create trigger before_employee_insert before insert on employees
for each row
begin 
declare exceptionCond condition for sqlstate '45000';

if (new.hire_date > curdate()) then
	signal exceptionCond set message_text = 'Invalid user insert';
end if;
end 
$$

delimiter ;

insert into employees (employee_name, employee_position, salary, hire_date, company_id, project_id) VALUES
('Employee 15', 'Manager', 6000.00, '2024-06-06', 1, 1);