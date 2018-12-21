CREATE TABLE movies(
	id SERIAL PRIMARY KEY,
	title VARCHAR(255) UNIQUE NOT NULL,
	rating INT,
	genre VARCHAR(50) NOT NULL
);

CREATE TABLE theaters (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) UNIQUE NOT NULL,
	size INT NOT NULL check(size>3),
	city VARCHAR(50) NOT NULL
);
INSERT INTO movies (title,rating,genre)
	VALUES ('Citizen Kane', 5, 'Drama'),
			('Singin in the Rain', 7 ,'Comedy'),
			('The wizzard of oz', 7 ,'Fantasy'),
			('The quiet man', null ,'Comedy'),
			('North by northwest', null ,'Thriller'),
			('The last tango in paris', 9 ,'Drama'),
			('some like it hot', 4 ,'Comedy'),
			('a night at the opera', null ,'Comedy');

INSERT INTO theaters(name,size,city)
	VALUES ('Kinopark esentai', 15, 'almaty'),
			('star cinema mega', 7, 'almaty'),
			('Kinopark 8', 9, 'shymkent'),
			('star cinema 15', 11, 'astana'),
			('cinemax', 4, 'aktau');
SELECT DISTINCT ON(genre)* FROM movies; --2
SELECT title FROM movies ORDER BY rating ASC NULLS LAST LIMIT 3;--3
SELECT name FROM theaters ORDER BY size DESC LIMIT 1 OFFSET 2;--4
SELECT title FROM movies WHERE rating IS NULL;--5
SELECT name FROM theaters WHERE (city = 'shymkent' or city = 'almaty')and size > 7;--6
SELECT id AS "MovieID", (SELECT format('The genre of %s is %s' , title,genre)) as "MovieInfo" FROM movies;--7
CREATE TABLE movietheaters(
	theater_id INTEGER REFERENCES theaters(id),
	movie_id INTEGER REFERENCES movies(id),
	rating INT
);--8
SELECT *FROM theaters WHERE id NOT IN(SELECT theater_id FROM movietheaters GROUP BY theater_id,movie_id,rating HAVING count(*)>0);--9

SELECT *,
CASE WHEN (rating <3) THEN 'low'
	WHEN rating <7 and movies.rating >3 THEN 'medium'
	WHEN rating <11 and movies.rating >7 THEN 'high'
	WHEN rating is null then 'No rating'
END AS quality
FROM movies;--10
UPDATE movies SET rating = 1 WHERE rating is NULL;--11
DELETE FROM movies WHERE id NOT IN
	(SELECT movie_id
					FROM movietheaters
					GROUP BY movie_id
					HAVING count(*)>0); --12
INSERT INTO movies (title, rating, genre) VALUES ('Toean', 213, 'hentai1');									   

SELECT * FROM movies WHERE title LIKE 'T_e%n';--13

SELECT DISTINCT ON(genre) genre, avg(rating) FROM movies GROUP BY genre;--14
SELECT name FROM theaters WHERE id IN(SELECT theater_id FROM movietheaters GROUP BY theater_id HAVING count(*)>0);--15
									   
									   
									   
									   