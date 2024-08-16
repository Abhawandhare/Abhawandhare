CREATE DATABASE Billingsystem;
CREATE TABLE Apple
(
AppleID INT AUTO_INCREMENT PRIMARY KEY,
AppleName VARCHAR(100),
Price DECIMAL(10, 2),
QuantityInStock INT 
);
CREATE TABLE Person
(
PersonID INT AUTO_INCREMENT PRIMARY KEY,
PersonName VARCHAR(100),
ContactInfo VARCHAR(100)
);
CREATE TABLE Orders
(
OrderId INT AUTO_INCREMENT PRIMARY KEY,
CustomerID INT,
OrderDate DATE,
TotalAmount DECIMAL(10, 2),
FOREIGN KEY (PersonID)
REFERENCES Person(PersonID)
);
CREATE TABLE Order_Items
(
OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
ProductID INT,
Quantity INT,
SubTotal DECIMAL(10, 2),
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID),
FOREIGN KEY (ProductID)
REFERENCES Products(ProductID)
);
CREATE TABLE Payments
(
PaymentID INT AUTO_INCREMENT PRIMARY KEY,
OrderID INT,
AmountPaid DECIMAL(10, 2),
PaymentMethod VARCHAR(50),
PaymentDate DATE,
FOREIGN KEY (OrderID)
REFERENCES Orders(OrderID)
);
DELIMITER $$
CREATE PROCEDURE PlaceOrder(IN cust_id INT, OUT order_id INT)
BEGIN
DECLARE total DECIMAL(10, 2) 
DEFAULT 0;
DECLARE prod_id INT;
DECLARE qty INT;
DECLARE done INT DEFAULT
FALSE;
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (cust_id, CURDATE(), total);
SET order_id = LAST_INSERT-ID();
DECLARE order_item_cursor CURSOR FOR SELECT ProductID, Quantity FROM Order_Items WHERE OrderID = order_id;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
OPEN order_item_cursor;
read_loop: LOOP FETCH order_item_cursor INTO prod_id, qty;
IF done THEN LEAVE read_loop;
END IF;
UPDATE Products
SET QuantityInStock = QuantityInStock - qty WHERE ProductID = prod_id;
SET total = total + (SELECT Price FROM Products WHERE ProductID = prod_id) * qty;
END LOOP;
CLOSE order_item_cursor;
UPDATE Orders
SET TotalAmount = total
WHERE OrderID = order_id;
CALL GenerateBill(order_id, total);
END$$
DELIMITER ;
DELIMITER $$
CREATE PROCEDURE GenerateBill(IN order_id INT, IN total DECIMAL(10, 2))
BEGIN
INSERT INTO Payments (OrderID, AmountPaid, PaymentMethod, PaymentDate) VALUES (order_id, total, 'Cash', CURDATE());
END$$
DELIMITER;