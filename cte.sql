use sample;

select * from employees where salary > ( select avg(salary) from employees);

WITH AVG_SAL AS (

SELECT AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES
)
select * from EMPLOYEES,AVG_SAL WHERE SALARY>AVG_SAL.AVG_SALARY;
SHOW DATABASES;
SELECT * FROM products;
SELECT * FROM orderdetails;
USE SAMPLE;
WITH PR3 AS (
SELECT p.productName,sum(o.quantityOrdered) AS SELLED_UNITS from products as p
join orderdetails as o 
on p.productcode=o.productcode
group by p.productName
)
SELECT * FROM PR3 ORDER BY selled_units desc limit 3;







