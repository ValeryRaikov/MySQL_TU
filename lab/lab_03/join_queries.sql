-- Working with school_sport_clubs DB from the previous lab

SELECT sports.name, sportGroups.location
FROM sports LEFT JOIN sportGroups
	ON sports.id = sportGroups.sport_id
		WHERE sportGroups.sports.sport_id IS NULL;
        
SELECT sports.name, sportGroups.location
FROM sports RIGHT JOIN sportGroups
	ON sports.id = sportGroups.sports_id
		WHERE sports_id IS NULL;
        
SELECT sports.name, coaches.name
FROM sports JOIN coaches
	ON sports.id IN (
		SELECT sport_id FROM sportGroups
			WHERE sportGroups.coach_id = coaches.id
    );

-- Similar to the previous
SELECT DISTINCT sports.name, coaches.name
FROM sports JOIN sportGroups.sport_id 
	ON sports.id = sportGroups.sport_id
		JOIN coaches
			ON coaches.id = sportGroups.coach_id;

-- Tasks related to the school_sport_clubs DB
INSERT INTO students (name, egn, address, phone, class)
VALUES ('Ivan Ivanov Ivanov', '9207186371', 'София-Сердика', '0888892950', '10');

SELECT * FROM students ORDER BY name;

DELETE FROM students WHERE name = 'Ivan Ivanov Ivanov';

SELECT s.name AS student_name, sp.name AS sport_name
FROM students AS s	JOIN student_sport AS ss 
	ON s.id = ss.student_id JOIN sportGroups AS sg 
		ON ss.sportGroup_id = sg.id JOIN sports AS sp 
			ON sg.sport_id = sp.id;

SELECT s.name AS student_name, s.class, sg.id AS group_id
FROM students AS s	JOIN student_sport AS ss 
	ON s.id = ss.student_id JOIN sportGroups AS sg 
		ON ss.sportGroup_id = sg.id
		WHERE sg.dayOfWeek = 'Monday';

SELECT c.name AS coach_name
FROM coaches AS c JOIN sportGroups AS sg 
	ON c.id = sg.coach_id JOIN sports AS sp 
		ON sg.sport_id = sp.id
		WHERE sp.name = 'Football';

SELECT location, hourOfTraining, dayOfWeek
FROM sportGroups
WHERE sport_id = (SELECT id FROM sports WHERE name = 'Volleyball');

SELECT sp.name AS sport_name
FROM students AS s JOIN student_sport AS ss 
	ON s.id = ss.student_id JOIN sportGroups AS sg 
		ON ss.sportGroup_id = sg.id JOIN sports AS sp 
			ON sg.sport_id = sp.id
			WHERE s.name = 'Iliyan Ivanov';

SELECT s.name AS student_name
FROM students AS s JOIN student_sport AS ss 
	ON s.id = ss.student_id JOIN sportGroups AS sg 
		ON ss.sportGroup_id = sg.id JOIN sports AS sp 
			ON sg.sport_id = sp.id JOIN coaches AS c 
				ON sg.coach_id = c.id
				WHERE sp.name = 'Football' AND c.name = 'Ivan Todorov Petkov';