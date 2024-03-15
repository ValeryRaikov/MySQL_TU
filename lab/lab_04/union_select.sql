-- 01
SELECT name, egn FROM students
UNION
SELECT name, egn FROM coaches;

--02
SELECT 
coaches.name AS coachName, sports.name AS sports
FROM coaches JOIN sports
ON coaches.id IN (
	SELECT coach_id
    FROM sport_groups
    WHERE sport_groups_id = sports.id
);

-- 03
SELECT firstpl.name AS firstPlayer, secondpl.name AS secondPlayer, sports. name AS sportName
FROM students AS firstpl JOIN students AS secondpl
ON firstpl.id > secondpl.id
JOIN sports ON (
secondpl.id IN( 
	SELECT student_id
	FROM student_sport
	WHERE sportGroup_id IN(
		SELECT id
		FROM sportgroups
		WHERE sport_id = sports.id
        )
	)
	AND (firstPl.id IN( SELECT student_id
	FROM student_sport
	WHERE sportGroup_id IN(
		SELECT id
		FROM sportgroups
		WHERE sport_id = sports.id)
		)
	)
) 
WHERE firstPL.id IN(
	SELECT student_id
	FROM student_sport
	WHERE sportGroup_id IN(
		SELECT sportGroup_id
		FROM student_sport
		WHERE student_id = secondl.id)
)
ORDER BY sportName;

-- Tasks related to the same database
--01
SELECT s.name, s.class, s.phone
FROM students AS s
JOIN student_sport AS ss ON s.id = ss.student_id
JOIN sport_groups AS sg ON ss.sportGroup_id = sg.id
JOIN sports sp ON sg.sport_id = sp.id
WHERE sp.name = 'Football';

--02
SELECT c.name
FROM coaches AS c
JOIN sport_groups AS sg ON c.id = sg.coach_id
JOIN sports AS sp ON sg.sport_id = sp.id
WHERE sp.name = 'Volleyball';

--03
SELECT c.name AS coach_name, sp.name AS sport_name
FROM students AS s
JOIN student_sport AS ss ON s.id = ss.student_id
JOIN sport_groups AS sg ON ss.sportGroup_id = sg.id
JOIN sports AS sp ON sg.sport_id = sp.id
JOIN coaches AS c ON sg.coach_id = c.id
WHERE s.name = 'Илиян Иванов';

--04
SELECT s.name AS student_name, s.class, sg.location, c.name AS coach_name
FROM students AS s
JOIN student_sport AS ss ON s.id = ss.student_id
JOIN sport_groups AS sg ON ss.sportGroup_id = sg.id
JOIN coaches AS c ON sg.coach_id = c.id
WHERE HOUR(sg.hourOfTraining) = 8;