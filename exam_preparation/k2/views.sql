USE television_db;

--01
CREATE OR REPLACE VIEW view_general_show_info AS
SELECT 
	s.show_name AS 'Show Name',
    s.description AS 'Description',
    p.program_name AS 'Program Name',
    GROUP_CONCAT(CONCAT(h.first_name, ' ', h.last_name)) AS 'Host Names',
    GROUP_CONCAT(CONCAT(a.first_name, ' ', a.last_name)) AS 'Actor Names'
FROM shows s 
JOIN programs p ON s.program_id = p.id
JOIN show_hosts sh ON s.id = sh.show_id
JOIN hosts h ON sh.host_id = h.id
JOIN show_actors sa ON s.id = sa.show_id
JOIN actors a ON sa.actor_id = a.id
GROUP BY 
	s.show_name,
    s.description,
    p.program_name
HAVING 
	COUNT(a.id) > 2
ORDER BY 
	s.show_name,
    p.program_name;
    
SELECT * FROM view_general_show_info;

--02
CREATE OR REPLACE VIEW view_user_votes AS
SELECT 
	s.show_name AS 'Show Name',
    s.image_url AS 'Show Logo',
    COUNT(v.show_id) AS 'Show Votes'
FROM shows s 
JOIN votes v ON s.id = v.show_id
WHERE 
	s.image_url IS NOT NULL
GROUP BY
	s.show_name,
    s.image_url
ORDER BY 
	COUNT(v.show_id) DESC;
    
SELECT * FROM view_user_votes;		