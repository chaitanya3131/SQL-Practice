-- 1.	Find employees who earn more than the average salary in their department.
select e.eid,e.empName,e.department from employees as e
where e.salary > 
(select avg(e2.salary) from employees as e2 where e.department=e2.department);

select * from orders;
select * from customers;

-- 2.	 List customers who placed more orders than the average orders per customer.
select c.custId,count(o.orderNumber) as Total_Orders from customers as c
inner join orders as o on c.custid=o.custId group by c.custId
having Total_orders > (select count(*)/count(distinct custid) from orders );

-- 3 6.	Show each employee and their department name.
select e.eId,e.empName,d.dept_name from employees as e,departments as d;
--  For each order, show order_id, amount, and the customer’s city.
select c.city,c.custid,o.orderNumber from orders as o,customers as c where c.custid in (select custid from orders);

