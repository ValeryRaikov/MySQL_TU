-- 01
CREATE VIEW CoachPayments AS
SELECT 
    c.name AS Coach_Name,
    s.name AS Sport_Name,
    sg.location AS Group_Location,
    sg.dayOfWeek AS Training_Day,
    sg.hourOfTraining AS Training_Time,
    CONCAT('$', FORMAT((c.month_salary + IFNULL((cw.number_of_hours * c.hour_salary), 0)), 2)) AS Total_Payment
FROM 
    coach_work cw
JOIN 
    coaches c ON cw.coach_id = c.id
JOIN 
    sportGroups sg ON cw.group_id = sg.id
JOIN 
    sports s ON sg.sport_id = s.id
WHERE 
    MONTH(cw.date) = MONTH(CURRENT_DATE()) AND YEAR(cw.date) = YEAR(CURRENT_DATE());
 
SELECT * FROM CoachPayments;

-- 02
DELIMITER $

DROP PROCEDURE IF EXISTS StudentsInMultipleGroups;
CREATE PROCEDURE StudentsInMultipleGroups()
BEGIN
    SELECT s.name AS StudentName
    FROM students s
    JOIN (
        SELECT student_id
        FROM student_sport
        GROUP BY student_id
        HAVING COUNT(*) > 1
    ) m ON s.id = m.student_id;
END $

DELIMITER ;

CALL StudentsInMultipleGroups();

-- 03
DELIMITER $

DROP PROCEDURE IF EXISTS CoachesWithNoGroups;
CREATE PROCEDURE CoachesWithNoGroups()
BEGIN
    SELECT c.name AS CoachName
    FROM coaches c
    WHERE c.id NOT IN (SELECT DISTINCT g.coach_id FROM sportGroups g);
END $

DELIMITER ;

CALL CoachesWithNoGroups();

-- 04 / 05
DELIMITER $
 
DROP PROCEDURE IF EXISTS ConvertCurrency;
CREATE PROCEDURE ConvertCurrency(
    IN amount_to_convert DOUBLE,
    IN exchange_rate DOUBLE,
    OUT converted_amount DOUBLE
)
BEGIN
    SET converted_amount = amount_to_convert * exchange_rate;
END $
 
DROP PROCEDURE IF EXISTS TransferFunds;
CREATE PROCEDURE TransferFunds(
    IN source_account_id INT,
    IN target_account_id INT,
    IN amount DOUBLE,
    IN exchange_rate DOUBLE
)
BEGIN
    DECLARE source_currency VARCHAR(10);
    DECLARE target_currency VARCHAR(10);
    DECLARE converted_amount DOUBLE;
 
    SELECT currency INTO source_currency
    FROM customer_accounts
    WHERE id = source_account_id;
 
    SELECT currency INTO target_currency
    FROM customer_accounts
    WHERE id = target_account_id;
 
    IF (source_currency = 'BGN' AND target_currency = 'EUR') OR (source_currency = 'EUR' AND target_currency = 'BGN') THEN
        IF source_currency != target_currency THEN
            CALL convert_currency(amount, exchange_rate, converted_amount);
        ELSE
            SET converted_amount = amount;
        END IF;
 
        IF (SELECT amount FROM customer_accounts WHERE id = source_account_id) >= amount THEN
            UPDATE customer_accounts SET amount = amount - converted_amount WHERE id = source_account_id;
            UPDATE customer_accounts SET amount = amount + converted_amount WHERE id = target_account_id;
            SELECT 'Transaction successful' AS message;
        ELSE
            SELECT 'Insufficient funds' AS message;
        END IF;
    ELSE
        SELECT 'Incompatible currencies' AS message;
    END IF;
END $
 
DELIMITER ;

CALL TransferFunds(1 , 2, 1000, 1.95);