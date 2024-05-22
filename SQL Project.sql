-- Q1
select distinct c.country  
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
where o.status = 'Cancelled';

-- Q2
select p.productName , 
sum(o.quantityOrdered) as 'Total Quantity sold'
from products as p
join orderdetails as o
on p.productCode = o.productCode
group by 1
order by 1 ;

-- Q3
select customerName, 
sum(amount) as "Total amount paid"
from customers as c
left join payments as p
on c.customerNumber = p.customerNumber
group by 1
order by 2 desc;

-- Q4
select productName 
from products 
where productCode not in(
select productCode
from orderdetails);

-- Q5
select c.customerNumber, c.customerName, c.city, 
sum(p.amount) as "Total amount paid",
count(p.amount) as "No. of payments made"
from customers as c
left join payments as p
on c.customerNumber = p.customerNumber
group by 1
order by 1;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
-- Q6
select distinct city, 
count(status) as "No. of 'In Process' and 'On Hold' orders" , 
status
from orders
left join customers
on orders.customerNumber = customers.customerNumber
where status = "In Process" or status = "On Hold"
group by 1;

-- Q7
select o.customerNumber, customerName 
from orders as o
left join customers as c
on o.customerNumber = c.customerNumber
where o.customerNumber not in (
select customerNumber
from payments);

-- Q8
select customerName,
min(orderDate) as "First order date",
max(orderDate) as "Last order date",
count(orderNumber) as "No. of orders"
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
where "First order date" is not null
group by 1;

-- Q9
select distinct customerName , 
count(orderNumber) as "No. of orders"
from customers as c
left join orders as o
on c.customerNumber = o.customerNumber
where city = 'Madrid'
group by 1;

-- Q10
select count(*) as "No. os payments in 2005 with order amount greater than 18000" 
from payments
where date_format(paymentDate,'%Y') = "2005"
and amount > 18000;