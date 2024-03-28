-- DDL
CREATE DATABASE IF NOT EXISTS transaction_test;  
USE transaction_test;  
	
DROP TABLE IF EXISTS customer_accounts;  
	
DROP TABLE IF EXISTS customers;  
	
CREATE TABLE customers(  
	id int AUTO_INCREMENT PRIMARY KEY ,  
	name VARCHAR(255) NOT NULL ,  
	address VARCHAR(255)  
) ENGINE=InnoDB;  
	
CREATE TABLE IF NOT EXISTS customer_accounts(  
	id INT AUTO_INCREMENT PRIMARY KEY ,  
	amount DOUBLE NOT NULL ,  
	currency VARCHAR(10),  
	customer_id INT NOT NULL ,  
	CONSTRAINT FOREIGN KEY (customer_id)   
		REFERENCES customers(id)   
		ON DELETE CASCADE ON UPDATE CASCADE  
) ENGINE=InnoDB;  
	  
INSERT INTO `transaction_test`.`customers` (`name`, `address`)   
VALUES ('Ivan Petrov Iordanov', 'Sofia, Krasno selo 1000');  
INSERT INTO `transaction_test`.`customers` (`name`, `address`)   
VALUES ('Stoyan Pavlov Pavlov', 'Sofia, Liuylin 7, bl. 34');  
INSERT INTO `transaction_test`.`customers` (`name`, `address`)   
VALUES ('Iliya Mladenov Mladenov', 'Sofia, Nadezhda 2, bl 33');  
	
INSERT INTO `transaction_test`.`customer_accounts` (`amount`, `currency`, `customer_id`)   
VALUES ('5000', 'BGN', '1');  
INSERT INTO `transaction_test`.`customer_accounts` (`amount`, `currency`, `customer_id`)   
VALUES ('10850', 'EUR', '1');  
INSERT INTO `transaction_test`.`customer_accounts` (`amount`, `currency`, `customer_id`)   
VALUES ('1450000', 'BGN', '2');  
INSERT INTO `transaction_test`.`customer_accounts` (`amount`, `currency`, `customer_id`)   
VALUES ('17850', 'EUR', '2');  

-- DML
SELECT *
FROM customers
WHERE id = 1;

DELETE FROM customers
WHERE id = 1;

BEGIN;

UPDATE customer_accounts
SET amount = amount - 50000
WHERE id = 3 AND amount >= 50000;

UPDATE customer_accounts
SET amount = amount + 50000
WHERE id = 1;

COMMIT;

BEGIN;

UPDATE customer_accounts ca
JOIN customers c ON 
	ca.customer_id = c.id
SET ca.amount = ca.amount - 50000
WHERE 
	c.name = 'Stoyan Pavlov Pavlov' AND ca.amount >= 50000;

UPDATE customer_accounts ca
JOIN customers c ON 
	ca.customer_id = c.id
SET ca.amount = ca.amount + 50000
WHERE 
	c.name = 'Ivan Petrov Iordanov';

COMMIT;