-- LESSON: 11  Practice / Assigment -- 

-- Write a query to fetch all columns for all employees.
SELECT * FROM employees;
-- Fetch the unique product from the orders table.
SELECT DISTINCT PRODUCTCODE FROM orderdetails;
-- Fetch all details of employees who belong to the 'Sales' department.
SELECT * FROM employees where department='Sales';
-- Fetch the employee names and their salaries with column aliases "Name" and "Income"
select empName as Name,coalesce(NUllif(salary,0),'Intern') as Income from employees;
-- Show all products buy price above 50 Dollar.
select * from products where buyPrice>50;
-- Fetch the top 2 highest paid employees in our company.
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 2;
SELECT DEPARTMENT FROM EMPLOYEES;
-- Get employees who are either in Sales or have a salary above 30,000.

SELECT * FROM EMPLOYEES WHERE empName like 'j%';

-- Fetch products with a price between 20 and 100.

-- Retrieve orders where the product is either 'Laptop' or 'Tablet'

-- Find employee names starting with 'J'

-- Case insensitive search for employee names containing 'son'

-- Display employee names along with their salary category as 'High' if above 70,000, else 'Low'

-- Show the delivery date, but if it is NULL, display 'Pending'

-- Compare two columns and return NULL if they are the same.

-- Display employee names and their salary incremented by 10% as "New Salary"

-- Get the employees who are either in 'Sales' or 'Marketing' department and earn more than 30,000.

-- Show the product name and its availability status as 'In Stock' if the quantity is more than0, else 'Out of Stock'

-- Display customer names and delivery dates, but if the delivery date is NULL, show 'Not Delivered'

-- Retrieve all products whose names contain the letter 'a' (case insensitive) and are priced between 50 and 200, ordered by price in ascending order.

-- Count the number of different products sold.

-- Count how many employees have salaries above 70,000.







-- LESSON: 11  Practice / Assigment -- 

-- Write a query to fetch all columns for all employees.

   SELECT * FROM employees;

-- Fetch the unique product from the orders table.
  
   SELECT DISTINCT productCode FROM orderdetails;

-- Fetch all details of employees who belong to the 'Sales' department.
   
   SELECT * FROM employees where department = 'SALES';

-- Fetch the employee names and their salaries with column aliases "Name" and "Income" Show Intern if income is 0  
   
   select CONCAT(firstName,' ',lastName) as Name,
  	COALESCE (NULLIF(salary,0),'Intern') as Income from employees;
 

-- Show all products buy price above 50 Dollar.
  
   select * from products WHERE buyPrice > 50;

-- Fetch the top 2 highest paid employees in our company.
   
   SELECT * FROM employees order by salary DESC LIMIT 2;
   

-- Get employees who are either in Sales or have a salary above 30,000.
  
   SELECT * FROM employees WHERE department = 'Sales' OR salary > 30000;

-- Fetch products with a price between 20 and 100.
   SELECT * FROM products WHERE buyPrice BETWEEN 100 and 200;

-- Retrieve orders where the product is either 'Laptop' or 'Tablet'
   
   select * from products where productline in ('Vintage Cars','Motorcycles') 

-- Find employee names starting with 'J'
   
   SELECT * FROM employees where firstName LIKE 'J%';

-- Case insensitive search for employee names containing 'son'

  	SELECT * FROM employees where firstName LIKE '%son%';
  
-- Display employee names along with their salary category as 'High' if above 35,000, else 'Low'
   
   select CONCAT(firstName,' ',lastName) as Name,
   		  salary,
   		  CASE 
   		  	WHEN salary > 35000 THEN 'High'
   		  	ELSE 'Low'
   		  END
   FROM employees;
   		  
   

-- Show the delivery date, but if it is NULL, display 'Pending'

    select orderNumber,
   		COALESCE (shippedDate,'Pending') as status
   	from orders;
   
-- Compare two columns and return NULL if they are the same.
   
   SELECT 
    COALESCE(NULLIF(firstName,lastName),'SAME') as col
   from employees;
   
   

-- Display employee names and their salary incremented by 10% as "New Salary"
  
   SELECT CONCAT(firstName,' ',lastName) as Name,
           salary,
   		  salary + (salary % 10) AS incrementedSalary
   		 FROM employees;

-- Get the employees who are either in 'Sales' or 'Marketing' department and earn more than 30,000.
   		
   		-- BY YOU GUYS

-- Show the product name and its availability status as 'In Stock' 
--    if the quantity is more than 0, else 'Out of Stock'
		
   		-- BY YOU GUYS
   		
-- Display customer names and delivery dates, but if the delivery date is NULL, show 'Not Delivered'
   		
   		-- BY YOU GUYS

-- Retrieve all products whose names contain the letter 'a' (case insensitive) and are priced 
--  between 50 and 200, ordered by price in ascending order.

	 select * from products 
   		where productName LIKE '%8%' and buyPrice 
   	BETWEEN 50 and 200 ORDER BY buyPrice desc;
   		
   		
-- Count the number of different products sold.
   

-- Count how many employees have salaries above 70,000.




