CREATE DATABASE lab 5;
CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	cust_name VARCHAR(200),
	city VARCHAR(100),
	grade INT,
	salesmana_id INT
)
SELECT customer_id FROM customers WHERE grade > 100;
SELECT customer_id, cust_name FROM customers WHERE city = 'New York' AND grade >100;
SELECT customer_id, cust_name FROM customers WHERE city = 'New York' OR grade >100;
SELECT * FROM customers WHERE city = 'Paris' OR city = 'Rome';
SELECT * FROM customers WHERE cust_name = 'B';
CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT,
	description TEXT,
	purch_amt INT
);
SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders GROUP BY customer_id HAVING count(customer_id)>10);
SELECT sum(purch_amt) FROM orders;
SELECT avg(purch_amt) FROM orders;
SELECT * FROM customers WHERE cust_name IS NOT NULL;
SELECT max(purch_amt) FROM orders;

