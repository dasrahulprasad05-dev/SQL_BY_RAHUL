create database study;
use study;
-- lets create a table
create table department(
department_id int primary key auto_increment,-- value must be unique and not null
department_name varchar(30) not null
-- these are all columns present in the table
-- here not null is a constraint 
);
insert into department (department_name) values
('sales'),('support'),('warehouse');
select * from department;
-- we use auto increment since if we dont use it we have to manually enter the department id

insert into department (department_name) values
(null);-- it shows error cant be null we definr it previously

insert into department (department_id,department_name) values
(2,'sales'); -- show error duplicate key entry

create table employees(
employee_id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
email varchar(30) not null unique,
phone varchar(20),
bio text, -- suppose you dont know length of sentence
job_title varchar(50) not null,
salary int not null check(salary>0),
is_active boolean not null default true,-- suppose you pass empty its true 
hire_date date not null,
last_login timestamp,
employee_status varchar(20) not null default 'active'  -- active,on_leav,terminated
-- since you give 20 char so employee can enter anything
check(
employee_status in ('active','on_leav','terminated')
),
creaated_at timestamp not null default current_timestamp,
-- suppose we have  to assign each emploee to a department in department table
department_id int references department(department_id),
-- department_id1 is a foreign key of table employee int data type, which reference ,department table ,column department_id 
manager_id int references employees (employee_id) -- this is called self referencing , here manager alos a employee
);
-- INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
--     ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, 1,    '2020-06-15'),
--     ('Fake',   'Robert',    'robert.chen@techbazaar.com',     1, 'Rep',                  50000.00, 1,    '2024-01-01'),
--     ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000.00, 1,    '2021-09-01'),
--     ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000.00, 1,    '2019-11-20'),
--     ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',         72000.00, NULL, '2018-05-10'),
--     ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',        48000.00, 5,    '2022-02-14'),
--     ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',        46000.00, 5,    '2023-01-09'),
--     ('Sara',   'Osei',      'sara.osei@techbazaar.com',       5, 'Warehouse Lead',       55000.00, NULL, '2020-08-23');
    -- you see a  error because  you assign manager id 1 first row , 
--  in my sql Rows are evaluated sequentially, row-by-row.but in postgr sql ata time the above code in postg sql enviroment
-- When evaluating the first row (Priya), MySQL immediately checks: "Does employee ID 1 exist in the table right now?"
-- Since the table was empty at the start of that row, it fails immediately.
-- also another erroe department id 5 doesnt exist , its only 3 pdepartment so 3 id are there

INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, NULL, '2020-06-15'),
    ('Fake',   'Robert',    'robert.chen@techbazaar.com',     1, 'Rep',                  50000.00, 1,    '2024-01-01'),
    ('Marcus', 'Webb',      'marcus.webb@techbazaar.com',     1, 'Sales Representative', 58000.00, 1,    '2021-09-01'),
    ('Elena',  'Garcia',    'elena.garcia@techbazaar.com',    1, 'Senior Sales Rep',     68000.00, 1,    '2019-11-20'),
    ('James',  'Okafor',    'james.okafor@techbazaar.com',    2, 'Support Lead',         72000.00, NULL, '2018-05-10'),
    ('Lily',   'Zhang',     'lily.zhang@techbazaar.com',      2, 'Support Agent',        48000.00, 5,    '2022-02-14'),
    ('Diego',  'Fernandez', 'diego.fernandez@techbazaar.com', 2, 'Support Agent',        46000.00, 5,    '2023-01-09'),
    ('Sara',   'Osei',      'sara.osei@techbazaar.com',       3, 'Warehouse Lead',       55000.00, NULL, '2020-08-23');
    select * from employees;
-- check something
INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ( null,  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, 1,    '2020-06-15');
-- show erroe db level check,first name cant be null
INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, 1,    '2020-06-15');
-- show error duplicate key , these are called constraints you write in query
INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date) VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 0, 1,    '2020-06-15');
-- show errors constraints violeted because salary >0
INSERT INTO employees (first_name, last_name, email, department_id, job_title, salary, manager_id, hire_date,employee_status) VALUES
    ('Priya',  'Nair',      'priya.nair@techbazaar.com',      1, 'Sales Representative', 62000.00, 1,    '2020-06-15','retired');
    -- show error constraints violeted , because you have no option like retired
    
-- suppose you already create a table but want to add another column
alter table employees
add column internal_note varchar(100) default 'n/a';
select * from employees;

-- supoose you want to rename the column
alter table employees
rename column internal_note to hr_note;
select * from employees;

-- suppose you want to drop a column
alter table employees
drop column hr_note;
select * from employees;

-- DDL DATA DEFINATION LANGUAGE

create table sahil(
full_name varchar(20) not null,
age int not null
);
describe sahil;
insert into sahil (full_name,age) values
('rahul',20),
('ram',20),
('babbul',80);
select * from sahil;
truncate table sahil;
describe sahil;

create table sahil1(
full_name varchar(20) not null,
age int not null
);
describe sahil1;
insert into sahil1 (full_name,age) values
('rahul',20),
('ram',20);
select * from sahil1;
drop table sahil1;
describe sahil1;
-- the dofference is whole table and data is deleted in drop but in truncate only data deleted structure remains same
