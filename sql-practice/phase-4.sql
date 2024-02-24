-- Your code here
drop table if EXISTS employees;
drop table if exists reviews;
drop table if exists parties;
-- step 1: Database Schema
-- --- Done

--- step 2: create database
-- -- Done
create table employees (
    id integer primary key autoincrement,
    first_name varchar(20),
    last_name varchar(20),
    department varchar(20),
    role varchar(20),
    relationship_with varchar(20) default null
);

create table reviews (
    employee_id integer,
    score integer not null check (score between 1 and 10)
);

create table parties (
    budget decimal(12,3) not null,
    onsite numeric
);

-- Step 3: Read and Manipulate the Database
insert into employees (first_name, last_name, department, role)
values ('Michael', 'Scott', 'Management', 'Regional Manager'),
('Dwight', 'Schrute', 'Sales', 'Assistant Regional Manager'),
('Jim', 'Halpert', 'Sales', 'Sales Representative'),
('Pam', 'Beesly', 'Reception', 'Receptionist'),
('Kelly', 'Kapoor', 'Product Oversight', 'Customer Service Representative'),
('Angela', 'Martin', 'Accounting', 'Head of Accounting'),
('Roy', 'Anderson', 'Warehouse', 'Warehouse Staff');

-- 8:
update employees
set relationship_with = (select id from employees where first_name = 'Pam')
where first_name = 'Roy';
update employees
set relationship_with = (select id from employees where first_name = 'Roy')
where first_name = 'Pam';

-- 9
insert into employees (first_name, last_name, department, role) 
values ('Ryan', 'Howard', 'Reception', 'Temp');

-- 10
insert into parties values(100.00, 1);

-- 11
-- insert into reviews
-- values (select id from employees where first_name = 'Dwight', 3.3);

-- 12
insert into reviews(employee_id, score)
values (select id from employees where first_name = 'Jim', 4.2);

select * from reviews;
