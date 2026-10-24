-- Section 1: Advance Level Trigger


-- ●	Create a trigger that stores the inserted customer details in a separate customer_audit table whenever a new customer is added to the customers table.
CREATE TABLE STU (ID INT,NAME VARCHAR(50));
CREATE TABLE STU_LOG LIKE STU;
DROP TRIGGER TRIG;
DELIMITER $$
CREATE TRIGGER TRIG
BEFORE INSERT ON stu
FOR EACH ROW
BEGIN
	INSERT INTO STU_LOG (ID,NAME) VALUES (NEW.ID,NEW.NAME);
END $$
DELIMITER ;
INSERT INTO STU VALUES (1,'NAME');

-- ●	Write a trigger that prevents inserting or updating a product in the inventory table with stock quantity less than zero.

CREATE TABLE Inventory (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Stock_Quantity INT
);
drop trigger trig;
SELECT * FROM Inventory;
DELIMITER $$
CREATE TRIGGER TRIG
BEFORE UPDATE ON Inventory
FOR EACH ROW
BEGIN
    IF NEW.Stock_Quantity>OLD.Stock_Quantity THEN 
    SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'OUT OF STOCK';
    ELSE
		SET NEW.Stock_Quantity=Old.Stock_Quantity-New.Stock_Quantity;
	END IF;
END $$
DELIMITER ;

-- ●	Create a trigger on the employees table to track any update to the salary
-- field and store the old salary, new salary, and timestamp in a salary_history table.
CREATE TABLE EMP_TRACK (E_ID INT,OLD_SAL INT,NEW_SAL INT,DATETIME DATE);
DROP TRIGGER IF EXISTS TRIG;
SELECT * FROM EMPLOYEES;
DELIMITER $$
CREATE TRIGGER TRIG1
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
	INSERT INTO EMP_TRACK (E_ID,OLD_SAL,NEW_SAL,DATETIME) VALUES (OLD.EID,OLD.SALARY,NEW.SALARY,NOW());
END $$
DELIMITER ;

UPDATE employees SET SALARY=1 WHERE EID=496;
SELECT * FROM EMP_TRACK;


-- Create a BEFORE INSERT trigger on the users table to convert the email field to lowercase before storing it.
drop trigger trig;
select * from stu;
use demo;
drop
delimiter $$
create trigger trig
before insert on stu
for each row
begin
	SET NEW.email=LOWER(new.email);
end $$
delimiter ;

insert into stu (id,name,email) values (2, 'a','CHAITANYA');

-- ●	When an invoice is deleted from the invoices table,
-- use a trigger to automatically delete all associated records from the invoice_items table.
use demo;



CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Invoice_Date DATE,
    Total_Amount DECIMAL(10,2)
);

CREATE TABLE Invoice_Items (
    Item_ID INT PRIMARY KEY,
    Invoice_ID INT,
    Product_Name VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO Invoices
(Invoice_ID, Customer_Name, Invoice_Date, Total_Amount)
VALUES
(101, 'Amit', '2026-10-01', 1500.00),
(102, 'Priya', '2026-10-05', 2500.00),
(103, 'Rahul', '2026-10-10', 3000.00),
(104, 'Sneha', '2026-10-15', 1800.00);

INSERT INTO Invoice_Items
(Item_ID, Invoice_ID, Product_Name, Quantity, Price)
VALUES
(1, 101, 'Keyboard', 2, 500.00),
(2, 101, 'Mouse', 1, 500.00),
(3, 102, 'Monitor', 1, 2000.00),
(4, 102, 'Mouse', 1, 500.00),
(5, 103, 'Laptop', 1, 3000.00),
(6, 104, 'Keyboard', 1, 500.00),
(7, 104, 'Headphones', 2, 650.00);
select * from invoice_items;
select * from invoices;
drop trigger trig ;
DELIMITER $$
CREATE TRIGGER TRIG
BEFORE DELETE ON INVOICES
FOR EACH ROW
BEGIN
	DELETE FROM invoice_items where Invoice_ID=old.invoice_id;
end $$
delimiter ;

delete from invoices where Invoice_ID=101;

SET SQL_SAFE_UPDATES = 0;


















