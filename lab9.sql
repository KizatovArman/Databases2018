CREATE DATABASE lab9;--1

CREATE TABLE salesman(
	salesman_id INTEGER PRIMARY KEY,
	name VARCHAR(255),
	city VARCHAR(255),
	commission NUMERIC
);

CREATE TABLE customers(
	customer_id INTEGER PRIMARY KEY,
	cust_name VARCHAR(255),
	city VARCHAR(255),
	grade INTEGER,
	salesman_id INTEGER REFERENCES salesman
);

CREATE TABLE orders(
	ord_no INTEGER PRIMARY KEY,
	purch_amt NUMERIC,
	ord_date DATE,
	customer_id INTEGER REFERENCES customers,
	salesman_id INTEGER REFERENCES salesman
); --2

CREATE ROLE junior_dev LOGIN;--3

CREATE VIEW salesman_from_NY AS SELECT * FROM salesman WHERE city = 'New York';--4

CREATE VIEW salesman_customer_names AS SELECT s.name,c.cust_name FROM salesman AS s
	JOIN customers AS c ON (s.salesman_id = c.salesman_id);
		GRANT ALL PRIVILEGES ON salesman_customer_names TO junior_dev;--5

CREATE VIEW highest_grade_catomer AS SELECT grade
	FROM customers ORDER BY grade DESC NULLS LAST LIMIT 1;
		GRANT SELECT ON highest_grade_catomer TO junior_dev;--6

CREATE VIEW number_of_salesman_in_cities AS SELECT count(salesman_id), city
	FROM salesman GROUP BY city;--7

CREATE VIEW salesman_with_morethanone_customer AS SELECT s.name, count(*)
	FROM salesman AS s JOIN customers AS c USING(salesman_id)
		GROUP BY salesman_id HAVING count(*) >1;--8

CREATE ROLE intern;
	REASSIGN OWNED BY junior_dev TO intern;--9
