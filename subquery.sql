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


-- 21.	List top 3 highest paid employees per department.

select * from employees;

select e.eId,d.dept_name,max(e.salary) from employees as e
join departments as d on e.department=d.dept_id group by d.dept_name order by e.salary desc;


-- 22.	Show each customer and their total spend amount.

select * from customers;
select * from orders;

select c.custid ,sum(o.orderAmount) from customers as c
join orders as o on c.custid=o.custid group by c.custid; 

-- 26.	Find employees who earn more than the average salary of all employees.

select * from employees;

select e.eid,e.empName from employees as e where e.salary >(select avg(salary) from employees);


-- 28.	Find customers whose total spend is above the average total spend.






-- 29.	Show each employee and their salary difference from department average.
SELECT e.eId,
       e.empName,
       e.salary,
       e.salary - (
           SELECT AVG(e2.salary)
           FROM employees e2
           WHERE e2.department = e.department
       ) AS salary_difference
FROM employees e;


-- 30.	Show each customer, total orders and total spend.
SELECT c.custid,
       (SELECT COUNT(*)
        FROM orders o
        WHERE o.custid = c.custid) AS total_orders,
       
       (SELECT SUM(o.orderAmount)
        FROM orders o
        WHERE o.custid = c.custid) AS total_spend
FROM customers c;










