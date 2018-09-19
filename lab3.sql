SELECT lastname FROM employees; 
SELECT DISTINCT lastname FROM employees;

SELECT *FROM employees WHERE lastname = 'Smith';
SELECT *FROM employees WHERE lastname = 'Smith' or lastname = 'Doe';
SELECT *FROM employees WHERE department = 14;
SELECT *FROM employees WHERE department = 37 or department = 77;
SELECT sum(budget) FROM departments;
SELECT department,count(*) FROM employees GROUP BY department;
SELECT department,count(*) FROM employees GROUP BY department HAVING count(*) > 2;
SELECT name FROM departments WHERE budget = 155000;
SELECT name,lastname FROM employees WHERE department = 37;
SELECT name FROM employees WHERE city = 'Almaty';
SELECT *FROM departments WHERE budget > 60000 ORDER BY budget ASC, code DESC;
UPDATE departments SET budget = budget - 0.1*budget WHERE budget = 15000;
UPDATE employees SET department = 14 WHERE department = 77 RETURNING *;
DELETE FROM employees WHERE department = 14 RETURNING *;
DELETE FROM employees RETURNING *;