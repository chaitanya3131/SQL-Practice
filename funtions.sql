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















