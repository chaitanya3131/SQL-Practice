CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY,
    Region VARCHAR(20),
    Sales INT
);

INSERT INTO Sales (Sale_ID, Region, Sales)
VALUES
(1, 'East', 1000),
(2, 'West', 2000),
(3, 'East', 1500),
(4, 'West', 3000),
(5, 'North', 2500);

SELECT * FROM Sales;
SELECT *,SUM(Sales) OVER(
 partition by REGION order by Sales
) AS TOTAL_SALES FROM SALES;

USE SAMPLE;

SELECT *,ROW_NUMBER() OVER(
PARTITION BY CUSTID ORDER BY ORDERDATE DESC
) AS NUM FROM ORDERS;
select * from orderdetails;
SELECT categoRY,sum(saleprice) AS SALES ,RANK() OVER (

ORDER BY SUM(SALEPRICE) DESC) AS 'RANK'
FROM PRODUCTS GROUP BY CATEGORY;

SELECT * FROM PRODUCTS;

SELECT productCode,saleprice ,Percent_rank() over(
order by salePrice asc)
as 'Percentile' from products;

USE DEMO;
CREATE TABLE Employees (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    Joining_Date DATE
);

INSERT INTO Employees
(Emp_ID, Emp_Name, Department, Salary, Joining_Date)
VALUES
(1, 'Amit', 'IT', 40000, '2022-01-15'),
(2, 'Priya', 'IT', 45000, '2022-03-10'),
(3, 'Rahul', 'IT', 50000, '2022-06-20'),
(4, 'Sneha', 'HR', 35000, '2022-02-05'),
(5, 'Vijay', 'HR', 40000, '2022-04-12'),
(6, 'Neha', 'HR', 42000, '2022-07-18'),
(7, 'Rohan', 'Sales', 30000, '2022-01-25'),
(8, 'Pooja', 'Sales', 38000, '2022-05-14'),
(9, 'Karan', 'Sales', 45000, '2022-08-22'),
(10, 'Snehal', 'IT', 55000, '2022-09-01');


SELECT * FROM EMPLOYEES;
SELECT *, LEAD(SALARY,1) OVER (
ORDER BY EMP_ID ASC) AS PREVIOUS_SAL FROM EMPLOYEES;

USE SAMPLE;
select * from orders WHERE custId=103 order by orderDate;
SELECT c.custId,o.orderDate,first_value(O.ORDERDATE) OVER (
PARTITION BY CUSTID
ORDER BY O.ORDERDATE
) AS FIRST_ORDER FROM
 customers as c cross
join orders as o
on c.custid=o.custId;
















