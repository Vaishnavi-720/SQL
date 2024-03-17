use employees;

create table Emp 
(Eid int, Ename varchar(20), 
Designation varchar(20), 
ManagerID varchar(4), 
Salary int, 
Incentive int, 
Email varchar(20));

alter table Emp 
add column JoiningDate date;

update Emp 
set JoiningDate = '2023-07-03'
where EID = 1005;

select * from Emp;

insert into Emp values (1001, 'Ramesh', 'VicePresident', 0001, 100000, 0, 'rdarade@gmail.com');

insert into Emp values (1002, 'Vaishnavi', 'Manager', 1001, 70000, 5000, 'vgujar@gmail.com'),
(1003, 'Umesh', 'Accountant', 1002, 50000, 0, 'ududam@gmail.com'),
(1004, 'Kaustubh', 'Manager', 1001, 200000, 10000, 'kkumar@gmail.com');

insert into Emp values (1005, 'Pragati', 'Associate', 1004, 25000, 15000, 'p@gmail.com'),
(1006, 'Bhagyashri', 'Accountant', 1002, 50000, 0, 'b@gmail.com'),
(1007, 'Ajay', 'teamLead', 1002, 30000, 5000, 'aa@gmail.com');

insert into Emp values (1, 'Kajal', 'President', null, 200000, null, 'kp@gmail.com', '2016-01-01');

select * from Emp;

select Eid, Ename, Designation, Incentive
from Emp
where Incentive = 0;

Select EId, Ename, ManagerID, designation, salary
from Emp
where Designation = 'Manager' and salary < 100000;

Select ManagerId
from Emp
where Ename = 'Vaishnavi';

select Ename
from Emp
where EID = 1001;


select EID, Ename 
from Emp
where ManagerID = 1002;

