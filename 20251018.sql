use sys; -- login sys database

create database bootcamp_2510p;

use bootcamp_2510p; -- login another database

-- One database has many tables
-- Harddrisk
create table persons (
	id integer,
    first_name varchar(50),
    last_name varchar(50),
    age integer,
    department varchar(2)
);

-- 2-3 ways to insert data
insert into persons (id, first_name, last_name, age, department) values (1, 'John', 'Lau', 30, 'IT');
insert into persons (id, first_name, last_name, age, department) values (2, 'Leo', 'Wong', 48, 'HR');
insert into persons (id, first_name, last_name, age, department) values (3, 'Jenny', 'Lau', 50, 'MK');
insert into persons (id, first_name, last_name, age, department) values (4, 'Oscar', 'Chan', 23, 'IT');

-- Without column names, you have to places the values in correct sequence.
insert into persons values (5, 'Keith', 'Chan', 37, 'MK');

insert into persons values 
	(6, 'Kelly', 'Lau', 38, 'IT'),
    (7, 'Steve', 'Cheung', 20, 'IT');

-- * means all columns
select * from persons;
select first_name, age, department from persons;

-- where (select some rows in conditions)
select * from persons where age > 35;

-- AND OR
select * from persons where last_name = 'Lau' and department = 'IT';
select * from persons where last_name = 'Lau' or department = 'IT';
select * from persons where last_name = 'Lau' and department = 'IT' or age > 47;
select * from persons where age > 47 or last_name = 'Lau' and department = 'IT';
select * from persons where (age > 47 or last_name = 'Lau') and department = 'IT';

select * from persons where department <> 'IT'; -- NOT EQUAL
select * from persons where age >= 48;
select * from persons where first_name = 'JENNY'; -- data -> case insenitive

-- delete from persons;
-- delete from persons where last_name = 'Lau';

-- static method
select concat(first_name, ' ', last_name) as full_name from persons;
select concat(p.first_name, ' ', p.last_name) as full_name, p.* from persons p;


-- EXERCISE
-- Orders
-- id, order_no, amount, tran_date
-- deimcal(8,2) 999999.99
-- date

create table orders (
	id integer,
    order_no varchar(20),
    amount decimal(8, 2),
    tran_date date
);

-- drop table orders;
insert into orders values (1, 'M2025121800001', 99.99, '2025-01-31');
insert into orders values (2, 'M2025121800002', 1999.5, '2024-02-28');
insert into orders values (3, 'M2025121800003', 2000, '2024-01-30');

select * from orders;
-- drop table Orders;

-- Java: boolean, Database: varchar(1) 'Y'/'N'
-- update




