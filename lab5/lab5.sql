--1
create database lab5;
--2
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

CREATE TABLE orders (
    ord_no int PRIMARY KEY,
    purch_amt real,
    ord_date data,
    customer_id int references customers(customer_id),
    salesman_id int
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 200, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 2, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);

select* from customers;
select * from orders;

--3
select sum(purch_amt) from orders;

--4
select avg(purch_amt) from orders;

--5
select count(cust_name )from customers;

--6
select min(purch_amt) from orders;

--7
select * from customers where cust_name like '%b';

--8
select * from orders where customer_id in (select customer_id from customers where city = 'New York');
--9
select * from orders where customer_id in (select customer_id from customers)and purch_amt>10;

--10
select grade from customers;
select sum(grade) from customers;

--11
select cust_name from customers
where cust_name is not null;

--12
select max(grade)from customers;