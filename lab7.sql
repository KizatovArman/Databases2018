CREATE DATABASE lab7;--1

CREATE TABLE locations(
	location_id SERIAL PRIMARY KEY,
	street_address VARCHAR(25),
	postal_code VARCHAR(25),
	city VARCHAR(30),
	state_province VARCHAR(12)
);

CREATE TABLE departments(
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(50) UNIQUE,
	budget INTEGER,
	location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	phone_number VARCHAR(20),
	salary INTEGER,
	department_id INTEGER REFERENCES departments
);--2

SELECT employees.first_name, employees.last_name,
	employees.department_id, departments.department_name
		FROM employees 
			JOIN departments
				ON employees.department_id = departments.department_id;--3
			
SELECT employees.first_name, employees.last_name,
	employees.department_id, departments.department_name
		FROM employees
			JOIN departments
				ON employees.department_id = departments.department_id
					AND departments.department_id IN (80,40); --4 

SELECT employees.first_name,employees.last_name, 
   departments.department_name, locations.city, locations.state_province
     FROM employees  
      	JOIN departments   
        	ON employees.department_id = departments.department_id  
          		JOIN locations 
           			ON departments.location_id = locations.location_id;--5
		   
SELECT employees.first_name, employees.last_name, departments.department_id, departments.department_name 
	FROM employees  
		RIGHT JOIN departments 
			ON employees.department_id = departments.department_id; --6

SELECT employees.first_name, employees.last_name,
	departments.department_id, departments.department_name 
		FROM departments
			RIGHT JOIN employees  
				ON employees.department_id = departments.department_id; --7






