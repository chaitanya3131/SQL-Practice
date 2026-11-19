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
SELECT * FROM orderdetails;
SELECT * FROM products;

WITH Product_Qnt as(
SELECT PRODUCTCODE,SUM(QUANTITYORDERED) as totalqnt FROM orderdetails group by productCode
),
Product_rev as (
SELECT productCode,saleprice from PRODUCTS
)
SELECT pq.productCode, pq.totalqnt,(pq.totalqnt*pr.saleprice) as Revenue FROM Product_Qnt as pq
join Product_rev as pr
on pq.productcode=pr.productcode
order by Revenue desc;



-- Recursive cte

WITH RECURSIVE CTE AS (
SELECT 1 AS NUM
UNION ALL
SELECT NUM+1 FROM CTE
WHERE NUM <10
)
SELECT * FROM CTE;

SELECT EMPNAME,
CASE
WHEN SALARY >20000 THEN "HIGH"
ELSE "LOW"
END AS SAL_STATUS
FROM EMPLOYEES;

























