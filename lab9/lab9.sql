create database lab9;

create table employees(
    first_name text,
    last_name text,
    company text,
    salary numeric
);

insert into employees values('Bekzat','smith','company_a',12345),
                            ('Beknur','doe','company_b',54321),
                            ('Turar','brown','company_c',6789);

create table products (
    product_id serial,
    product_name text,
    category text,
    price numeric
);

insert into products (product_name, category, price) values
    ('laptop', 'electronics', 1000.00),
    ('smartphone', 'electronics', 800.00),
    ('refrigerator', 'appliances', 500.00),
    ('blender', 'appliances', 50.00),
    ('table', 'furniture', 150.00),
    ('chair', 'furniture', 75.00);

--1
CREATE OR REPLACE FUNCTION increase_value(val integer)
    RETURNS integer AS
$$
BEGIN
    RETURN val + 10;
END;
$$
    LANGUAGE plpgsql;

--2
CREATE OR REPLACE FUNCTION compare_numbers(a integer, b integer, OUT result text)
AS $$
BEGIN
    IF a > b THEN
        result := 'greater';
    ELSIF a < b THEN
        result := 'lesser';
    ELSE
        result := 'equal';
    END IF;
END; $$
LANGUAGE plpgsql;

--3
CREATE OR REPLACE FUNCTION number_series(n integer)
RETURNS TABLE(series integer) AS $$
BEGIN
    FOR series IN 1..n LOOP
        RETURN QUERY SELECT series;
    END LOOP;
END; $$
LANGUAGE plpgsql;

--4
CREATE OR REPLACE FUNCTION find_employee(emp_name varchar)
RETURNS TABLE(first_name text, last_name text, company text, salary numeric) AS $$
BEGIN
    RETURN QUERY SELECT * FROM employees WHERE employees.first_name = emp_name;
END; $$
LANGUAGE plpgsql;

select * from find_employee('asdf');

--5
CREATE OR REPLACE FUNCTION list_products(given_category text)
RETURNS TABLE(product_id int, product_name text, category text, price numeric) AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM products WHERE products.category = given_category;
END; $$
LANGUAGE plpgsql;

select * from list_products('electronics');

--6
CREATE OR REPLACE FUNCTION calculate_bonus(emp_name text)
RETURNS numeric AS $$
DECLARE
    bonus numeric;
BEGIN
    SELECT salary * 0.10 INTO bonus FROM employees
    WHERE employees.first_name = emp_name;
    RETURN bonus;
END; $$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_name text)
RETURNS void AS $$
DECLARE
    bonus numeric;
BEGIN
    bonus := calculate_bonus(emp_name);
    UPDATE employees
    SET salary = salary + bonus
    WHERE employees.first_name = emp_name;
END; $$
LANGUAGE plpgsql;

SELECT calculate_bonus('asdf');
SELECT update_salary('asdf');
SELECT * FROM employees;

--7
DROP PROCEDURE IF EXISTS complex_calculation;

CREATE OR REPLACE PROCEDURE complex_calculation(input_number integer, input_text varchar)
LANGUAGE plpgsql
AS $$
DECLARE
    reversed_text varchar;
    factorial_result bigint := 1;
    i integer;
BEGIN
    <<string_manipulation>>
    BEGIN
        reversed_text := reverse(input_text);
        RAISE NOTICE 'Reversed text: %', reversed_text;
    END string_manipulation;

    <<numeric_computation>>
    BEGIN
        FOR i IN 1..input_number LOOP
            factorial_result := factorial_result * i;
        END LOOP;
        RAISE NOTICE 'Factorial of %: %', input_number, factorial_result;
    END numeric_computation;

    RAISE NOTICE 'Final Result: Reversed Text: %, Factorial: %', reversed_text, factorial_result;
END;
$$;

CALL complex_calculation(5, 'hello');
