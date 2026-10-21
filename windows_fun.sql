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
SELECT *,SUM(SALES) OVER (
PARTITION BY REGION ORDER BY SALES DESC) AS TOTAL_SALE FROM Sales;













