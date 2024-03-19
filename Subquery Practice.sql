use employees;

select * from emp
where salary=(select max(salary) from emp);
update emp set salary=150000
where Ename='Kaustubh';

select * from emp
where Salary = ( select max(salary)
from emp
where salary <( select max(salary)
from emp)
);

select * from emp;

select Ename 
from Emp
where Eid = ( Select ManagerId
from Emp
where Ename = 'Umesh');

select Ename, Eid, ManagerId
from emp
where ManagerId = ( select Eid from emp
where Ename = 'Ramesh');

use classicmodels;

select * from customers;