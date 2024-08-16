CREATE DATABASE Artgallerymanagement;
CREATE TABLE Artist
(
ArtistID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
BirthDate DATE,
Country VARCHAR(50),
Biography TEXT
);
CREATE TABLE Artworks
(
ArtworkID INT AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(100),
ArtistID INT,
YearCreated INT,
Type VARCHAR(50),
Medium VARCHAR(100),
Dimensions VARCHAR(50),
Price DECIMAL(10, 2)
);
CREATE TABLE Exhibitions
(
ExhibitionID INT AUTO_INCREMENT PRIMARY KEY,
ExhibitionName VARCHAR(100),
StartDate DATE,
EndDate DATE,
Location VARCHAR(100)
);
CREATE TABLE Artwork_Exhibitions
(
ArtworkID INT,
ExhibitionID INT,
PRIMARY KEY (ArtworkID, ExhibitionID),
FOREIGN KEY (ArtworkID)
REFERENCES Artworks(ArtworkID),
FOREIGN KEY (ExhibitionID)
REFERENCES Exhibitions(ExhibitionID)
);
CREATE TABLE Customers 
(
CustomerID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
PhoneNumber VARCHAR(15),
Address VARCHAR(255)
);
CREATE TABLE Sales
(
SaleID INT AUTO_INCREMENT PRIMARY KEY,
ArtworkID INT,
CustomerID INT,
SaleDate DATE,
SalePrice DECIMAL(10, 2),
);
CREATE TABLE Employees
(
EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Position VARCHAR(50),
Salary DECIMAL(10, 2),
HireDate DATE
);
CREATE TABLE Inventory
(
InventoryID INT AUTO_INCREMENT PRIMARY KEY,
ArtworkID INT,
Quantity INT,
FOREIGN KEY (ArtworkID)
REFERENCES Artworks(ArtworkID)
);
SELECT Title, YearCreated, Type, Medium, Price 
FROM Artworks
 WHERE ArtistID = [specific_artist_id];
SELECT e.ExhibitionName, e.StartDate, e.EndDate, e.location 
FROM Exhibition e 
JOIN Artwork_Exhibitions ae ON e.ExhibitionID = ae.ExhibitionID
 WHERE ae.ArtworkID = [specific_artwork_id];
 SELECT a.Title, c.FirstName, c.LastName, s.SaleDate, s.SalePrice
 FROM Sales s 
 JOIN Artworks a ON s.ArtworkID = a.ArtworkID
 JOIN Customers c ON s.CustomerID = c.CustomerID
 WHERE s.SaleDate BETWEEN 'start_date' AND 'end_date';
