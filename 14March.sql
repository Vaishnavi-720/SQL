use classicmodels;
show tables;
select * from customers;
select customerName, contactLastName from customers;
select * from customers;
select distinct city from customers;
select contactLastName, contactFirstName, creditLimit 
from customers;

select * from employees;
select lastName, firstName, jobTitle 
from employees;

select * from offices;
select city, country from offices;
select distinct city, country from offices;

select * from orderdetails;
select quantityOrdered, priceEach from orderdetails;

select * from products;
select distinct productLine 
from products;

select * from products;
select * from payments;
select distinct customerNumber from payments;

select * from customers;
select CustomerName, contactLastName, contactFirstName, creditLimit
from customers
where creditLimit > 110000;

select customername, creditlimit
from customers
where creditlimit = 117300;

select * from employees;
select lastName, firstName
from employees
where jobtitle = 'Sales rep' and  officecode = 3;

select * from customers;

select contactLastName, contactFirstName, creditLimit
from customers
where city = 'Melbourne' and creditLimit > 100000;

select contactLastName, contactFirstName, country
from customers
where country != 'USA' and creditLimit > 150000;

select contactLastName, contactFirstName, city, creditLimit
from customers
where city = 'NYC' or creditLimit < 50000;

select contactLastName, contactFirstName, city, creditLimit
from customers 
order by creditlimit desc;

select ContactLastName, contactFirstName, CreditLimit
from customers
where country = 'USA'
order by CreditLimit desc;

select contactLastName, contactFirstName, creditlimit
from customers
where creditLimit > 50000 and country = 'USA'
order by contactFirstName asc;

select * from customers
where state is not null;

select * from customers
where state is null;

use classicmodels;

select CustomerName, contactfirstName, contactLastName, creditlimit 
from customers
order by creditLimit desc
limit 5;

select CustomerName, contactfirstName, contactLastName, creditlimit 
from customers
where country = "USA"
limit 5;

-- Top 5 acc to creditlimit in USA
select CustomerName, contactfirstName, contactLastName, creditlimit, country
from customers
where country = "USA"
order by creditlimit desc
limit 5;

select * from customers;

-- records from france germany japan
select CustomerName, Country
from customers
where country = 'France' or  country = 'Germany' or country = 'Japan';

-- records from france germany japan
select * 
from customers
where country in ('France', 'Germany', 'Japan')
order by country;

select * from employees;

-- get job title of mary, anthony, larry
select firstName, jobTitle
from employees
where firstName in ('Mary', 'Anthony', 'Larry' );

select * from customers;

select CustomerName, creditLimit
from customers
where creditLimit between 50000 and 150000;

-- bottom 5 acc to creditlimit
select CustomerName, creditlimit
from customers
where creditlimit between 50000 and 150000
order by creditlimit
limit 5;

-- top 5 acc to creditlimit
select CustomerName, creditlimit
from customers
where creditlimit between 50000 and 150000
order by creditlimit desc
limit 5;

-- top 5 acc to creditlimit and country USA
select CustomerName, creditlimit, Country
from customers
where creditlimit between 50000 and 150000 and country = 'USA'
order by creditlimit desc
limit 5;

select CustomerName, contactfirstName
from customers
where contactFirstName like 'r%';

select CustomerName, contactfirstName
from customers
where contactFirstName like 'p%';

select CustomerName, contactfirstName, contactLastName
from customers
where contactLastName like '%z';

select CustomerName, contactfirstName
from customers
where contactFirstName like 'a%n';

select CustomerName, contactfirstName
from customers
where contactFirstName like 'a__';


select CustomerName, contactfirstName, contactLastName
from customers
where contactLastName like 'C___';

select * from customers;

select count(contactFirstName)
from customers
where country = 'USA' and contactfirstName like 'r%' ;

select count(contactFirstName)
from customers
where country = 'Germany' and contactfirstName like 'm%' and creditlimit > 100000 ;

select avg(creditlimit)
from customers;

select avg(creditlimit)
from customers
where country = 'Singapore';

select country 
from customers;

select sum(creditlimit)
from customers
where country = 'France';

select min(creditlimit)
from customers
where country = 'Japan';

select max(creditlimit)
from customers
where country = 'USA';

select max(creditlimit)
from customers
where country = 'Japan';

select country, sum(creditlimit) as TotalCredLimit
from customers
group by country;

select country, sum(creditlimit) as TotalCredLimit
from customers
group by country
order by totalCredLimit desc
limit 5;

select country, min(creditlimit) as TotalCredLimit
from customers
group by country
order by totalCredLimit desc
limit 5;

use classicmodels;

-- Summary Statistics
select country, count(creditlimit)as TotalCount, 
avg(creditlimit)as AvgCL, 
sum(creditlimit) as TotalCL, 
max(creditlimit) as MaxCL, 
min(creditlimit) as minCL
from customers
group by country
order by TotalCl desc;

-- having clause, whenever group by used
select country,
max(creditlimit) as MAXCL
from customers
group by country
having MAXCL > 100000;

select * from products;

-- Summary Statistics acc to MSRP
select productline,
count(MSRP) as TotalCount,
sum(MSRP) as TotalMSRP,
max(MSRP) as MaxMSRP,
min(MSRP) as MinMSRP,
avg(MSRP) as AvgMSRP
from products
group by productline;

-- Summary Statistics acc to buyPrice
select productline,
count(buyPrice) as TotalCount,
sum(buyPrice) as TotalBP,
max(buyPrice) as MaxBP,
min(buyPrice) as MinBP,
avg(buyPrice) as AvgBP
from products
group by productline
having avgBP > 50 and MaxBP > 100;

-- Summary Statistics acc to quantityInStock
select productline,
count(quantityInStock) as TotalCount,
sum(quantityInStock) as TotalQIS,
max(quantityInStock) as MaxQIS,
min(quantityInStock) as MinQIS,
avg(quantityInStock) as AvgQIS
from products
group by productline
having MinQIS between 100 and 200
order by MinQIS asc;

select * from customers;

-- select customerName, contactfirstName, creditlimit
-- from customers 
-- where creditlimit > ?

select contactfirstName, creditlimit
from customers
where creditlimit > (select avg(creditlimit)
from customers);

-- select contactfirstName, creditlimit
-- from customers
-- where creditlimit > 'avg(creditlimit)';   
-- this is an error

select avg(creditlimit)
from customers;

select * from customers
where creditlimit = (select max(creditlimit)
from customers);

select * from customers
where creditlimit = (select max(creditlimit)
from customers
where creditlimit < (select max(creditlimit)
from customers)
);

select contactfirstName, creditlimit
from customers
-- where creditlimit < ( select max(creditlimit)
-- from customers)
order by creditlimit desc
limit 8,1;

select contactfirstName, creditlimit 
from customers
-- where creditlimit < (select max(creditlimit)
-- from customers)
order by creditlimit desc;

select contactfirstName, creditlimit
from customers
where creditlimit >= 
(select distinct creditlimit
from customers
order by creditlimit desc
limit 6,1)
order by creditlimit desc;


use classicmodels;
select * from customers;
select * from products;
select * from productlines;
select * from orders;
select * from employees;
select * from offices;


-- employees working in paris tokyo and sydney
-- question broke in two parts here selecting officode for citites Paris, Tokyo, Sydney
select officecode 
from offices
where city in ('Paris', 'Tokyo', 'Sydney');

-- this is final query
select *
from employees
where officecode in (select officecode
from offices
where city in ('Paris', 'Tokyo', 'Sydney'));

-- employee data of australia
select * from employees
where officecode = ( select officecode
from offices 
where country = 'Australia');

select officecode
from offices 
where country = 'Australia';

describe orders;

-- customerdetails who bought classiccars

select * from customers
where customernumber;

select productcode 
from products 
where productline = 'Classic Cars';

select orderNumber 
from orderdetails
where productcode ;

-- final query for customerdetails who bought classiccars
select * from customers
where customerNumber in 
(select customerNumber from orders
where orderNumber in 
(select orderNumber 
from orderdetails
where productcode in 
(select productcode 
from products 
where productline = 'Classic Cars')));



-- customer record whose payment > 50000

select customernumber 
from payments 
where amount > 50000;

-- final query for customer record whose payment > 50000
select * from customers
where customerNumber in (select customernumber 
from payments 
where amount > 50000);

-- cutomerdetails whose order is cancelled
select * from customers
where CustomerNumber in (select customerNumber
from orders
where status = 'Cancelled');

-- Homework
use classicmodels;
select * from customers;
select * from productlines;
select * from products;
select * from orders;
select * from orderdetails;
select * from payments;

-- fetch customerdetails whose order quantity is greater than avg order quantity
-- final query



select * from customers
where CustomerNumber in 
(select CustomerNumber from orders
where OrderNumber in
(select orderNumber
from orderdetails
where quantityOrdered > (select avg(quantityOrdered)
from orderdetails)));



select CustomerNumber from orders
where OrderNumber;

select orderNumber
from orderdetails
where quantityOrdered = (select avg(quantityOrdered)
from orderdetails);