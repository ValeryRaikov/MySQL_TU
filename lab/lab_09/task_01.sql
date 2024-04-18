use school_sport_clubs;
drop table if exists salarypayments_log;
create table salarypayments_log(
id int auto_increment primary key,
operation ENUM('INSERT','UPDATE','DELETE') not null,
old_coach_id int,
new_coach_id int,
old_month int,
new_month int,
old_year int,
new_year int,
old_salaryAmount decimal,
new_salaryAmount decimal,
old_dateOfPayment datetime,
new_dateOfPayment datetime,
dateOfLog datetime
)Engine = Innodb;

delimiter |
CREATE TRIGGER after_salarypayment_update AFTER UPDATE ON salarypayments
FOR EACH ROW 
BEGIN
INSERT INTO salarypayments_log(operation,
old_coach_id,
new_coach_id,
old_month,
new_month,
old_year,
new_year,
old_salaryAmount,
new_salaryAmount,
old_dateOfPayment,
new_dateOfPayment,
dateOfLog)
VALUES ('UPDATE',OLD.coach_id,NEW.coach_id,OLD.month,NEW.month,
OLD.year,NEW.year,OLD.salaryAmount,NEW.salaryAmount,OLD.dateOfPayment,NEW.dateOfPayment,NOW());
END;
|
Delimiter ;

UPDATE `salarypayments` SET `salaryAmount`='2000' WHERE `id`='13';

DROP TRIGGER if exists after_salarypayment_update;
delimiter |
CREATE TRIGGER after_salarypayment_update AFTER UPDATE ON salarypayments
FOR EACH ROW 
BEGIN
INSERT INTO salarypayments_log(operation,
old_coach_id,
new_coach_id,
old_month,
new_month,
old_year,
new_year,
old_salaryAmount,
new_salaryAmount,
old_dateOfPayment,
new_dateOfPayment,
dateOfLog)
VALUES ('UPDATE',
OLD.coach_id,
CASE NEW.coach_id WHEN OLD.coach_id THEN NULL ELSE NEW.coach_id END,
OLD.month,
CASE NEW.month WHEN OLD.month THEN NULL ELSE NEW.month END,
OLD.year,
CASE NEW.year WHEN OLD.year THEN NULL ELSE NEW.year END,
OLD.salaryAmount,
CASE NEW.salaryAmount WHEN OLD.salaryAmount THEN NULL ELSE NEW.salaryAmount END,
OLD.dateOfPayment,
CASE NEW.dateOfPayment WHEN OLD.dateOfPayment THEN NULL ELSE NEW.dateOfPayment END,
NOW());
END;
|
Delimiter ;

UPDATE `school_sport_clubs`.`salarypayments` SET `month`='4' WHERE `id`='15';

delimiter |
create trigger before_salarypayments_insert BEFORE INSERT ON salarypayments
FOR EACH row
BEGIN
IF (NEW.salaryAmount < 0) THEN SET NEW.salaryAmount = 0; END IF;
END;
|
delimiter ;

INSERT INTO `school_sport_clubs`.`salarypayments` 
(`coach_id`, `month`, `year`, `salaryAmount`, `dateOfPayment`) 
VALUES ('4', '4', 2016, '-1450', '2016-04-22 11:45:08');