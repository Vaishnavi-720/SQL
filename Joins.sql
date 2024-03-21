use classicmodels;

-- #inner Join

select * from customers;

-- here we are fetching first name last name and amaount from customers and payments table

select c.contactfirstName, c.contactLastName, p.Amount
from customers as c inner join payments as p
on c.customerNumber = p.customerNumber;

describe customers;
describe products;
describe productLines;
describe orderdetails;
describe orders;

select c.contactfirstName, c.contactLastName, c.country, O.orderDate, O.shippedDate, O.status
from customers as c inner Join Orders as O inner join Payments as P
on c.customerNumber = O.customerNumber =P. CustomerNumber;

select Pr.productcode, Pr.productline, Pr.MSRP, OD.quantityOrdered, OD.priceEach
from products as Pr inner join orderdetails as OD
on Pr.productcode = OD.productcode;

-- fetch cfN clN country productline msrp 

-- select c.contactFirstName, c.contactLastName, c.country, p.productline, p.MSRP
-- from customers as C inner Join ( 
-- select o.customerNumber, od.productcode
-- from orders as od inner join (
-- select ord.orderNumber, p.productline, p.MSRP
-- from products as p inner join orderdetails as ord))
-- on c.customerNumber = p.customerNumber ;

describe customers;    -- CustomerNumber
describe products;     -- productcode
describe orders;          -- orderNumber, customerNUmber
describe orderdetails;    --   orderNumber, productcode   

select c.contactfirstName, c.contactlastName, c.country, n2.productline, n2.msrp
from customers as c inner join (
select o.customerNumber, n1.msrp, n1.productline
from orders as o inner join(
select  ord.orderNumber, p.productline, p.msrp
from products as p inner join orderdetails as ord
on p.productcode = ord.productcode) as n1
on o.ordernumber = n1.ordernumber) as n2
on c.customerNumber = n2.customerNumber; 
-- where productline = 'classic cars';


select contactfirstname, contactlastName, country, productline, MSRP
from customers inner join orders inner join orderdetails inner join products;

use customerdetails;
select * from orders;
select * from customer;

select f_name, l_name, country, amount 
from customer inner join orders
on customer.customer_id = orders.customer_id ;

select f_name, l_name, country, amount 
from customer left join orders
on customer.customer_id = orders.customer_id ;

select f_name, l_name, country, amount 
from customer right join orders
on customer.customer_id = orders.customer_id ;

select f_name, l_name, country, amount 
from customer left join orders
on customer.customer_id = orders.customer_id  
union
select f_name, l_name, country, amount 
from customer right join orders
on customer.customer_id = orders.customer_id ;

use classicmodels;
