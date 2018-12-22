--qiuz 1
CREATE TABLE manufacturers(
	code SERIAL PRIMARY KEY,
	name VARCHAR(255)	
);

CREATE TABLE products(
	code SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price NUMERIC,
	manufacturer integer REFERENCES manufacturers
);

SELECT name FROM products;

SELECT name,price FROM products;

SELECT name FROM products WHERE price<=200;

SELECT * FROM products WHERE price >=60 AND price <=120;

SELECT name,price FROM products WHERE 
	price >180 ORDER BY price DESC, name ASC;

SELECT avg(price), manufacturer FROM products
	GROUP BY manufacturer;

SELECT manufacturer,avg(price) FROM products
	GROUP BY manufacturer HAVING avg(price)>=150;

SELECT name,price FROM products
	ORDER BY price ASC LIMIT 1 NULLS LAST;

INSERT INTO products (name,price,manufacturer)
	VALUES('loudspeakes',70,2);

UPDATE products SET name = 'Laser Printer' WHERE code = 8;

UPDATE products SET price = 0.9*price;

UPDATE products SET price = 0.9*price WHERE price >=120;

--quiz 1.2

CREATE IS THE SAME

SELECT DISTINCT ON(manufacturer) name FROM products;

SELECT code, manufacturer FROM products LIMIT 3;

SAME

SELECT * FROM products WHERE manufacturer IN
	(SELECT code FROM manufacturers WHERE name = 'Sony');

SELECT name, price FROM products
	WHERE price >=110 ORDER BY price ASC,
		manufacturer DESC NULLS LAST;

SELECT count(price), manufacturer FROM products
	GROUP BY manufacturer;

DELETE FROM manufacturers
	WHERE code IN(SELECT manufacturer FROM products
		GROUP BY manufacturer HAVING count(*)<1);

UPDATE products SET price = price +10 
	WHERE code IN(SELECT code FROM products 
		ORDER BY price ASC LIMIT 1 OFFSET 2);

ALTER TABLE products
	ALTER COLUMN price
		SET DEFAULT 0;

UPDATE products SET price = 0.8*price
	WHERE manufacturer IN(SELECT code FROM manufacturers
			WHERE name = 'Fujitsu');

-- mid1

--creatE tableS

SELECT DISTINCT ON(genre) name FROM Movies;

SELECT name FROM Movies ORDER BY rating DESC NULLS LAST LIMIT 3;

SELECT * from theaters ORDER BY size DESC LIMIT 1 OFFSET 2;

SELECT * FROM Movies WHERE rating IS NULL;

SELECT * FROM theaters WHERE (city = 'ALmaty' OR city = 'Shymkent')
	AND size >7;

SELECT id as MovieId,format('The genre of %s is %s', genre,title)
	AS MovieInfo;

--CREATE TABLE

SELECT name FROM theaters WHERE id NOT IN
	(SELECT theater_id FROM movietheaters);

SELECT name,rating
	CASE WHEN rating>0 and rating <3 then 'Low Rating'
		 WHEN rating >3 and rating<7 then 'Medium Rating'
		 WHEN rating >7 and rating <8 then 'High Rating'
		 else 'No Rating'
	END
	FROM Movies;

DELETE from Movies WHERE id NOT 
	IN(SELECT movie_id FROM movietheaters);

SELECT * FROM Movies WHERE name LIKE 'T_e&n';

SELECT avg(rating),genre FROM Movies GROUP BY genre;

select * from theaters WHERE id IN 
	(SELECT theater_id from movietheaters GROUP BY theater_id
		HAVING count(*)>1);

--MID 2
--SAME TABLE AS PREVIOUS

SELECT DISTINCT ON(city)name FROM theaters;

SELECT id as MovieId,
	CASE WHEN rating>0 and rating<=3 then format('The rating of %s is low', title)
		 WHEN rating>3 and rating<=7 then format('The rating of %s is medium', title)
		 WHEN rating>7 and rating<=10 then format('The rating of %s is high', title)
		 else format('The %s has no rating', genre)
		 END AS MoviesInfo
		 FROM Movies;

SELECT upper(title) from Movies;
SELECT substring(title from 4 for char_length(title)-3) from Movies;
SELECT char_length(title) FROM Movies;

--quiz 2.1.1

--theory
--we can create indexes to last 2 queries and not recommended to create for first 
SELECT h.name FROM highschooler h
	INNER JOIN friends f on h.id= f.id1
	INNER JOIN highschooler h1 ON h1.id = f.id2
WHERE h.name = 'Gabriel' or h1.name = 'Gabriel';

SELECT h1.name,h1.grade,h2.namem h2.grade 
	FROM highschooler h1
	INNER JOIN Likes ON h1.id = Likes.id1
	INNER JOIN highschooler h2 on h2.id = Likes.id2
	WHERE (h1.grade - h2.grade)>=2;

SELECT name,grade FROM highschooler 
	WHERE ID IN(SELECT ID2 FROM Likes 
			GROUP BY ID2
				HAVING count(ID2)>=2);

SELECT h.name FROM highschooler hkjasf
	


















