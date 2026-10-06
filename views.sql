create view v1 as select * from customers;

show tables;

show full tables where table_type='VIEW';

drop view v1;
-- 2️⃣ Create a view to display department names with total employees in each.	


create view  v1 as select d.dept_name,count(e.eid) from employees as e inner join departments as d on
e.department=d.dept_id group by d.dept_name;

-- Create a view to show departments having an average salary greater than 50,000.

select d.dept_name,avg(e.salary) as avg_salary from departments as d join employees as e
on d.dept_id=e.department group by d.dept_name having avg_salary>5000;