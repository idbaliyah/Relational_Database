# Relational_Database
# Data Manipulation Language in MySQL
MySQL is a popular open-source relational database management system that provides a variety of data manipulation language (DML) statements to perform actions on the data stored in the database.

DML Statements in MySQL
SELECT - retrieves data from one or more tables
INSERT - adds new data into a table
UPDATE - modifies existing data in a table
DELETE - removes data from a table
Syntax
SELECT: SELECT column1, column2 FROM table_name;
INSERT: INSERT INTO table_name (column1, column2) VALUES (value1, value2);
UPDATE: UPDATE table_name SET column1 = value1 WHERE condition;
DELETE: DELETE FROM table_name WHERE condition;
JOIN
MySQL also provides the ability to join multiple tables to retrieve data based on relationships between them.

INNER JOIN - returns rows that have matching values in both tables
LEFT JOIN (or LEFT OUTER JOIN) - returns all rows from the left table (table1), and the matching rows from the right table (table2)
RIGHT JOIN (or RIGHT OUTER JOIN) - returns all rows from the right table (table2), and the matching rows from the left table (table1)
FULL OUTER JOIN - returns all rows from both tables, with the matching rows from both sides
Syntax
INNER JOIN: SELECT column1, column2 FROM table1 INNER JOIN table2 ON table1.column = table2.column;
LEFT JOIN: SELECT column1, column2 FROM table1 LEFT JOIN table2 ON table1.column = table2.column;
RIGHT JOIN: SELECT column1, column2 FROM table1 RIGHT JOIN table2 ON table1.column = table2.column;
FULL OUTER JOIN: SELECT column1, column2 FROM table1 FULL OUTER JOIN table2 ON table1.column = table2.column;
