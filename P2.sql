select * from orders;

select * from customers;

select c.customerName,count(*) as OrderCount from orders as o join customers as c
on o.custID=c.custId
 group by c.customerName
 order by OrderCount desc;
 
select c.customerName,sum(o.orderAmount) as spending from customers as c join orders as o on c.custId=o.custId group by c.customerName order by
spending desc;

select * from products;

select p.productName,sum(od.quantityOrdered) as total from orderdetails as od join products as p on p.productCode=od.productCode group by p.productName order by total desc limit 1;

