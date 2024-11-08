--Beka
--1tas
create index index_name
on countries(name);

--2tas
create index index_name_surname
on emplyees(name,surname);

--3tas
create unique index index_salary
on employees(salary);

--4tas
create index index_name_prefix
on employees(substring(name from 1 for 4));

--5tas
create index index_employees_department_join
on employees(department_id ,salary);

create index index_budget
on employees(budget);