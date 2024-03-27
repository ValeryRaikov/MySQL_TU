INSERT INTO `gallery`.`people` (`name`, `address`, `phone`, `is_artist`) 
VALUES ('Ivan Ivanov', 'Sofia', '0894512', '0');
INSERT INTO `gallery`.`people` (`name`, `address`, `phone`, `is_artist`) 
VALUES ('Georgi Martinov', 'Sofia', '087452', '1');
INSERT INTO `gallery`.`people` (`name`, `address`, `phone`, `is_artist`)
VALUES ('Stefan Dimov', 'Sofia', '0785421', '1');
INSERT INTO `gallery`.`people` (`name`, `address`, `phone`, `is_artist`)
VALUES ('Iordan Metodioev', 'Sofia', '0874512', '0');
INSERT INTO `gallery`.`goods` (`name`, `price`, `size`, `type`, `year`)
VALUES ('Mona Liza', '4500', '77 ? 53 cm', '1',null);
INSERT INTO `gallery`.`goods` (`name`, `price`, `size`, `type`, `year`, `artist_id`) 
VALUES ('Kone na vodopoi', '250', '40X80', '1', 2000, '2');
INSERT INTO `gallery`.`goods` (`name`, `price`, `size`, `type`, `year`) 
VALUES ('Ramka ot dyb', '100', '20X22', '2', 2015);
INSERT INTO `gallery`.`goods` (`name`, `price`,`type`, `year`) 
VALUES ('Vaza - monblan', '100','3', 2015);
INSERT INTO `gallery`.`goods` ( `name`, `price`, `size`,`type`, `year`) 
VALUES ('Ramka ot bor', '80', 'y X y cm' ,'2', 2016);
INSERT INTO `gallery`.`goods` (`name`, `price`, `size`,`type`, `year`) 
VALUES ('Ramka ot qsen', '90', 'y X y cm','2', 2016);
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `comment`, `employee_name`, `is_received`, `good_id`, `customer_id`) 
VALUES ('250', '3', '2016-04-08 17:10:22', 'Vaza-1br', 'Ivan', '1', '4', '1');
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `end_date`, `comment`, `size`, `employee_name`, `is_ready`, `is_received`, `good_id`, `customer_id`) 
VALUES ('115', '1', '2016-04-08 17:10:22', '2016-05-08 17:10:22', 'RIsunkata e v profil', '200X150', 'Ivan', '0', '0', '5', '1');
UPDATE `gallery`.`services` SET `end_date`='2016-04-08 17:10:22' WHERE `id`='1';
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `end_date`, `comment`, `size`, `employee_name`, `is_ready`, `is_received`, `good_id`, `customer_id`, `artist_id`) 
VALUES ('200', '2', '2016-04-08 17:10:22', '2016-05-08 17:10:22', 'risuwane w profil', '200x200', 'Ivan', '0', '0', '6', '1', '2');
UPDATE `gallery`.`services` SET `comment`='ramkata e staral' WHERE `id`='2';
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `end_date`, `comment`, `size`, `employee_name`, `is_ready`, `is_received`, `good_id`, `customer_id`, `artist_id`) 
VALUES ('300', '2', '2016-04-08 17:10:22', '2016-06-08 17:10:22', 'sds', '200X300', 'Ivan', '0', '0', '6', '1', '3');
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `end_date`, `comment`, `size`, `employee_name`, `is_ready`, `is_received`, `good_id`, `customer_id`, `artist_id`) 
VALUES ('280', '2', '2016-04-08 17:10:22', '2016-04-11 17:10:22', 'nqma', '80X200 cm', 'Petyr', '1', '1', '3', '1', '2');
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `end_date`, `comment`, `size`, `employee_name`, `is_ready`, `is_received`, `good_id`, `customer_id`, `artist_id`) 
VALUES ('300', '2', '2016-04-01 17:10:22', '2016-04-11 17:10:22', 'profil', '180X250', 'Petyr', '1', '1', '3', '4', '3');
INSERT INTO `gallery`.`services` (`final_price`, `type`, `date_created`, `end_date`, `comment`, `size`, `employee_name`, `is_ready`, `is_received`, `good_id`, `customer_id`, `artist_id`) 
VALUES ('310', '2', '2016-04-01 17:10:22', '2016-04-10 17:10:22', 'portret', '200X250', 'Petyr', '1', '1', '3', '1', '3');