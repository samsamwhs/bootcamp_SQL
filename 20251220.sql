-- Group By + Having

-- Aggregation Function (many data -> single value)
-- min/ max/ count/ average/ sum

-- Data is a row in DB
select salary from persons where first_name = 'Oscar' and last_name = 'Chan'; -- 18000.00

select salary from persons where last_name = 'Lau'; -- 25000.00 & 37000.00
select sum(salary) from persons where last_name = 'Lau'; -- 62000.00

-- 分類 
-- select -> show column(s)
-- where -> filter row(s) by existing column

-- "Group By"
-- group by -> grouping, summary rules (group by only use with aggregation function, and formula)
-- cannot show other column without aggregation function

-- Group by Department (representative)
select department, sum(salary), max(salary), min(salary), count(*), avg(salary) from persons group by department;

-- Q: count(1) = count (*)
-- * = all columns
select * , 'hello' from persons; -- add 'hello' to all rows in new column
select department, count(1) from persons group by department;


-- formula
select department, sum(salary)/ count(*) from persons group by department;
select department, sum(salary) + min(age) from persons group by department;

-- round(x, decimal point) -> Rounding 
select department, round(sum(salary)/ count(*),1) from persons group by department;

-- where + group by : filter out some rows and do the summary
select department, sum(salary) from persons where age >= 30 group by department; 

-- Exercise for Notes Chapter 7
select genre, avg(price) from books group by genre;

-- Leetcode exercise 511
-- change column name for output
select player_id, min(event_date) as first_login
from activity
group by player_id;

-- "Having" to filer group after group by, with aggregation function
-- sequence: where -> group by -> having 

select * from persons;
select department, sum(salary) as total_salary
from persons
where age >= 30
group by department
having count(1) >2;

-- Exercise
-- which department with max salary >= 30000 and return the number of persons in that department 
select department, count(1) as number_of_persons
from persons
group by department
having max(salary) >= 30000;

-- coding writing sequence: 
-- Step 1: where
-- Step 2: group by + having 
-- Step 3: select column / value to return

-- leetcode exercise 182
select email
from Person
group by email having count(email) >1;

-- leetcode exercise 619
select max(num) as num
from
(select num from MyNumbers group by num having count(1) = 1) as result;
-- 1,4,5,6 is 4 groups, cannot call max value of each group (not useful)
-- solution use () for the above line of code to make 4 groups to 1 group and find max value

select max(total_salary) from
(select department, sum(salary) as total_salary 
from persons 
group by department having max(salary) >= 20000) as result;














