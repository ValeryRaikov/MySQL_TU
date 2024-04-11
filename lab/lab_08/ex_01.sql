DROP DATABASE IF EXISTS school_sport_clubs;

CREATE DATABASE school_sport_clubs;

USE school_sport_clubs;

CREATE TABLE school_sport_clubs.sports(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	name VARCHAR(255) NOT NULL
)Engine = Innodb;

CREATE TABLE school_sport_clubs.coaches(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	name VARCHAR(255) NOT NULL ,
	egn VARCHAR(10) NOT NULL UNIQUE ,
	month_salary DECIMAL , 
	hour_salary DECIMAL
)Engine = Innodb;

CREATE TABLE school_sport_clubs.students(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	name VARCHAR(255) NOT NULL ,
	egn VARCHAR(10) NOT NULL UNIQUE ,
	address VARCHAR(255) NOT NULL ,
	phone VARCHAR(20) NULL DEFAULT NULL ,
	class VARCHAR(10) NULL DEFAULT NULL   
)Engine = Innodb;

CREATE TABLE school_sport_clubs.sportGroups(
	id INT AUTO_INCREMENT PRIMARY KEY ,
	location VARCHAR(255) NOT NULL ,
	dayOfWeek ENUM('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') ,
	hourOfTraining TIME NOT NULL ,
	sport_id INT NOT NULL ,
	coach_id INT NOT NULL ,
	UNIQUE KEY(location,dayOfWeek,hourOfTraining)  ,
	CONSTRAINT FOREIGN KEY(sport_id) 
		REFERENCES sports(id) ,
	CONSTRAINT FOREIGN KEY (coach_id) 
		REFERENCES coaches(id)
)Engine = Innodb;

CREATE TABLE school_sport_clubs.student_sport(
	student_id INT NOT NULL , 
	sportGroup_id INT NOT NULL ,  
	CONSTRAINT FOREIGN KEY (student_id) 
		REFERENCES students(id) ,	
	CONSTRAINT FOREIGN KEY (sportGroup_id) 
		REFERENCES sportGroups(id) ,
	PRIMARY KEY(student_id,sportGroup_id)
)Engine = Innodb;

CREATE TABLE taxesPayments(
	id INT AUTO_INCREMENT PRIMARY KEY,
	student_id INT NOT NULL,
	group_id INT NOT NULL,
	paymentAmount DOUBLE NOT NULL,
	month TINYINT,
	year YEAR,
	dateOfPayment DATETIME NOT NULL ,
	CONSTRAINT FOREIGN KEY (student_id) 
		REFERENCES students(id),
	CONSTRAINT FOREIGN KEY (group_id) 
		REFERENCES sportgroups(id)
)Engine = Innodb;

CREATE TABLE salaryPayments(
	id INT AUTO_INCREMENT PRIMARY KEY,
	coach_id INT NOT NULL,
	month TINYINT,
	year YEAR,
	salaryAmount DOUBLE ,
	dateOfPayment DATETIME not null,
	CONSTRAINT FOREIGN KEY (coach_id) 
		REFERENCES coaches(id),
	UNIQUE KEY(`coach_id`,`month`,`year`)    
)Engine = Innodb;

create table coach_work(
	id INT auto_increment primary key,
    coach_id INT not null,
    group_id INT not null,
    number_of_hours INT not null default 1,
	date DATETIME not null,
	isPayed BOOLEAN NOT NULL DEFAULT 0,
    foreign key (coach_id) references coaches(id),
    foreign key (group_id) references sportgroups(id)
)Engine = Innodb;

INSERT INTO sports
VALUES 	(NULL, 'Football') ,
		(NULL, 'Volleyball'),
		(NULL, 'Tennis');
		
INSERT INTO coaches  (name, egn)
VALUES 	('Ivan Todorov Petkov', '7509041245') ,
		('georgi Ivanov Todorov', '8010091245') ,
		('Ilian Todorov Georgiev', '8407106352') ,
		('Petar Slavkov Yordanov', '7010102045') ,
		('Todor Ivanov Ivanov', '8302160980') , 
		('Slavi Petkov Petkov', '7106041278');
		
INSERT INTO students (name, egn, address, phone, class) 
VALUES 	('Iliyan Ivanov', '9401150045', 'Sofia-Mladost 1', '0893452120', '10') ,
		('Ivan Iliev Georgiev', '9510104512', 'Sofia-Liylin', '0894123456', '11') ,
		('Elena Petrova Petrova', '9505052154', 'Sofia-Mladost 3', '0897852412', '11') ,
		('Ivan Iliev Iliev', '9510104542', 'Sofia-Mladost 3', '0894123457', '11') ,
		('Maria Hristova Dimova', '9510104547', 'Sofia-Mladost 4', '0894123442', '11') ,
		('Antoaneta Ivanova Georgieva', '9411104547', 'Sofia-Krasno selo', '0874526235', '10');
		
INSERT INTO sportGroups
VALUES 	(NULL, 'Sofia-Mladost 1', 'Monday', '08:00:00', 1, 1 ) ,
		(NULL, 'Sofia-Mladost 1', 'Monday', '09:30:00', 1, 2 ) ,
		(NULL, 'Sofia-Liylin 7', 'Sunday', '08:00:00', 2, 1) ,
		(NULL, 'Sofia-Liylin 7', 'Sunday', '09:30:00', 2, 2) ,		
		(NULL, 'Plovdiv', 'Monday', '12:00:00', '1', '1');
		
INSERT INTO student_sport 
VALUES 	(1, 1),
		(2, 1),
		(3, 1),
		(4, 2),
		(5, 2),
		(6, 2),
		(1, 3),
		(2, 3),
		(3, 3);
		
INSERT INTO `school_sport_clubs`.`taxespayments` 
VALUES	(NULL, '1', '1', '200', '1', 2022, now()),
		(NULL, '1', '1', '200', '2', 2022, now()),
		(NULL, '1', '1', '200', '3', 2022, now()),
		(NULL, '1', '1', '200', '4', 2022, now()),
		(NULL, '1', '1', '200', '5', 2022, now()),
		(NULL, '1', '1', '200', '6', 2022, now()),
		(NULL, '1', '1', '200', '7', 2022, now()),
		(NULL, '1', '1', '200', '8', 2022, now()),
		(NULL, '1', '1', '200', '9', 2022, now()),
		(NULL, '1', '1', '200', '10', 2022, now()),
		(NULL, '1', '1', '200', '11', 2022, now()),
		(NULL, '1', '1', '200', '12', 2022, now()),
		(NULL, '2', '1', '250', '1', 2022, now()),
		(NULL, '2', '1', '250', '2', 2022, now()),
		(NULL, '2', '1', '250', '3', 2022, now()),
		(NULL, '2', '1', '250', '4', 2022, now()),
		(NULL, '2', '1', '250', '5', 2022, now()),
		(NULL, '2', '1', '250', '6', 2022, now()),
		(NULL, '2', '1', '250', '7', 2022, now()),
		(NULL, '2', '1', '250', '8', 2022, now()),
		(NULL, '2', '1', '250', '9', 2022, now()),
		(NULL, '2', '1', '250', '10', 2022, now()),
		(NULL, '2', '1', '250', '11', 2022, now()),
		(NULL, '2', '1', '250', '12', 2022, now()),
		(NULL, '3', '1', '250', '1', 2022, now()),
		(NULL, '3', '1', '250', '2', 2022, now()),
		(NULL, '3', '1', '250', '3', 2022, now()),
		(NULL, '3', '1', '250', '4', 2022, now()),
		(NULL, '3', '1', '250', '5', 2022, now()),
		(NULL, '3', '1', '250', '6', 2022, now()),
		(NULL, '3', '1', '250', '7', 2022, now()),
		(NULL, '3', '1', '250', '8', 2022, now()),
		(NULL, '3', '1', '250', '9', 2022, now()),
		(NULL, '3', '1', '250', '10', 2022, now()),
		(NULL, '3', '1', '250', '11', 2022, now()),
		(NULL, '3', '1', '250', '12', 2022, now()),
		(NULL, '1', '2', '200', '1', 2022, now()),
		(NULL, '1', '2', '200', '2', 2022, now()),
		(NULL, '1', '2', '200', '3', 2022, now()),
		(NULL, '1', '2', '200', '4', 2022, now()),
		(NULL, '1', '2', '200', '5', 2022, now()),
		(NULL, '1', '2', '200', '6', 2022, now()),
		(NULL, '1', '2', '200', '7', 2022, now()),
		(NULL, '1', '2', '200', '8', 2022, now()),
		(NULL, '1', '2', '200', '9', 2022, now()),
		(NULL, '1', '2', '200', '10', 2022, now()),
		(NULL, '1', '2', '200', '11', 2022, now()),
		(NULL, '1', '2', '200', '12', 2022, now()),
		(NULL, '4', '2', '200', '1', 2022, now()),
		(NULL, '4', '2', '200', '2', 2022, now()),
		(NULL, '4', '2', '200', '3', 2022, now()),
		(NULL, '4', '2', '200', '4', 2022, now()),
		(NULL, '4', '2', '200', '5', 2022, now()),
		(NULL, '4', '2', '200', '6', 2022, now()),
		(NULL, '4', '2', '200', '7', 2022, now()),
		(NULL, '4', '2', '200', '8', 2022, now()),
		(NULL, '4', '2', '200', '9', 2022, now()),
		(NULL, '4', '2', '200', '10', 2022, now()),
		(NULL, '4', '2', '200', '11', 2022, now()),
		(NULL, '4', '2', '200', '12', 2022, now()),
		/**2021**/
		(NULL, '1', '1', '200', '1', 2021, now()),
		(NULL, '1', '1', '200', '2', 2021, now()),
		(NULL, '1', '1', '200', '3', 2021, now()),
		(NULL, '1', '1', '200', '4', 2021, now()),
		(NULL, '1', '1', '200', '5', 2021, now()),
		(NULL, '1', '1', '200', '6', 2021, now()),
		(NULL, '1', '1', '200', '7', 2021, now()),
		(NULL, '1', '1', '200', '8', 2021, now()),
		(NULL, '1', '1', '200', '9', 2021, now()),
		(NULL, '1', '1', '200', '10', 2021, now()),
		(NULL, '1', '1', '200', '11', 2021, now()),
		(NULL, '1', '1', '200', '12', 2021, now()),
		(NULL, '2', '1', '250', '1', 2021, now()),
		(NULL, '2', '1', '250', '2', 2021, now()),
		(NULL, '2', '1', '250', '3', 2021, now()),
		(NULL, '2', '1', '250', '4', 2021, now()),
		(NULL, '2', '1', '250', '5', 2021, now()),
		(NULL, '2', '1', '250', '6', 2021, now()),
		(NULL, '2', '1', '250', '7', 2021, now()),
		(NULL, '2', '1', '250', '8', 2021, now()),
		(NULL, '2', '1', '250', '9', 2021, now()),
		(NULL, '2', '1', '250', '10', 2021, now()),
		(NULL, '2', '1', '250', '11', 2021, now()),
		(NULL, '2', '1', '250', '12', 2021, now()),
		(NULL, '3', '1', '250', '1', 2021, now()),
		(NULL, '3', '1', '250', '2', 2021, now()),
		(NULL, '3', '1', '250', '3', 2021, now()),
		(NULL, '3', '1', '250', '4', 2021, now()),
		(NULL, '3', '1', '250', '5', 2021, now()),
		(NULL, '3', '1', '250', '6', 2021, now()),
		(NULL, '3', '1', '250', '7', 2021, now()),
		(NULL, '3', '1', '250', '8', 2021, now()),
		(NULL, '3', '1', '250', '9', 2021, now()),
		(NULL, '3', '1', '250', '10', 2021, now()),
		(NULL, '3', '1', '250', '11', 2021, now()),
		(NULL, '3', '1', '250', '12', 2021, now()),
		(NULL, '1', '2', '200', '1', 2021, now()),
		(NULL, '1', '2', '200', '2', 2021, now()),
		(NULL, '1', '2', '200', '3', 2021, now()),
		(NULL, '1', '2', '200', '4', 2021, now()),
		(NULL, '1', '2', '200', '5', 2021, now()),
		(NULL, '1', '2', '200', '6', 2021, now()),
		(NULL, '1', '2', '200', '7', 2021, now()),
		(NULL, '1', '2', '200', '8', 2021, now()),
		(NULL, '1', '2', '200', '9', 2021, now()),
		(NULL, '1', '2', '200', '10', 2021, now()),
		(NULL, '1', '2', '200', '11', 2021, now()),
		(NULL, '1', '2', '200', '12', 2021, now()),
		(NULL, '4', '2', '200', '1', 2021, now()),
		(NULL, '4', '2', '200', '2', 2021, now()),
		(NULL, '4', '2', '200', '3', 2021, now()),
		(NULL, '4', '2', '200', '4', 2021, now()),
		(NULL, '4', '2', '200', '5', 2021, now()),
		(NULL, '4', '2', '200', '6', 2021, now()),
		(NULL, '4', '2', '200', '7', 2021, now()),
		(NULL, '4', '2', '200', '8', 2021, now()),
		(NULL, '4', '2', '200', '9', 2021, now()),
		(NULL, '4', '2', '200', '10', 2021, now()),
		(NULL, '4', '2', '200', '11', 2021, now()),
		(NULL, '4', '2', '200', '12', 2021, now()),
		/**2020**/
		(NULL, '1', '1', '200', '1', 2020, now()),
		(NULL, '1', '1', '200', '2', 2020, now()),
		(NULL, '1', '1', '200', '3', 2020, now()),
		(NULL, '2', '1', '250', '1', 2020, now()),
		(NULL, '3', '1', '250', '1', 2020, now()),
		(NULL, '3', '1', '250', '2', 2020, now()),
		(NULL, '1', '2', '200', '1', 2020, now()),
		(NULL, '1', '2', '200', '2', 2020, now()),
		(NULL, '1', '2', '200', '3', 2020, now()),
		(NULL, '4', '2', '200', '1', 2020, now()),
		(NULL, '4', '2', '200', '2', 2020, now());

UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1200', `hour_salary`='4' WHERE `id`='1';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1300', `hour_salary`='5' WHERE `id`='2';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1800', `hour_salary`='8' WHERE `id`='3';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='2000', `hour_salary`='7' WHERE `id`='4';
UPDATE `school_sport_clubs`.`coaches` SET `month_salary`='1450', `hour_salary`='6' WHERE `id`='5';

INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2021-03-07 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2021-03-14 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2021-03-21 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2021-03-28 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2021-04-04 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('1', '1', '2', '2021-04-11 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2021-03-07 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2021-03-14 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2021-03-21 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2021-03-28 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2021-04-04 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '2', '2', '2021-04-11 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '3', '2', '2021-04-02 08:45:55');
INSERT INTO `school_sport_clubs`.`coach_work` (`coach_id`, `group_id`, `number_of_hours`, `date`) VALUES ('2', '3', '2', '2021-04-09 08:45:55');

SELECT NOW();

SELECT DAY(NOW());

SELECT MONTH(NOW());

SELECT YEAR(NOW());

SELECT IFNULL(NULL, 2);

SELECT IFNULL(1, 2); 

-- 01
use school_sport_clubs;
drop procedure if exists monthSalaryPayment;
delimiter |
create procedure monthSalaryPayment(IN monthOfPayment INT, in yearOFpayment INT, OUT success bit)
procLab: begin
    declare tempCoachSalary decimal;
    declare currentcoachSalary decimal;
    declare iterator int;
    declare countOfCoaches int;
    declare tempCoachId int;
    declare updatedSalaryCounter int;
    declare countOfCoachesWithoutMonthSalary int;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 'SQLException occured';

create temporary table tempCoach(
id int auto_increment primary key,
coach_id int not null,
month_salary int not null
)Engine = Memory;

INSERT INTO tempCoach(coach_id,month_salary)
    SELECT coaches.id, coaches.month_salary
    FROM coaches
    WHERE month_salary IS NOT NULL ;
    
    SELECT COUNT(*)
    INTO countOfCoaches
    FROM tempCoach;

    SET countOfCoachesWithoutMonthSalary = 0;
    set iterator = 1;
    WHILE(iterator >= 1 AND iterator <= countOfCoaches) 
	DO
	SELECT coach_id, month_salary
        INTO tempCoachId, tempCoachSalary
        FROM tempCoach
        where id = iterator;
        
        SELECT salaryAmount
        INTO  currentCoachSalary
        FROM salarypayments
        WHERE `month` = monthOfPayment
        AND `year` = yearOFpayment
        AND `coach_id` = tempCoachId;
        
    IF(IFNULL(currentCoachSalary,0) <= tempCoachSalary) 
THEN 
    SET countOfCoachesWithoutMonthSalary = countOfCoachesWithoutMonthSalary +1; 
 END IF; 
 SET iterator = iterator +1; 
 end while; 
IF(countOfCoachesWithoutMonthSalary = 0)
THEN 
   drop table tempCoach; 
   set success = 0; 
LEAVE procLab;  
 ELSE set iterator = 1;  
 SET updatedSalaryCounter = 0;  
 START TRANSACTION; 
 WHILE(iterator >= 1 AND iterator <= countOfCoaches)
	DO
	SELECT coach_id, month_salary
        INTO tempCoachId, tempCoachSalary
        FROM tempCoach
        where id = iterator;
        
        SELECT salaryAmount
        INTO  currentCoachSalary #има ли заплата вече преведена за този месец и тази година този треньор
        FROM salarypayments
        WHERE `month` = monthOfPayment
        AND `year` = yearOFpayment
        AND `coach_id` = tempCoachId;
        
        
	IF(IFNULL(currentCoachSalary,0) < tempCoachSalary)
	THEN
        INSERT INTO salarypayments(`coach_id`,`month`,`year`,`salaryAmount`,`dateOfPayment`) 
VALUES (tempCoachId, monthOfPayment,yearOFpayment, tempCoachSalary, NOW())
        ON duplicate key update   #ако вече хонорарите му са преведени, то към тези пари да се добави и месечната му заплата.
        salaryAmount = salaryAmount + tempCoachSalary,
        dateOfPayment = NOW();
        set updatedSalaryCounter = updatedSalaryCounter + 1;
   ELSE
        SELECT 'The coach has a month salary yet!';
   END IF;    
        SET iterator = iterator +1;
  end while;
	IF(countOfCoachesWithoutMonthSalary = updatedSalaryCounter) # преведени са толкова заплати, колкото е трябвало
	THEN 
          commit;
	  SET success = 1;
          drop table tempCoach;
    ELSE
	rollback;
	SET success = 0;
        drop table tempCoach;
     END if;   
END IF;
end
|
DELIMITER ;

-- 02
use school_sport_clubs;

drop procedure if exists monthHonorariumPayment;

delimiter |
create procedure monthHonorariumPayment(IN monthOfPayment INT, in yearOFpayment INT)
procLabel: begin
declare countOfCoaches int;
declare iterator int;
declare countOfRowsBeforeUpdate int;
declare countOfRowsAfterUpdate int;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 'SQLException occured';


create temporary table tempCoaches(
id int auto_increment primary key,
coach_id int not null,
monthHourSum int
)Engine = Memory;


create temporary table tempTbl(
id int auto_increment primary key,
coach_id int,
number_of_hours int,
pay_for_hour decimal,
amount decimal,
paymentMonth int,
paymentYear int
)Engine = Memory;
	
	#Плащане на редовна месечна заплата:
    SET @RESULT =0;
	SELECt @RESULT; 
    call monthSalaryPayment(monthOfPayment,yearOFpayment,@RESULT);
    
   	SELECT COUNT(*)
    INTO countOfRowsBeforeUpdate
    FROM coach_work
	where month(coach_work.date) = monthOfPayment
	AND YEAR(coach_work.date) = yearOFpayment
    AND isPayed = 0;

INSERT INTO tempCoaches(coach_id, monthHourSum)  #записваме всички треньори и сумата от техните часове в табличка за дадения месец на дадената година
	SELECT  coach_id, SUM(number_of_hours)
	FROM coach_work
	where month(coach_work.date) = monthOfPayment
	AND YEAR(coach_work.date) = yearOFpayment
    AND isPayed = 0
	GROUP BY coach_work.coach_id;

	set iterator = 1;
	SELECT COUNT(*)
	INTO countOfCoaches
	FROM tempCoaches;

IF(ifnull(countOfCoaches,0) = 0) #Няма треньори, за които да се извършва плащане
	THEN SELECT 'No coaches and hours for this payment period';
		drop table tempTbl;
		drop table tempCoaches;
		LEAVE procLabel;
ELSE
	START TRANSACTION;
	WHILE(iterator >= 1 AND iterator <= countOfCoaches)
	DO
	INSERT INTO tempTbl(coach_id, number_of_hours, pay_for_hour, amount, paymentMonth,paymentYear)
	SELECT tc.coach_id, tc.monthHourSum, c.hour_salary, tc.monthHourSum*c.hour_salary, monthOfPayment, yearOFpayment
        FROM tempCoaches as tc JOIN coaches as c
	ON tc.coach_id = c.id
	WHERE tc.id = iterator;
	SET iterator = iterator + 1;

	END WHILE;
	
	INSERT INTO salarypayments(`coach_id`, `month`,`year`,`salaryAmount`,`dateOfPayment`)
        SELECT coach_id, paymentMonth, paymentYear, amount, NOW()
	FROM tempTbl
        ON DUPLICATE KEY UPDATE 
        salaryAmount = salaryAmount + amount,
        dateOfPayment = NOW();
         

	UPDATE coach_work
        SET isPayed = 1
	WHERE month(coach_work.date) = monthOfPayment
	AND YEAR(coach_work.date) = yearOFpayment
        AND isPayed = 0;
    
        SELECT  ROW_COUNT() INTO countOfRowsAfterUpdate;
    
       IF(countOfRowsBeforeUpdate = countOfRowsAfterUpdate)
      THEN 
		commit;
      ELSE
		rollback;
      END IF;
    
	drop table tempTbl;
	drop table tempCoaches;
END IF;
END
|
DELIMITER ;