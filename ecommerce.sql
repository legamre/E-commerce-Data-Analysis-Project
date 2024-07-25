-- Create the database
CREATE DATABASE EcommerceDB;
USE EcommerceDB;

-- Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    CustomerID INT,
    Rating INT,
    Comment TEXT,
    ReviewDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    ContactInfo VARCHAR(255)
);

CREATE TABLE ProductSuppliers (
    ProductID INT,
    SupplierID INT,
    PRIMARY KEY (ProductID, SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE ShippingInfo (
    ShippingID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ShippingAddress VARCHAR(255),
    ShippingDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Discounts (
    DiscountID INT PRIMARY KEY AUTO_INCREMENT,
    DiscountDescription VARCHAR(255),
    DiscountAmount DECIMAL(10, 2),
    ProductID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sample Data
INSERT INTO Customers (Name, Email, Address, Phone) VALUES
('John Doe', 'john@example.com', '123 Main St', '555-555-5555'),
('Jane Smith', 'jane@example.com', '456 Elm St', '555-555-5556');

INSERT INTO Categories (CategoryName) VALUES
('Electronics'),
('Books'),
('Clothing');

INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity) VALUES
('Laptop', 1, 999.99, 50),
('Headphones', 1, 199.99, 150),
('Novel', 2, 9.99, 300);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2023-07-01', 1199.98),
(2, '2023-07-02', 199.99);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 999.99),
(1, 2, 1, 199.99),
(2, 2, 1, 199.99);

INSERT INTO Reviews (ProductID, CustomerID, Rating, Comment, ReviewDate) VALUES
(1, 1, 5, 'Great laptop!', '2023-07-05'),
(2, 2, 4, 'Good sound quality.', '2023-07-06');

INSERT INTO Suppliers (SupplierName, ContactInfo) VALUES
('Tech Supplies Co.', '123 Supplier St'),
('Books R Us', '456 Book Ln');

INSERT INTO ProductSuppliers (ProductID, SupplierID) VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO ShippingInfo (OrderID, ShippingAddress, ShippingDate) VALUES
(1, '123 Main St', '2023-07-03'),
(2, '456 Elm St', '2023-07-04');

INSERT INTO Discounts (DiscountDescription, DiscountAmount, ProductID) VALUES
('Summer Sale', 50.00, 1),
('Holiday Discount', 20.00, 2);

-- Test Queries
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Reviews;
SELECT * FROM Suppliers;
SELECT * FROM ProductSuppliers;
SELECT * FROM ShippingInfo;
SELECT * FROM Discounts;
