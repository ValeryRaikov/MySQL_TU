-- 01
SELECT 
	name 
FROM 
	actors 
WHERE 
	gender = 'M' AND address IN ('NewYork', 'California', 'Texas');

-- 02
SELECT 
	*
FROM
	movies
WHERE
	release_year BETWEEN 1990 AND 2000
ORDER BY 
	budget DESC
LIMIT 3;

-- 03
SELECT 
    m.title AS movieTitle,
    GROUP_CONCAT(a.name) AS actorsNames
FROM 
    movies m
JOIN 
    movie_actors ma ON m.id = ma.movie_id
JOIN 
    actors a ON ma.actor_id = a.id
WHERE 
    m.studio_id = (
        SELECT 
            id
        FROM 
            studios
        WHERE 
            name = 'IFS-200'
    )
GROUP BY 
    m.title;

-- 04
SELECT 
    m.title AS movieTitle,
    s.name AS studioName,
    m.producer AS producerName
FROM movies m
JOIN studios s ON 
	m.studio_id = s.id;

-- 05
SELECT 
    a.name AS actorName,
    m.title AS movieTitle,
    m.budget AS movieBudget
FROM 
    actors a
JOIN 
    movie_actors ma ON a.id = ma.actor_id
JOIN 
    movies m ON ma.movie_id = m.id
WHERE 
    m.budget = (
        SELECT 
            MIN(budget)
        FROM 
            movies
    )
ORDER BY 
    m.budget;

-- 06
SELECT 
    a.name AS actorName,
    AVG(m.length) AS averageFilmLength
FROM 
    actors a
JOIN 
    movie_actors ma ON a.id = ma.actor_id
JOIN 
    movies m ON ma.movie_id = m.id
WHERE 
    m.length > (
        SELECT 
            AVG(length)
        FROM 
            movies
        WHERE 
            release_year < 2000
    )
GROUP BY 
    actorName;