CREATE DATABASE lab1;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,       -- Auto-incrementing integer
    firstname VARCHAR(50),       -- String with max length 50
    lastname VARCHAR(50)         -- String with max length 50
);


alter table users
add column isadmin int check(isadmin in (0,1))


alter table users
drop constraint users_isadmin_check

alter table users
alter column isadmin type boolean using isadmin::boolean;


alter table users
alter column isadmin set default false;


alter table users
drop constraint users_pkey;

alter table users
add constraint users_pkey primary key(id);


create table tasks(
    id serial primary key,
    name varchar(50),
    user_id INTEGER
)


drop table tasks;
drop table users;