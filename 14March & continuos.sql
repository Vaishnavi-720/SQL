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

