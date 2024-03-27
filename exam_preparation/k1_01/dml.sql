-- 01
CREATE VIEW view_most_important AS
SELECT 
	b.title AS bookTitle,
    b.description AS bookDescription,
    a.name AS authorName,
    g.name AS genreName,
    p.name AS publisherName
FROM books b
JOIN authorsBooks ab ON
	b.id = ab.book_id
JOIN authors a ON
	ab.author_id = a.id
JOIN booksGenres bg ON
	b.id = bg.book_id
JOIN genres g ON
	bg.genre_id = g.id
JOIN publishers p ON
	b.publisher_id = p.id;

-- 02
SELECT 
    b.title AS bookTitle,
    p.name AS publisherName
FROM books b
LEFT JOIN publishers p ON 
	b.publisher_id = p.id
UNION
SELECT 
    b.title AS bookTitle,
    p.name AS publisherName
FROM books b
RIGHT JOIN publishers p ON 
	b.publisher_id = p.id;

-- 03
SELECT
	b.title AS bookTitle,
    GROUP_CONCAT(a.name ORDER BY a.id) AS authorNames
FROM books b
JOIN authorsBooks ab ON 
	b.id = ab.book_id
JOIN authors a ON
	ab.author_id = a.id
GROUP BY 
	bookTitle
HAVING 
	COUNT(ab.author_id) = 2;

-- 04
SELECT 
	COUNT(lb.user_id) AS numberOfBooks,
    u.name AS userName,
    u.phone AS userPhone,
    u.email AS userEmail
FROM loanBooks lb
JOIN users u ON
	lb.user_id = u.id
JOIN books b
	ON lb.id = b.id
JOIN publishers p
	ON b.publisher_id = p.id
WHERE
	p.name = 'TU-Soia'
GROUP BY 
	userName,
    userPhone,
    userEmail
HAVING 
	numberOfBooks > 5;