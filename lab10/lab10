create database lab10;

create table books (
    book_id serial primary key,
    title varchar(255),
    author varchar(255),
    price decimal(10, 2),
    quantity integer
);

create table orders (
    order_id serial primary key,
    book_id integer references books(book_id),
    customer_id integer,
    order_date date,
    quantity integer
);

create table customers (
    customer_id serial primary key,
    name varchar(255),
    email varchar(255)
);

insert into books (title, author, price, quantity)
values
    ('database 101', 'tuka', 45, 10),
    ('linear', 'puka', 55, 15),
    ('ds', 'nuka', 50, 5);

insert into customers (name, email)
values
    ('bekzat', 'beka@kbtu.kz'),
    ('turar', 'tuka@kbtu.kz');

--1
begin;
insert into orders (book_id, customer_id, order_date, quantity)
values (1, 101, current_date, 2);
update books set quantity = quantity - 2 where book_id = 1;
commit;

--2
do $$
begin
    if (select quantity from books where book_id = 3) < 10 then
        raise notice 'quantity ';
        rollback;
    else
        insert into orders (order_id, book_id, customer_id, order_date, quantity)
        values (1, 2, 111, current_date, 10);

        update books set quantity = quantity - 10 where book_id = 3;
        commit;
    end if;
end $$;

select * from books;
select * from orders;

--3
begin transaction isolation level read committed;
update books set price = 77 where book_id = 1;
commit;

begin transaction isolation level read committed;
select price from books where book_id = 2;

select price from books where book_id = 2;
commit;

--4
begin;
update customers set email = 'b_saparbek@kbtu.kz' where customer_id = 101;
commit;

select * from customers where customer_id = 101;
