create database lab6;

create table locations (
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments (
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations(location_id)
);

create table employees (
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments(department_id)
);

insert into locations (street_address, postal_code, city, state_province)
values
    ('Islam', '12345', 'Shymkent', 'NY'),
    ('Turgut', '67890', 'Almaty', 'CA'),
    ('Tole Bi', '11223', 'Almaty', 'IL');

insert into departments (department_name, budget, location_id)
values
    ('Sales', 50000, 1),
    ('Marketing', 60000, 2),
    ('Engineering', 75000, 3);

insert into employees (first_name, last_name, email, phone_number, salary, department_id)
values
    ('Bekzat', 'Saparbek', 'bekzatsaparbekov070@gmail.com', '77071012006', 55000, 1),
    ('Beknur', 'Ualihan', 'beknur@gmail.com', '7707707777', 600000, 2),
    ('Satybaldy', 'Turar', 'tuka@gmail.com', '77474747474', 700000, 3),
    ('Polat', 'Ernur', 'ernur@gmail.com', '770505050505', 500000, 1);

-- 3
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

-- 4
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id
where e.department_id in (80, 40);

-- 5
select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

-- 6
select d.department_name, e.first_name, e.last_name
from departments d
left join employees e on d.department_id = e.department_id;

-- 7
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
left join departments d on e.department_id = d.department_id;
