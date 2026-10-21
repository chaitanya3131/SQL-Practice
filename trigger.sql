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
















-- ●	Whenever an order is deleted from the orders table, copy the deleted record to the deleted_orders table using a trigger.


-- ●	Create a trigger on the employees table to track any update to the salary field and store the old salary, new salary, and timestamp in a salary_history table.


-- ●	Whenever an employee record is updated in the employees table, automatically update the last_modified column with the current timestamp.

