CREATE DATABASE Wholesalemanagementsystem;
USE Wholesalemanagementsystem;
CREATE TABLE Stock
(
stock_id INT AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
quantity INT NOT NULL,
purchase_price DECIMAL(10, 2) NOT NULL,
sale_price DECIMAL(10, 2) NOT NULL
);
CREATE TABLE Suppliers
(
supplier_id INT AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
contact_number VARCHAR(15),
address TEXT
);
CREATE TABLE Customers
(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
contact_number VARCHAR(15),
address TEXT
);
CREATE TABLE Sales
(
sale_id INT AUTO_INCREMENT PRIMARY KEY,
stock_id INT,
customer_id INT,
quantity_sold INT NOT NULL,
sale_date DATE,
total_sale DECIMAL(10, 2) AS (quantity_sold * (SELECT sale_price FROM Stock WHERE Stock.stock_id = Sales.stock_id)),
FOREIGN KEY (stock_id)
REFERENCES Stock(stock_id),
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id)
);
CREATE VIEW MontlyProfit 
AS SELECT YEAR(sale_date) AS Year,
 MONTH(sale_date) AS Month,
 SUM(total_sale) AS TotalSales,
 SUM(quantity_sold * (SELECT purchase_price FROM Stock WHERE Stock.stock_id = Sales.stock_id))) AS TotalCost,
 (SUM(total_sale) - SUM((quantity_sold * (SELECT purchase_price FROM Stock WHERE Stock.stock_id = Sales.stock_id)))) AS Profit FROM Sales GROUP BY YEAR(sale_date),
 MONTH(sale_date);
 INSERT INTO Suppliers (supplier_name, contact_number, address) VALUES ('Supplier A', '9876543210', '123 Main St'), ('Supplier B', '8765432109', '456 Market Rd');
 INSERT INTO Stock (product_name, quantity, purchase_price, sale_price, supplier_id) VALUES ('Product A', 100, 50.00, 75.00, 1), ('Product B', 200, 30.00, 50.00, 2);
INSERT INTO Customers (customer_name, contact_number, address) VALUES ('Customer A', '9998887776', '789 Elm St'), ('Customer B', '8887776665', '321 Oak Ave');
SELECT * FROM MonthlyProfit;