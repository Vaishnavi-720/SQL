create database CustomerDetails;
use customerdetails;
create table Customer(
Customer_id int,
f_name varchar(20),
l_name varchar(20),
age int,
country varchar(30));

show tables;

create table Orders (
order_id int,
amount int,
customer_id int);

insert into Customer
values (1, 'John', 'Doe', 32, 'USA'),
(2, 'Robert', 'Luna', 22, 'USA'),
(3, 'Davuid', 'Rabinson', 22, 'UK'),
(4, 'John', 'David', 25, 'Uk'),
(5, 'Betty', 'Doe', 28, 'UAE');

select * from Customer;

select * from Orders;

insert into Orders
values (1, 200, 4),
(2, 500, 10),
(3, 300, 3),
(4, 800, 1),
(5, 150, 2);

use customerdetails;

-- customerdetails whose age is greater than avg age
select * from customer
where age > (select avg(age)
from customer);

-- details of customer max amount 

select * from customer
where customer_id in(select customer_id 
from orders
where amount = (select max(amount)
from orders));



select customer_id 
from orders
where amount = (select max(amount)
from orders);