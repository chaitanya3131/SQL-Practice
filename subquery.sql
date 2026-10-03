-- 1.	Find employees who earn more than the average salary in their department.
select e.eid,e.empName,e.department from employees as e
where e.salary > 
(select avg(e2.salary) from employees as e2 where e.department=e2.department);

select * from orders;
select * from customers;

-- 2.	 List customers who placed more orders than the average orders per customer.
select c.custId,c.customerName,count(o.orderNumber) AS TOTAL from customers as c
inner join orders as o 
on c.custId=o.custId
group by c.custId,c.customerName
having count(o.orderNumber)>
(select count(*)/ count(distinct custid) from orders);
