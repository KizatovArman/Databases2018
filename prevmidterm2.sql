CREATE TABLE movies(
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) NOT NULL UNIQUE,
	rating INT,
	genre VARCHAR(50) NOT NULL
);

CREATE TABLE theaters(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	size NOT NULL,
	city VARCHAR(50) NOT NULL
);--1
SELECT DISTINCT ON(name)* FROM theaters;--2
SELECT * FROM theaters ORDER BY size DESC NULLS LAST LIMIT 3  OFFSET 1;--3
SELECT * FROM movies ORDER BY rating DESC LIMIT 1 OFFSET 2;--4
SELECT * FROM movies WHERE rating IS NOT NULL;--5
SELECT * FROM movies WHERE (genre = 'Comedy' OR genre = 'Fantasy') AND rating IS NOT NULL;--6
SELECT id AS "MovieID", (SELECT fromat('The rating of %s is %s', title,SELECT ) )--7
SELECT DISTINCT ON(city) city, avg(size) FROM movies GROUP BY city;--14
SELECT name FROM theaters WHERE id IN(SELECT theater_id FROM movietheaters GROUP BY theater_id HAVING count(*)>0);
