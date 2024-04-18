-- 01
DELIMITER $

DROP TRIGGER IF EXISTS salarypayments_delete_trigger;
CREATE TRIGGER salarypayments_delete_trigger
AFTER DELETE ON salarypayments
FOR EACH ROW
BEGIN
    INSERT INTO salarypayments_log (
        operation,
        old_coach_id,
        old_month,
        old_year,
        old_salaryAmount,
        old_dateOfPayment,
        dateOfLog
    ) VALUES (
        'DELETE',
        OLD.coach_id,
        OLD.month,
        OLD.year,
        OLD.salaryAmount,
        OLD.dateOfPayment,
        NOW()
    );
END$
 
DELIMITER ;

-- 02
DELETE FROM salarypayments
WHERE id = 1;
 
INSERT INTO salarypayments (coach_id, month, year, salaryAmount, dateOfPayment)
SELECT old_coach_id, old_month, old_year, old_salaryAmount, old_dateOfPayment
FROM salarypayments_log
WHERE operation = 'DELETE';

-- 03
DELIMITER $
 
DROP PROCEDURE IF EXISTS check_student_groups;
CREATE TRIGGER check_student_groups
BEFORE INSERT ON student_sport
FOR EACH ROW
BEGIN
    DECLARE group_count INT;
 
    SELECT COUNT(*)
    INTO group_count
    FROM student_sport
    WHERE student_id = NEW.student_id;
 
    IF group_count >= 2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ученикът тренира вече в две групи!';
    END IF;
END$
 
DELIMITER ;

SELECT * FROM salarypayments_log;
CALL coach_students('Ivan Todorov Petkov');
 
CALL sport_coaches('Football');
SELECT * FROM student_groups;
SELECT * FROM student_sport;
SHOW TRIGGERS LIKE 'check_student_groups';

-- 04
DROP VIEW IF EXISTS student_groups;
CREATE VIEW student_groups AS
SELECT s.name AS student_name, COUNT(ss.student_id) AS group_count
FROM students s
LEFT JOIN student_sport ss ON s.id = ss.student_id
GROUP BY s.name;

SELECT 
	*
FROM 
	student_groups;
    
-- 05
DELIMITER $

DROP PROCEDURE IF EXISTS coach_students;
CREATE PROCEDURE coach_students(IN coach_name VARCHAR(255))
BEGIN
    SELECT s.name AS student_name, sg.id AS group_id, sp.name AS sport_name
    FROM students s
    JOIN student_sport ss ON s.id = ss.student_id
    JOIN sportGroups sg ON ss.sportGroup_id = sg.id
    JOIN sports sp ON sg.sport_id = sp.id
    JOIN coaches c ON sg.coach_id = c.id
    WHERE c.name = coach_name;
END$

DELIMITER ;

CALL coach_students('Ivan Todorov Petkov');

-- 06
DELIMITER $

DROP PROCEDURE IF EXISTS sport_coaches;
CREATE PROCEDURE sport_coaches(IN sport_name VARCHAR(255))
BEGIN
    SELECT c.name AS coach_name, sg.location, sg.dayOfWeek, sg.hourOfTraining
    FROM sportGroups sg
    JOIN coaches c ON sg.coach_id = c.id
    JOIN sports sp ON sg.sport_id = sp.id
    WHERE sp.name = sport_name;
END$

DELIMITER ;

CALL sport_coaches('Volleyball');