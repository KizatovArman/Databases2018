CREATE TABLE users (
	id SERIAL CONSTRAINT users_pkey PRIMARY KEY,
	firstname varchar(50),
	lastname varchar(50)
);
Select *from users;
ALTER TABLE users ADD COLUMN isadmin integer;
Alter table users
	ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING isadmin::boolean ;
ALTER TABLE users
	ALTER COLUMN isadmin SET DEFAULT FALSE;
ALTER TABLE users ADD PRIMARY KEY(isadmin);

CREATE TABLE tasks(
	id SERIAL CONSTRAINT t_pkey PRIMARY KEY,
	name varchar(50),
	user_id INTEGER
);
SELECT *FROM tasks;