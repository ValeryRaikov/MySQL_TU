USE test_db;

CREATE TABLE IF NOT EXISTS customers(
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(10) UNIQUE,
    budget DECIMAL(10, 2)
);

insert into customers (id, first_name, last_name, phone_number, budget) values (1, 'Paulita', 'Gyurko', '2025732836', 2816.33);
insert into customers (id, first_name, last_name, phone_number, budget) values (2, 'Geno', 'Lawson', '2526526004', 5527.34);
insert into customers (id, first_name, last_name, phone_number, budget) values (3, 'Elga', 'Kneal', '9005582573', 5464.51);
insert into customers (id, first_name, last_name, phone_number, budget) values (4, 'Jazmin', 'Keynes', '6761854470', 5486.27);
insert into customers (id, first_name, last_name, phone_number, budget) values (5, 'Desirae', 'Kirsch', '8305175803', 2052.93);
insert into customers (id, first_name, last_name, phone_number, budget) values (6, 'Estella', 'Venners', '7729501133', 6726.11);
insert into customers (id, first_name, last_name, phone_number, budget) values (7, 'Allin', 'Lillico', '7008904907', 1497.06);
insert into customers (id, first_name, last_name, phone_number, budget) values (8, 'Alfred', 'Hobben', '5294675051', 7467.83);
insert into customers (id, first_name, last_name, phone_number, budget) values (9, 'Jaynell', 'Wearing', '1277185528', 5791.76);
insert into customers (id, first_name, last_name, phone_number, budget) values (10, 'Shelia', 'Prince', '9501204226', 8245.33);
insert into customers (id, first_name, last_name, phone_number, budget) values (11, 'Junie', 'Peach', '6606765028', 7014.0);
insert into customers (id, first_name, last_name, phone_number, budget) values (12, 'Charla', 'Wroughton', '4051201085', 1325.56);
insert into customers (id, first_name, last_name, phone_number, budget) values (13, 'Corella', 'Golagley', '3085560027', 6297.89);
insert into customers (id, first_name, last_name, phone_number, budget) values (14, 'Verile', 'Hayller', '3774935287', 7941.96);
insert into customers (id, first_name, last_name, phone_number, budget) values (15, 'Cortie', 'Wilcocks', '4387403360', 765.14);
insert into customers (id, first_name, last_name, phone_number, budget) values (16, 'Josephine', 'Balint', '5774655971', 3478.62);
insert into customers (id, first_name, last_name, phone_number, budget) values (17, 'Araldo', 'Santorini', '6383971495', 595.52);
insert into customers (id, first_name, last_name, phone_number, budget) values (18, 'Corly', 'Shillan', '4364423044', 1280.34);
insert into customers (id, first_name, last_name, phone_number, budget) values (19, 'Brannon', 'Mcasparan', '8019946015', 9867.08);
insert into customers (id, first_name, last_name, phone_number, budget) values (20, 'Julienne', 'Hebblewaite', '1481904659', 3849.26);

SELECT * FROM customers;

DELIMITER $
CREATE PROCEDURE view_customer_details(IN full_name VARCHAR(100))
BEGIN
	SELECT * FROM customers
    WHERE CONCAT(first_name, ' ', last_name) = full_name;
END $
DELIMITER ;

CALL view_customer_details('Geno Lawson');
CALL view_customer_details('Verile Hayller');


DELIMITER $
CREATE PROCEDURE view_customer_details2(IN _id INT)
BEGIN
	SELECT first_name, last_name, phone_number FROM customers
    WHERE id = _id;
END $
DELIMITER ;

CALL view_customer_details2(5);

DELIMITER $
CREATE PROCEDURE update_customer_info(IN _id INT)
BEGIN 
	UPDATE customers
    SET budget = budget - 1000
    WHERE id = _id;
    
    IF (SELECT budget FROM customers WHERE id = _id) < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient budget';
    END IF;
END $
DELIMITER ;

CALL update_customer_info(5);

DELIMITER $
CREATE PROCEDURE test_procedure(IN _id INT, OUT _budget DECIMAL(10, 2))
BEGIN
	SELECT budget INTO _budget
    FROM customers
    WHERE id = _id;
END $
DELIMITER ;

CALL test_procedure(3, @budget);