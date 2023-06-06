'''
=	Equal	
>	Greater than	
<	Less than	
>=	Greater than or equal	
<=	Less than or equal	
<>	Not equal. N !=	
BETWEEN	Between a certain range	
LIKE	Search for a pattern	
IN	To specify multiple possible values for a column'''

'WHERE Syntax'
SELECT column1, column2, ...
FROM table_name
WHERE condition;


'SELECT DISTINCT Syntax'
SELECT DISTINCT column1, column2, ...
FROM table_name;

'AND Syntax'
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

'OR Syntax'
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

'NOT Syntax'
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

'ORDER BY Syntax'
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;


'MIN() Syntax'
SELECT MIN(column_name)
FROM table_name
WHERE condition;

'MAX() Syntax'
SELECT MAX(column_name)
FROM table_name
WHERE condition;


'The COUNT() function returns the number of 
rows that matches a specified criterion.'

'COUNT() Syntax'
SELECT COUNT(column_name)
FROM table_name
WHERE condition;


'The AVG() function returns the average value of a numeric column. '

'AVG() Syntax'
SELECT AVG(column_name)
FROM table_name
WHERE condition;

'The SUM() function returns the total sum of a numeric column. '

'SUM() Syntax'
SELECT SUM(column_name)
FROM table_name
WHERE condition;

'The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

 The percent sign (%) represents zero, one, or multiple characters
 The underscore sign (_) represents one, single character'

'LIKE Syntax'
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

WHERE CustomerName LIKE 'a%'	'Finds any values that start with "a"'
WHERE CustomerName LIKE '%a'	'Finds any values that end with "a"'
WHERE CustomerName LIKE '%or%'	'Finds any values that have "or" in any position'
WHERE CustomerName LIKE '_r%'	'Finds any values that have "r" in the second position'
WHERE CustomerName LIKE 'a_%'	'Finds any values that start with "a" and are at least 2 characters in length'
WHERE CustomerName LIKE 'a__%'	'Finds any values that start with "a" and are at least 3 characters in length'
WHERE ContactName LIKE 'a%o'	'Finds any values that start with "a" and ends with "o"'


The IN operator allows you to specify multiple values in a WHERE clause.

The IN operator is a shorthand for multiple OR conditions.


'IN  NOT IN Syntax'
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT * FROM Customers
WHERE Country NOT IN (value1, value2, ...);


'BETWEEN Syntax'
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

'Alias Column Syntax'
SELECT column_name AS alias_name
FROM table_name;
'Alias Table Syntax'
SELECT column_name(s)
FROM table_name AS alias_name;

A JOIN clause is used to combine rows from two or more tables, based on a related column between them.


INNER JOIN: 'Returns records that have matching values in both tables'
LEFT JOIN: 'Returns all records from the left table, and the matched records from the right table'
RIGHT JOIN: 'Returns all records from the right table, and the matched records from the left table'
FULL JOIN: 'Returns all records when there is a match in either left or right table'


SELECT *
FROM orders
LEFT JOIN customers ON orders.customerid = customers.customerid ;


The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".

The GROUP BY statement is often used with aggregate 
functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the 
result-set by one or more columns.

'GROUP BY Syntax'
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;







