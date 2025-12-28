-- ONE to MANY table structure (80% in real life)

create table departments (
	id integer primary key,
	dep_name varchar(30)
);

create table employees (
	id integer primary key,
	emp_name varchar(30),
	join_date date, -- not use datetime
    dep_id integer not null,
    foreign key (dep_id) references departments(id)
);



-- how to create connection for 2 tables and set must have item for each row of data
-- -> not null
-- -> primary key (unique, not null) 
-- & foreign key (ensure this value must exist in other table 'departments', must be 'not null' in this table)
-- foreign key will speed up the performance of searching in SQL
-- primary key & foreign key must be same data type and usually are integer for auto-generation program
-- DB designer should protect DB when Java Program having bug (e.g. duplication of dep_id)
-- in Java program, departments and employees should be arraylist and no rules for each lists

-- every rule like not null, check, unique will slow down the performance 
-- only construction problem should be concerned 

-- SQL enum not equals to Java enum but similar meaning, can't communicate

-- have point to use:
-- 'default' for due date 1970 (when computer starts) as that is ever-green rule?

-- combine column for primary key -> notes Chapter 8, student can't enroll twice for same subject
-- Q: is this better than setting constrain?

insert into departments values (1, 'IT');
insert into departments values (2, 'MK');
insert into employees values (1, 'John', '2025-10-01',1); -- must after created department data  
insert into employees values (2, 'Leo', '2025-01-01',2); -- dep_id set as not null already

select * from departments;

-- MANY to MANY table structure
-- example: Students vs Courses

create table students (
	id integer primary key,
    stu_name varchar(30) not null
);

create table courses (
	id integer primary key,
	course_name varchar(30) not null
);

create table student_courses (
	id integer primary key,
    reg_date date not null,
    stu_id integer not null,
    course_id integer not null,
    foreign key (stu_id) references students(id),
    foreign key (course_id) references courses(id)
);

insert into students value (1, 'Leo');
insert into students value (2, 'Jenny');

insert into courses value (1, 'MATH');
insert into courses value (2, 'ENGLISH');
insert into courses value (3, 'CHINESE');

insert into student_courses value (1, '2025-08-25',1,2); -- Leo, English
insert into student_courses value (2, '2025-08-25',1,3); -- Leo, Chinese
insert into student_courses value (3, '2025-08-30',2,2); -- Jenny, English
insert into student_courses value (4, '2025-08-15',2,1); -- Jenny, Math

select * from student_courses;


-- INNER JOIN
-- must have 'on' condition, otherwise inner join will return table data X table data


select d.*, e.*
from departments d inner join employees e on e.dep_id = d.id;
-- d is self-defined nickname of departments table
-- join won't slow down performance too much unless the data row is more than 10 million

select e.id as emp_id,
d.id as dep_id,
e.emp_name,
d.dep_name,
e.join_date
from departments d inner join employees e on e.dep_id = d.id;


select s.stu_name, c.course_name, r.reg_date
from student_courses r
	inner join students s on s.id = r.stu_id
    inner join courses c on c.id = r.course_id;
    
select * from student_courses; 

-- why?
-- diff. table for diff. purpose (e.g. how many students in school?)
-- domain of the value (e.g. emergency contact)
-- avoiding waste of hard disk space: 
-- 1. duplicate record for each row
-- (e.g. if emergency contact save into student_courses table, 
-- contact will be duplicate in each row when that student reg each course)
-- 2. integer need less space to save than varchar

-- ONE to ONE (Traffic concern)

-- Database has read-write limitation
-- Table A 3 columns (heavy read info) (e.g. Username, Password)
-- Table B 4 columns (less read info) (e.g. Profile picture)

-- practically, will have below table for this example 
-- Table C 7 columns (Username, Password, Profile picture)


select concat(first_name, ' ', last_name)
	from persons;
    
select substring(first_name, 1,4)
	from persons;
    
select length(first_name), length(last_name), Upper(first_name), Lower(Last_name)
	from persons;
    
select replace(first_name,'J','X')
	from persons;
    
insert into persons values (8,'大明','陳',26,'MK', 28000);
select char_length(first_name),p.* from persons p;
-- chinese will be saved as 3 characters at least, returning space used when use length()
-- so should use char_length for chinese characters instead.
 
select instr(first_name, 'J'), p.* from persons p;
-- instr() = indexOf() in Java
 






