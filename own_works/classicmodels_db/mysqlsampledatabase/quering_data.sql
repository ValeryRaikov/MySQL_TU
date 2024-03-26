-- SELECT FROM
SELECT firstName, lastName
FROM employees; 

SELECT firstName, lastName, email, jobTitle
FROM employees;

SELECT * 
FROM employees;

-- SELECT
SELECT NOW();

SELECT CONCAT('Valery', ' ', 'Raikov');

SELECT CONCAT(firstName, ' ', lastName) AS fullName
FROM employees;

-- ORDER BY
SELECT contactLastName, contactFirstName
FROM customers
ORDER BY 
	contactLastName;

SELECT contactLastName, contactFirstName
FROM customers
ORDER BY 
	contactLastName DESC,
    contactFirstName ASC;

SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach AS totalCost
FROM 
    orderdetails 
ORDER BY 
    totalCost DESC;

SELECT 
    orderNumber, 
    status 
FROM 
    orders 
ORDER BY 
    FIELD(
        status, 
        'In Process', 
        'On Hold', 
        'Cancelled', 
        'Resolved', 
        'Disputed', 
        'Shipped'
    );

-- WHERE
SELECT firstName, lastName, jobTitle
FROM employees
WHERE jobTitle = 'Sales Rep';

SELECT 
	employeeNumber,
	CONCAT(firstName, ' ', lastName) AS fullName
FROM 
	employees
WHERE
	jobTitle = 'Sales Rep' AND
	officeCode = 1
ORDER BY
    fullName;
    
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 2
ORDER BY 
    officeCode , 
    jobTitle;
    
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY 
	officeCode;
    
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY 
	firstName;
    
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;
    
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';
    
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;

-- SELECT DISTINCT
SELECT DISTINCT lastname
FROM employees
ORDER BY 
	lastname;
    
SELECT DISTINCT state
FROM customers;

SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;

-- AND
SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA' AND 
    creditlimit > 100000;

-- OR
SELECT    
    customername, 
    country, 
    creditLimit
FROM    
    customers
WHERE 
    country = 'USA'
    OR country = 'France'
    AND creditlimit > 100000;

-- IN
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');

-- NOT IN
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city;

-- LIMIT
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit, 
    customerNumber
LIMIT 5;

SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY 
    customerName    
LIMIT 10, 10;

-- IS NULL
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName;

-- TABLE AND COLUMN ALIASES
SELECT 
	CONCAT_WS(' ', firstName, lastName) AS fullName
FROM 
    employees;
    
SELECT 
    e.firstName, 
    e.lastName
FROM
    employees e
ORDER BY e.firstName;

-- (IN THIS JOIN SECTION I USE THE setup.sql FILE!)
-- INNER JOIN
SELECT 
	m.member_id,
    m.name,
    c.committee_id,
    c.name
FROM members AS m
INNER JOIN committees AS c 
ON m.name = c.name; 

-- LEFT JOIN
SELECT 
	m.member_id,
    m.name AS member,
    c.committee_id,
    c.name AS committee
FROM members AS m
LEFT JOIN committees AS c
USING(name);

-- RIGHT JOIN
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members AS m
RIGHT JOIN committees AS c 
USING(NAME);

-- CROSS JOIN
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
CROSS JOIN committees c;

-- (IN THIS JOIN SECTION I USE THE classicmodels DB)
-- INNER JOIN MORE
SELECT 
	productCode,
    productName,
    textDescription
FROM products p
INNER JOIN productlines pl
ON p.productLine = pl.productLine;

SELECT 
    o.orderNumber,
    o.status,
    SUM(quantityOrdered * priceEach) total
FROM orders o
INNER JOIN orderdetails od 
USING(orderNumber)
GROUP BY o.orderNumber;

SELECT 
	o.orderNumber,
    o.orderDate,
    od.orderLineNumber,
    p.productName,
    od.quantityOrdered,
    od.priceEach
FROM orders o
INNER JOIN orderdetails od
	USING(orderNumber)
INNER JOIN products p 
	USING(productCode)
ORDER BY 
	orderNumber,
    orderLineNumber;
    
SELECT 
    o.orderNumber,
    o.orderDate,
    c.customerName,
    c.creditLimit,
    od.orderLineNumber,
    p.productName,
    od.quantityOrdered,
    od.priceEach
FROM
    orders o
INNER JOIN orderdetails od
    USING (orderNumber)
INNER JOIN products p
    USING (productCode)
INNER JOIN customers c
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;

-- LEFT JOIN
SELECT
    c.customerNumber,
    c.customerName,
    o.orderNumber,
    o.status
FROM
    customers c
LEFT JOIN orders o 
   USING(customerNumber);
   
SELECT 
    e.lastName, 
    e.firstName, 
    c.customerName, 
    p.checkNumber, 
    p.amount
FROM
    employees e
LEFT JOIN customers c 
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN payments p 
	ON p.customerNumber = c.customerNumber
ORDER BY 
    customerName, 
    checkNumber;

-- RIGHT JOIN
SELECT 
    e.employeeNumber, 
    c.customerNumber
FROM
    customers c
RIGHT JOIN employees e
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;
    
SELECT 
    e.employeeNumber, 
    c.customerNumber
FROM
    customers c
RIGHT JOIN employees e 
	ON salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

-- GROUP BY
SELECT 
    status 
FROM 
    orders 
GROUP BY 
    status;
-- this will return the same as using SELECT DISTINCT

SELECT 
    status, 
    COUNT(*) 
FROM 
    orders 
GROUP BY 
    status;

SELECT 
	status, 
	SUM(quantityOrdered * priceEach) AS amount 
FROM orders 
INNER JOIN orderdetails 
	USING (orderNumber) 
GROUP BY 
	status;
    
SELECT 
	YEAR(orderDate) AS year, 
	SUM(quantityOrdered * priceEach) AS total 
FROM orders 
INNER JOIN orderdetails 
	USING (orderNumber) 
WHERE 
	status = 'Shipped' 
GROUP BY 
	YEAR(orderDate);
    
SELECT 
	YEAR(orderDate) AS year, 
	SUM(quantityOrdered * priceEach) AS total 
FROM orders 
INNER JOIN orderdetails 
	USING (orderNumber) 
WHERE 
	status = 'Shipped' 
GROUP BY 
	year 
HAVING 
	year > 2003;
  
SELECT 
	YEAR(orderDate) AS year, 
	status, 
	SUM(quantityOrdered * priceEach) AS total 
FROM orders 
INNER JOIN orderdetails 
	USING (orderNumber) 
GROUP BY 
    year, 
    status 
ORDER BY 
    year;

-- HAVING
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING 
    total > 1000 AND itemsCount > 600;

-- HAVING COUNT
SELECT 
    customerName, 
    COUNT(*) order_count 
FROM orders 
INNER JOIN customers 
    USING (customerNumber) 
GROUP BY 
    customerName 
HAVING 
    COUNT(*) > 4 
ORDER BY 
    order_count;

-- SUBQUERIES
SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (
		SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA'
	);

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (
		SELECT 
            AVG(amount)
        FROM
            payments
	);

SELECT 
    MAX(items), 
    MIN(items), 
    FLOOR(AVG(items))
FROM
    (SELECT 
        orderNumber, COUNT(orderNumber) AS items
    FROM
        orderdetails
    GROUP BY orderNumber) AS lineitems;

SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( SELECT 
            orderNumber, SUM(priceEach * quantityOrdered)
        FROM
            orderdetails
                INNER JOIN
            orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING SUM(priceEach * quantityOrdered) > 60000);

-- DERIVED TABLES 
SELECT 
    customerGroup, 
    COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT 
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;    