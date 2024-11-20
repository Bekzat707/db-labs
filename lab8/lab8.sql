
--1--
create database lab8;

--2--
CREATE TABLE salesman
(
    salesman_id INT PRIMARY KEY,
    name        VARCHAR(50),
    city        VARCHAR(50),
    commission  DECIMAL(4, 2)
);

CREATE TABLE customers
(
    customer_id INT PRIMARY KEY,
    cust_name   VARCHAR(50),
    city        VARCHAR(50),
    grade       INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman (salesman_id)
);

CREATE TABLE orders
(
    ord_no      INT PRIMARY KEY,
    purch_amt   DECIMAL(10, 2),
    ord_date    DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman (salesman_id)
);


INSERT INTO salesman (salesman_id, name, city, commission)
VALUES (1010, 'Jake', 'Chicago', 0.18),
       (1011, 'Liam', 'Boston', 0.12),
       (1012, 'Emma', 'San Francisco', 0.16),
       (1013, 'Mia', 'Berlin', 0.15),
       (1014, 'Noah', NULL, 0.10),
       (1015, 'Ava', 'Toronto', 0.14);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES (4001, 'Olivia', 'Chicago', 150, 1010),
       (4002, 'Ethan', 'Austin', 250, 1011),
       (4003, 'Sophia', 'San Francisco', NULL, 1015),
       (4004, 'Lucas', 'Berlin', 350, 1013),
       (4005, 'Ella', 'Chicago', 200, 1010),
       (4006, 'Benjamin', 'Munich', 120, 1014),
       (4007, 'Charlotte', 'San Francisco', 320, 1012);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES (80010, 180.75, '2021-01-15', 4001, 1010),
       (80011, 320.90, '2021-02-20', 4002, 1015),
       (80012, 75.65, '2021-03-05', 4003, 1011),
       (80013, 120.30, '2021-04-12', 4004, 1014),
       (80014, 990.50, '2021-05-18', 4005, 1010),
       (80015, 2450.75, '2021-06-24', 4006, 1012),
       (80016, 5900.20, '2021-07-11', 4007, 1011);


--3--
create role junior_dev login;

--4--
    create view  new_york_salaesmen as select * from salesman where city='New York';
select * from new_york_salaesmen;
--5--
create view names as select s.name,c.cust_name from salesman As s inner join customers as c using(salesman_id);
grant all privileges  on names to junior_dev;

select * from  names;
--6--
create view only_high as select * from customers where grade=(select max(grade )from customers);
grant select   on only_high to junior_dev;

select * from only_high;
--7--
create view count as select city,count(salesman_id) from salesman group by city ;
select * from count;

--8--
create view salesman_with_multiple_customers as select s.salesman_id, s.name, s.city, s.commission, count(c.customer_id) AS customer_count
from salesman s join customers c ON s.salesman_id = c.salesman_id
group by s.salesman_id, s.name, s.city, s.commission having count(c.customer_id) > 1;

select * from salesman_with_multiple_customers;

--9--
create role intern;
grant junior_dev to intern;