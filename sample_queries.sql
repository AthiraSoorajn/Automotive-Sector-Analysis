use classicmodels;


show tables;

select * from products limit 10;

select * from customers 
where state = 'CA';



select * from products l
where MSRP >= 200 and MSRP <= 400;

select * from customers limit 10;

select date(paymentDate) as date_, sum(amount) as revenue, 
count(customerNumber) as payment_count
from payments 
group by date_
order by date_ desc;


select date(orderDate) as date_, status, count(orderNumber) as cnt from orders
where date(orderDate) BETWEEN '2004-01-01' AND '2004-07-30'
group by date_, status
order by date_ 
;

select * from orders limit 10  ;



select state, city, count(customerNumber) as cnt from customers
group by state, city ;


select * from customers;



use classicmodels;

select * from customers limit 10;
select distinct status from orders limit 10;


select count(distinct c.customerNumber) total_customers, 
count(o.customerNumber) total_orders,
count(distinct o.customerNumber) customer_with_orders,
count(distinct case when o.status = 'Shipped' then o.customerNumber end) as customers_with_shipped_order,
count(distinct case when o.status = 'Cancelled' then o.customerNumber end) as customers_with_cancelled_order
from customers as c 
LEFT JOIN orders as o
on c.customerNumber = o.customerNumber
-- where status = 'Shipped'
; 

select p.productName,sum(o.quantityOrdered)qty from products p
join orderdetails o
on p.productCode=o.productCode
group by p.productName;

select productCode,sum(quantityOrdered)qty from orderdetails
group by productCode;

select * from employees LIMIT 10;

select *, case when officeCode=1 then 'Kormangala' 
when  officeCode=6 then 'HSR' else 'No-where' end as officeCodeNames  from employees;



