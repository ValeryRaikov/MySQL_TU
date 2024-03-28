USE school_sport_clubs;

SELECT 
	s.name, 
    s.class, 
    s.phone
FROM students s
JOIN student_sport ss ON 
	s.id = ss.student_id
JOIN sportgroups sg ON 
	ss.sportGroup_id = sg.id
JOIN sports sp ON 
	sg.sport_id = sp.id
WHERE 
	sp.name = 'Football';
    
SELECT 
	c.name
FROM coaches c
JOIN sportgroups sg ON 
	c.id = sg.coach_id
JOIN sports sp ON 
	sg.sport_id = sp.id
WHERE 
	sp.name = 'Volleyball';

SELECT 
	c.name AS coachName, 
	sp.name AS sportName, 
    sg.dayOfWeek AS dayOfWeek, 
    sg.location AS location
FROM students s
JOIN student_sport ss ON 
	s.id = ss.student_id
JOIN sportgroups sg ON 
	ss.sportGroup_id = sg.id
JOIN sports sp ON 
	sg.sport_id = sp.id
JOIN coaches c ON 
	sg.coach_id = c.id
WHERE 
	s.name = 'Maria Hristova Dimova';

SELECT 
	tp.month, 
    SUM(tp.paymentAmount) AS totalPaid
FROM taxespayments tp
JOIN students s ON 
	tp.student_id = s.id
JOIN sportgroups sg ON 
	tp.group_id = sg.id
JOIN coaches c ON
	sg.coach_id = c.id
WHERE 
	tp.paymentAmount > 700 AND 
    c.egn = '7509041245'
GROUP BY 
    tp.month;

SELECT 
	COUNT(DISTINCT s.id) AS numOfStudents
FROM students s
JOIN student_sport ss ON 
	s.id = ss.student_id
JOIN sportgroups sg ON 
	ss.sportGroup_id = sg.id
JOIN sports sp ON 
	sg.sport_id = sp.id
WHERE 
	sp.name = 'Football';

SELECT 
	c.name AS coachName, 
    IFNULL(sp.name, 'No Sport') AS sportName
FROM coaches c
LEFT JOIN sportgroups sg ON 
	c.id = sg.coach_id
LEFT JOIN sports sp ON 
	sg.sport_id = sp.id;

SELECT 
	sp.name AS sportName, 
	sg.location, 
	COUNT(ss.student_id) AS numOfStudents
FROM sportgroups sg
JOIN sports sp ON 
	sg.sport_id = sp.id
JOIN student_sport ss ON 
	sg.id = ss.sportGroup_id
GROUP BY 
	sg.id
HAVING 
	numOfStudents > 3;

