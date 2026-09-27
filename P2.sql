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



select * from employees;
select * from departments;

select d.dept_name,count(e.eId) as EmpNo from employees as e join departments as d on d.dept_id=e.department group by d.dept_name having EmpNo<5;





