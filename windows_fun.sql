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

























