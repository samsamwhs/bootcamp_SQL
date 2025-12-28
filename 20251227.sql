-- SUBQUERY from Notes Chapter 9 
-- query inside query
select p.*, (select max(salary) from persons)
	from persons p;
-- 2 execute period for () and *
-- performance will be slow

-- Q: Find the first name and last name of the person who has the max salary 

-- approach 1 : subquery
select *
from persons
where salary = (select max(salary) from persons);

-- approach 2 : subquery - inner join with key
select p1.*, p2.*
from persons p1 inner join (select max(salary) as max_salary from persons) p2 on p1.salary = p2.max_salary;
-- p2 just has 1 line of record -> max_salary

-- approach 3: subquery - CTE (function) much faster
with max_salary_table as (
	select max(salary) as max_salary from persons
)
select p.*, m.*
from persons p inner join max_salary_table m on p.salary = m.max_salary;

-- EXIST
select * from departments;
select * from employees;
insert into departments values (3, 'HR');

-- Q: Find the departments which is no employee (left join with where)
select *
from departments d left join employees e on d.id = e.dep_id
where e.dep_id is null; -- there must be null in the result
-- "= null" not same as "is null"


-- Q: Find the department and its employees (inner join)
select *
from departments d inner join employees e on d.id = e.dep_id;

-- Q: Show the department detail only which has employees
select d.*
from departments d 
where exists (select 1 from employees e where d.id = e.dep_id);
-- exists means break in Java
-- where exists just find if the d.id exists in employees's dep_id, if so, stop finding 
-- faster than above inner join
-- can be applied to customer who made order this month -> where ... and date range ....


-- Q: Find the departments, no matter it has employee or not (left join)
select d.*, e.*
from departments d left join employees e on e.dep_id = d.id;

select d.*
from departments d left join employees e on e.dep_id = d.id
where not exists (select 1 from employees e where d.id = e.dep_id);
-- where not exists needs to scan all records

-- ORDER BY
select * 
from persons
order by salary desc -- -> descending order
limit 2;

select * 
from persons
order by salary; -- blank or asc -> ascending order

-- group by unique column first, then can have not unique column 


-- leetcode exercise 1068
select  p.product_name, s.year, s.price
from sales s inner join product p on s.product_id = p.product_id;

-- cannot use exists


-- leetcode exercise 1587

-- SQL step:
-- 1. from -> join
-- 2. where
-- 3. group by + having
-- 4. select

select u.name as NAME, sum(t.amount) as BALANCE -- static method cannot put in group by clause
from users u inner join transactions t on u.account = t.account
group by u.account, u.name -- u.name must included in group by clause so we can select out
having sum(t.amount) > 10000;

-- leetcode exercise 577
select e.name, b.bonus
from employee e left join bonus b on e.empId = b.empId 
where b.bonus < 1000 or b.bonus is null; 
-- condition need to be filter after join, otherwise it will give wrong answer


