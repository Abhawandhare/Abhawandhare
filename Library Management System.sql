CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;
CREATE TABLE Books
(
BookID INT AUTO_INCREMENT
PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
Genre VARCHAR(100),
PublishedDate DATE,
ISBN VARCHAR(13) UNIQUE
);
CREATE TABLE Members
(
MemberID INT AUTO_INCREMENT
PRIMARY KEY,
FirstName VARCHAR(100) NOT NULL,
LastName VARCHAR(100) NOT NULL,
Address VARCHAR(255),
Phone VARCHAR(15),
Email VARCHAR(100) UNIQUE,
MembershipDate DATE NOT NULL
);
CREATE TABLE Loans
(
LoanID INT AUTO_INCREMENT
PRIMARY KEY,
BookID INT,
MemberID INT,
LoanDate DATE NOT NULL,
ReturnDate DATE,
FOREIGN KEY (BookID) 
REFERENCES Books(BookID),
FOREIGN KEY (MemberID)
REFERENCES Members(MemberID)
);
INSERT INTO Books (Title, Genre, PublishedDate, ISBN)
VALUES
('The great gatsby', 'Fiction', '1925-04-10', '9780743273565'),
('To kill a Mockingbird', 'Fiction', '1960-07-11', '9780060935467');
INSERT INTO Members (FirstName, LastName, Address, Phone, Email, MembershipDate)
VALUES
('Aabha', 'Wandhare', 'Saipark Butibori Nagpur', '808038656', 'abhawandhare@gmail.com', '2023-02-13');
INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate)
VALUES
(1,1, '2024-07-01', '2024-07-15'), 
(2,2, '2024-07-14', NULL);

SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Loans;