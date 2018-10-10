CREATE DATABASE lab 4;--1
CREATE TABLE Warehouses (
	code SERIAL PRIMARY KEY,
	location char(255),
	capacity INT
);
CREATE TABLE Boxes(
	code char(4),
	contents char(255),
	value real,
	warehouse INTEGER REFERENCES Warehouses(code)
); --2

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);
 
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);--3
 
 SELECT * FROM Warehouses;--4
 SELECT * FROM Boxes WHERE value >150;--5
 SELECT DISTINCT ON(contents) * FROM Boxes;--6
 SELECT warehouse,count(*) FROM Boxes GROUP BY warehouse;--7
 SELECT warehouse,count(value) FROM Boxes GROUP BY warehouse HAVING count(*) > 2;--8
 INSERT INTO Warehouses (code,location,capacity)
 			VALUES(6,'New York', 3);--9
 INSERT INTO Boxes
 			VALUES('H5RT','Papers',200,2);--10
 UPDATE Boxes SET value = 0.85*value WHERE value IN(SELECT value FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2);--11
 DELETE FROM Boxes WHERE value < 150;--12
 DELETE FROM Boxes
 WHERE  warehouse IN(SELECT code FROM Warehouses WHERE location = 'New York')
 RETURNING *;--13
 
 
 