create database store_db;
use store_db;
create table customer(
id int,
name varchar(100)
);
-- lets enter value in to table we can do this in 3 ways
insert into customer values (123,"rahul");
-- Insert specifying columns (safer, recommended)
insert into customer(id,name)
values(567,"dahul");
-- Insert multiple rows at once
insert into customer(id,name)
values(678,"rohit"),
(897,"babul"),
(886,"likun");
insert into customer 
values(158,"ram"),
(459,"purna");
-- want to view the table data
select * from customer;
-- reading only the column name
select name from customer;
-- suppose ther ar 100 of data you have to retrivre one how
select * from customer where id=678;