-- SQL exercise 1
use bootcamp_2510p;

create table regions(
REGION_ID integer primary key,
REGION_NAME varchar(25)
);

create table countries(
COUNTRY_ID char(2) primary key,
COUNTRY_NAME varchar(40),
REGION_ID integer,
foreign key (REGION_ID) references regions(REGION_ID)
);

create table locations(
LOCATION_ID integer primary key,
STREET_ADDRESS varchar(25),
POSTAL_CODE varchar(12), 
CITY varchar(30),
STATE_PROVINCE varchar(12),
COUNTRY_ID char(2),
foreign key (COUNTRY_ID) references countries(COUNTRY_ID)
);

create table departments1(
DEPARTMENT_ID integer primary key,
DEPARTMENT_NAME varchar(30),
MANAGER_ID integer,
LOCATION_ID integer,
foreign key (LOCATION_ID) references locations(LOCATION_ID)
);



create table jobs(
JOB_ID varchar(10) primary key,
JOB_TITLE varchar(10),
MIN_SALARY integer,
MAX_SALARY integer
);



create table employees1(
EMPLOYEE_ID integer primary key,
FIRST_NAME varchar(20),
LAST_NAME varchar(25),
EMAIL varchar(25),
PHONE_NUMBER varchar(20),
HIRE_DATE date,
JOB_ID varchar(10),
foreign key (JOB_ID) references jobs(JOB_ID),
SALARY integer,
COMMISSION_PCT integer,
MANAGER_ID integer,
DEPARTMENT_ID integer,
foreign key (DEPARTMENT_ID) references departments1(DEPARTMENT_ID) 
);

create table job_history(
EMPLOYEE_ID integer,
foreign key (EMPLOYEE_ID) references employees1(EMPLOYEE_ID),
START_DATE date,
END_DATE date,
JOB_ID varchar(10),
foreign key (JOB_ID) references jobs(JOB_ID),
DEPARTMENT_ID integer,
foreign key (DEPARTMENT_ID) references departments1(DEPARTMENT_ID), 
primary key(EMPLOYEE_ID, START_DATE)
);

select * from regions;
select * from countries;
select * from locations; 
select * from departments1;
select * from jobs;
select * from employees1;
select * from job_history;

insert into regions values (1,'Asia');
insert into countries values (1,'China',1);
insert into locations values (1,'xyn street','000000','HK','n/a',1);
insert into departments1 values(1,'HR',0001,1); -- integer value 0001 will become 1
insert into jobs values(1,'HR officer',23000,27000);
insert into employees1 values(1,'Jenny','Chau','jennychau@gmail.com','12345678','2025-12-28','1',23000,20,1,1);
insert into job_history values(1,'2025-12-28','2025-12-28',1,1);