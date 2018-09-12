CREATE TABLE countries(
	country_id SERIAL CONSTRAINT c_k PRIMARY KEY,
	country_name VARCHAR(50),
	region_id INT,
	population INT
);
INSERT INTO countries (country_name, region_id, population)
	VALUES('Kazakhstan',16,500000);
	
SELECT *FROM countries;
INSERT INTO countries (country_name)
	VALUES('USA');
ALTER TABLE countries 
	ALTER COLUMN region_id DROP DEFAULT;
INSERT INTO countries (country_name,region_id,population)
	VALUES ('Canada',11,1000),('France',13,2000),('Spain',12,2300);
	
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries (country_name, region_id, population)
	VALUES(DEFAULT,27,27777);
INSERT INTO countries (country_name, region_id, population)
	VALUES(DEFAULT,DEFAULT,DEFAULT);
CREATE TABLE countries_new(
	LIKE countries
);
INSERT INTO countries_new
	SELECT *FROM countries;
SELECT *FROM countries_new;
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;
UPDATE countries SET population = population + population*0.1 
	RETURNING country_name, population as "New Population";
DELETE FROM countries WHERE population < 100000
	RETURNING *;
DELETE FROM countries_new USING countries WHERE countries.country_id != countries_new.country_id
	RETURNING *;
DELETE FROM countries;

