create database cda12;
create database student;
show databases;
use student;
create table student(
studentID int, Sname varchar(20), class char(10),
city char(20));
show tables;
drop database cda1;
use student;
insert into student
values (1, "Shweta", "BE", "Nashik");
select * from student;