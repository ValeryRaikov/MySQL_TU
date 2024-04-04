-- 01
DELIMITER $

DROP PROCEDURE IF EXISTS test_prog $
CREATE PROCEDURE test_prog()

BEGIN

SELECT 
	c.name, sg.location
FROM
	coaches c 
JOIN sportgroups sg ON
	c.id = sg.coach_id;
    
END $

DELIMITER ;

CALL test_prog();

-- 02
-- IN param
DELIMITER $ 

DROP PROCEDURE IF EXISTS test_prog $
CREATE PROCEDURE test_prog(IN test_param VARCHAR(200))

BEGIN

SELECT test_param;
SET test_param = 'Georgi Georgiev';

END $

DELIMITER ;

SET @test = 'Ivan Ivanov';
CALL test_prog(@test);
SELECT @test;

-- OUT param
DELIMITER $ 

DROP PROCEDURE IF EXISTS test_prog $
CREATE PROCEDURE test_prog(OUT test_param VARCHAR(200))

BEGIN

SELECT test_param;
SET test_param = 'Georgi Georgiev';

END $

DELIMITER ;

SET @test = 'Ivan Ivanov';
CALL test_prog(@test);
SELECT @test;

-- INOUT param
DELIMITER $ 

DROP PROCEDURE IF EXISTS test_prog $
CREATE PROCEDURE test_prog(INOUT test_param VARCHAR(200))

BEGIN

SELECT test_param;
SET test_param = 'Georgi Georgiev';

END $

DELIMITER ;

SET @test = 'Ivan Ivanov';
CALL test_prog(@test);
SELECT @test;

-- 03
DELIMITER $

DROP PROCEDURE IF EXISTS checkMonthTax $
CREATE PROCEDURE checkMonthTax(IN studId INT, IN groupId INT, IN paymentMonth INT, IN paymentYear INT)

BEGIN

    DECLARE result CHAR(1);
    SET result = '0';
    
    IF EXISTS (
        SELECT 1
        FROM taxespayments
        WHERE student_id = studId
        AND group_id = groupId
        AND MONTH = paymentMonth
        AND year = paymentYear
    ) THEN
        SET result = '1';
    END IF;
    
    SELECT result AS IsTaxPayed;
    
END $

DELIMITER ;

-- 04
DELIMITER $

DROP PROCEDURE IF EXISTS getPaymentPeriod $
CREATE procedure getPaymentPeriod(IN studId INT, IN groupId INT, IN paymentYear INT)

BEGIN

DECLARE countOfMonths tinyint;
DECLARE monthStr VARCHAR(10);
DECLARE yearStr varchar(10);
SET monthStr = 'MONTH';
SET yearStr = 'YEAR';

	SELECT COUNT(*)
    INTO countOfMonths
    FROM taxespayments
    WHERE student_id = studId
    AND group_id = groupId
    AND year = paymentYear;
    
    CASE countOfMonths
    WHEN 0 THEN SELECT 'This student has not paid for this group/year!' as PAYMENT_PERIOD;
    WHEN 1 THEN SELECT concat('ONE_', monthStr) as PAYMENT_PERIOD;
    WHEN 3 THEN SELECT concat('THREE_',monthStr, 'S') as PAYMENT_PERIOD;
    WHEN 6 THEN SELECT concat('SIX_',monthStr,'S') as PAYMENT_PERIOD;
    WHEN 12 THEN SELECT yearStr as PAYMENT_PERIOD;
    ELSE
		SELECT 	concat(countOfMonths,monthStr,'S') as PAYMENT_PERIOD;
	END CASE;
END $;
|
DELIMITER ;

-- 05
DELIMITER $

DROP PROCEDURE IF EXISTS getAllPaymentsAmount $
CREATE PROCEDURE getAllPaymentsAmount(IN firstMonth INT, IN secMonth INT, IN paymentYear INT, IN studId INT)

BEGIN

	DECLARE iterator int;
	IF(firstMonth >= secMonth)
    THEN 
		SELECT 'Please enter correct months!' as RESULT;
	ELSE IF((SELECT COUNT(*)
			FROM taxesPayments
			WHERE student_id =studId ) = 0)
        THEN SELECT 'Please enter correct student_id!' as RESULT;
		ELSE
	
	SET ITERATOR = firstMonth;

		WHILE(iterator >= firstMonth AND iterator <= secMonth)
		DO
			SELECT student_id, group_id, paymentAmount, month
			FROM taxespayments
			WHERE student_id = studId
			AND year = paymentYear
			AND month = iterator;
    
			SET iterator = iterator + 1;
		END WHILE;
		END IF;
    
    END IF;
END $;
|
DELIMITER ;