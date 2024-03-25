-- 4
SELECT s1.name as student1, s2.name AS student2 
from students as s1
JOIN student_sport AS ss1 ON ss1.student_id = s1.id
JOIN students as s2 ON ss1.sportGroup_id = 
(SELECT sportGroup_id FROM student_sport WHERE student_id=s2.id LIMIT 1)
JOIN student_sport AS ss2 ON s2.id=ss2.student_id 
AND ss1.sportGroup_id=ss2.sportGroup_id 
AND s1.id < s2.id
JOIN sportGroups AS sg ON ss1.sportGroup_id=sg.id
JOIN sports as sp ON sg.sport_id=sp.id
WHERE sp.name='Football';

-- 5
CREATE VIEW studentsAtEight AS
SELECT students.name as Students, students.class as Class, sg.location as Location, c.name as Coach FROM students
JOIN student_sport as ss ON ss.student_id=students.id
JOIN sportgroups as sg ON ss.sportGroup_id = sg.id
JOIN coaches as c ON c.id = sg.coach_id
WHERE sg.hourOfTraining='8:00:00';

-- 6
SELECT sports.name as Sport, COUNT(sg.sport_id) as "Stundets Count" FROM sports
JOIN sportgroups as sg ON sg.sport_id = sports.id
JOIN student_sport as ss ON sg.id = ss.sportGroup_id
JOIN students as s ON s.id = ss.student_id
GROUP BY Sport;