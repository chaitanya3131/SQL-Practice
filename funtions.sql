select * from employees;

select eid,
fun(salary) as status
 from employees;
 
 
 delimiter $$
 create function fun1(dob date)
 returns int
 deterministic
 begin
	return timestampdifF(YEAR,dob,curdate());
end $$
DELIMITER ;

drop function fun1;

SELECT FUN1('2006-07-26');


delimiter $$
create function fun1(email varchar(50))
returns varchar(50)
deterministic
begin
    if email like '%@%.%' then return "valid";
    else return " not valid";
    end if;
end $$
delimiter ;

select fun1('chai@gmai.com');

SELECT FUN1();
    
-- ●	Use a function to display customer names in uppercase.

DELIMITER $$

CREATE FUNCTION FUN (NAME VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE UPP VARCHAR(50);
    SET UPP=UPPER(NAME);
    RETURN UPP;
END $$

DELIMITER ;

SELECT CUSTID,FUN(CUSTOMERNAME) AS NAME FROM CUSTOMERS;

-- Use a function to get the current date and time of the system.

select now();

-- ●	 Extract the first 3 letters of each product name.

select right(productName,3) from products;

-- Find the length of each customer’s full name.
select customerName,length(customerName) from customers;

-- ●	Get the current year and subtract it from the year of joining to get years of service.
select timestampdiff(year,'2006-07-26',curdate());

select curdate();

-- ●	Display all payments who registered in the current month.

select * from payments where month(paymentDate)=month(curdate()) and year(paymentDate)='2004';

-- ●	Round off the product price to 2 decimal places.

select round(salePrice,2) from products;

-- ●	Display the absolute difference between order quantity and stock.

select * from orderdetails;

-- Create a UDF to calculate total price = price * quantity.
drop function fun;
delimiter $$
create function fun(price int,qnt int)
returns decimal
deterministic
begin
	declare total decimal;
    select price*qnt into total;
    return total;
end $$

select fun(1,500);

-- Create a UDF that returns 'Adult' or 'Minor' based on date of birth.
DROP FUNCTION FUN;
DELIMITER $$
CREATE FUNCTION FUN(DATE DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE R VARCHAR(50);
    DECLARE AGE INT DEFAULT 0;
    SET AGE=timestampdiff(YEAR,DATE,NOW());
    IF AGE>=18 THEN
    SET R="ADULT";
    ELSE
    SET R="MINOR";
    END IF;
    RETURN R;
END $$

DELIMITER ;
SELECT FUN('2026-9-1');

-- ●	Concatenate first name and last name, and display it in uppercase.

select concat(upper(customerName),'_',upper(addressLine1)) from customers;
    
    
--  ●	Display the number of days between order date and delivery date.
select * from orders;

select datediff(shippedDate,orderDate) as Days from orders;















