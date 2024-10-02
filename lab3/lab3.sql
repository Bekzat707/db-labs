drop database if exists lab3;
create database lab3;

drop table if exists departments cascade;
drop table if exists employees cascade; 
drop table if  exists customers cascade;

create table departments(
  code int PRIMARY KEY,
  name varchar(255) not null,
  budget decimal not null
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000),
(37,'Accounting',15000),
(59,'Human Resources',240000),
(77,'Research',55000),
(45,'Management',155000),
(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty'),
('152934485','Anand','Manikutty',14, 'Shymkent'),
('222364883','Carol','Smith',37, 'Astana'),
('326587417','Joe','Stevens',37, 'Almaty'),
('332154719','Mary-Anne','Foster',14, 'Astana'),
('332569843','George','ODonnell',77, 'Astana'),
('546523478','John','Doe',59, 'Shymkent'),
('631231482','David','Smith',77, 'Almaty'),
('654873219','Zacary','Efron',59, 'Almaty'),
('745685214','Eric','Goldsmith',59, 'Atyrau'),
('845657245','Elizabeth','Doe',14, 'Almaty'),
('845657246','Kumar','Swamy',14, 'Almaty')

INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty'),
('Garry','Foster', 'London'),
('Amanda','Hills', 'Almaty'),
('George','Doe', 'Tokyo'),
('David','Little', 'Almaty'),
('Shawn','Efron', 'Astana'),
('Eric','Gomez', 'Shymkent'),
('Elizabeth','Tailor', 'Almaty'),
('Julia','Adams', 'Astana')

select lastname from employees;

select distinct lastname from employees;

select * from employees where lastname = 'smith';

select * from employees where lastname in ('smith', 'doe');

select * from employees where department = 14;

select * from employees where department in (37, 77);

select sum(budget) from departments;

select department, count(*) as employee_count from employees group by department;

select department from employees group by department having count(*) > 2;

select name from departments order by budget desc limit 1 offset 1;

select name, lastname from employees where department in (select code from departments where budget = (select min(budget) from departments));

select name from employees where city = 'almaty' union select name from customers where city = 'almaty';

select * from departments where budget > 60000 order by budget asc, code desc;

update departments set budget = budget * 0.9 where budget = (select min(budget) from departments);

update employees set department = 14 where department = (select code from departments where name = 'research');

delete from employees where department = 14;

delete from employees;