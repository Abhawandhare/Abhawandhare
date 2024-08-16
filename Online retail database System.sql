CREATE DATABASE Onlineretail;
CREATE TABLE Users
(
user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(255) NOT NULL,
address TEXT,
phone_number VARCHAR(15),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Products
(
product_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
description TEXT,
price DECIMAL(10, 2) NOT NULL,
stock_quantity INT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Orders
(
order_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT,
order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
total_amount DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (user_id)
REFERENCES Users(user_id)
);
CREATE TABLE Order_Items
(
order_item_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT NOT NULL,
price DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (order_id)
REFERENCES Orders(order_id),
FOREIGN KEY (product_id)
REFERENCES Products(product_id)
);
CREATE TABLE Payments
(
payment_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
payment_method VARCHAR(50) NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
FOREIGN KEY (order_id)
REFERENCES Orders(order_id)
);
INSERT INTO Users (username, email, password, address, phone_number) VALUES ('john_deo', 'john@example.com', 'hashed_password', '123 Main St', '1234567890');
INSERT INTO Products (product_name, description, price, stock_quantity) VALUES ('Laptop', 'A Powerful laptop', 999.99, 50);
INSERT INTO Orders (user_id, total_amount) VALUES (1, 1999.98);
INSERT INTO Order_Items (order_id, product_id, quantity, price) VALUES (1,1, 2, 999.99);
INSERT INTO Payments (order_id, payment_method, amount) VALUES (1, 'Credit Card', 1999.98);
SELECT * FROM Users;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Payments;