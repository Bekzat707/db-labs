create database lab4;

create table Warehouses(
    code int,
    location character varying (255),
    capacity int
);
create table Boxes (
    code character(4),
    contents character varying (255),
    value real,
    warehouse int
);
\i '/path/to/lab4.sql';

insert into Warehouses (code, location, capacity) values
(1,'Chicago',3),
(2,'Chicago',4),
(3,'New York',7),
(4,'Los Angeles',2),
(5,'San Francisco',8);

insert into Boxes(code, contents, value, warehouse) values
('OMNT','Rocks',180,3),
('4H8P','Rocks',250,1),
('4RT3','Scissors',190,4),
('763H','Rocks',200,1),
('8JN6','Papers',75,1),
('8Y6U','Papers',50,3),
('9J6F','Papers',175,2),
('LL08','Rocks',140,4),
('РОН6','Scissors',125,1),
('P2T6','Scissors',150,2),
('TU55','Papers',90,5);

SELECT * FROM Warehouses;
SELECT * FROM Boxes;


SELECT * FROM Warehouses;

SELECT * FROM Boxes
WHERE value > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse;

SELECT warehouse, COUNT(*) AS box_count
FROM Boxes
GROUP BY warehouse
HAVING COUNT(*) > 2;

INSERT INTO Warehouses (code, location, capacity)
VALUES (4, 'New York', 3);

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes
SET value = value * 0.85
WHERE value = (SELECT value FROM Boxes ORDER BY value DESC OFFSET 2 LIMIT 1);

DELETE FROM Boxes
WHERE value < 150;

DELETE FROM Boxes
USING Warehouses
WHERE Boxes.warehouse = Warehouses.code
AND Warehouses.location = 'New York'
RETURNING Boxes.*;

