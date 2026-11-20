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

-- 	8.  Find employees who work in departments where average salary > 50,000.

select * from employees;

select e.eid,d.dept_name,e.salary from employees as e
join departments as d
on e.department=d.dept_id
where e.salary>
(select avg(e2.salary) from employees as e2 where e.department=e2.department);


-- 16.	Find customers who have placed at least one order.

select c.custid,count(o.orderNumber) from customers as c
join orders as o on c.custid=o.custId group by c.custId;

select c.custid from customers as c where exists (select 1 from orders as o where c.custid=o.custid);

-- 18 List top 3 highest paid employees per department.


DELIMITER $$
CREATE PROCEDURE FUN()
BEGIN
	SELECT * FROM categories;
END $$
DELIMITER ;

DROP PROCEDURE FUN;

WITH RECURSIVE CTE (n,fact) AS(

SELECT 1,1
UNION ALL
SELECT n+1,fact*(n+1) from CTE WHERE n<5
)
select * from cte;











