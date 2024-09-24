create database lab2

create table countries{
    country_id serial primary key,
    country_name varchar(100) ,
    region_id int,
    population int
}

insert into countries(country_name, region_id,population)
values('Shymkent', 17,1111111)

insert into countries(country_id,country_name)
values(2,'Shardara')

insert into countries(country_name,region_id,population)
values('astana',null,7777777)

insert into countries(country_name,region_id,population)
values
('Almaty',02,10),
('Astana',01,11),
('Aktau',11,12)

alter table countries
alter column country_name set default 'Kazakhstan';

insert into countries(region_id,population)
values(707,77777777)

insert into countries default values;

drop table if exists countries_new;
create table countries_new (like countries including all);

insert into countries_new
select * from countries

update countries
set region_id=1
where region_id is null;

select country_name , population*1.10 as 'New Population'
from countries

delete from countries
where  population <100000

delete from countries_new
where country_id in (select country_id from countries)
returning *;

delete from countries;
returning *;