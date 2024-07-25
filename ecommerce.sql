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

-- Insert Sample Data for Customers
INSERT INTO Customers (CustomerID, Name, Email, Address, Phone) VALUES
(1, 'John Doe', 'john@example.com', '123 Main St', '555-555-5555'),
(2, 'Jane Smith', 'jane@example.com', '456 Elm St', '555-555-5556'),
(3, 'Alice Johnson', 'alice@example.com', '789 Maple St', '555-555-5557'),
(4, 'Bob Brown', 'bob@example.com', '101 Pine St', '555-555-5558'),
(5, 'Carol White', 'carol@example.com', '202 Oak St', '555-555-5559'),
(6, 'David Wilson', 'david@example.com', '303 Birch St', '555-555-5560'),
(7, 'Emma Thompson', 'emma@example.com', '404 Cedar St', '555-555-5561'),
(8, 'Frank Harris', 'frank@example.com', '505 Spruce St', '555-555-5562'),
(9, 'Grace Clark', 'grace@example.com', '606 Fir St', '555-555-5563'),
(10, 'Henry Lewis', 'henry@example.com', '707 Willow St', '555-555-5564'),
(11, 'Ivy Robinson', 'ivy@example.com', '808 Cherry St', '555-555-5565'),
(12, 'Jack Walker', 'jack@example.com', '909 Aspen St', '555-555-5566'),
(13, 'Karen Hall', 'karen@example.com', '1010 Poplar St', '555-555-5567'),
(14, 'Leo Allen', 'leo@example.com', '1111 Dogwood St', '555-555-5568'),
(15, 'Mia Young', 'mia@example.com', '1212 Magnolia St', '555-555-5569'),
(16, 'Noah King', 'noah@example.com', '1313 Redwood St', '555-555-5570'),
(17, 'Olivia Wright', 'olivia@example.com', '1414 Cypress St', '555-555-5571'),
(18, 'Paul Scott', 'paul@example.com', '1515 Maple St', '555-555-5572'),
(19, 'Quinn Green', 'quinn@example.com', '1616 Elm St', '555-555-5573'),
(20, 'Rachel Baker', 'rachel@example.com', '1717 Oak St', '555-555-5574'),
(21, 'Steve Adams', 'steve@example.com', '1818 Pine St', '555-555-5575'),
(22, 'Tina Mitchell', 'tina@example.com', '1919 Birch St', '555-555-5576'),
(23, 'Uma Carter', 'uma@example.com', '2020 Cedar St', '555-555-5577'),
(24, 'Vince Perez', 'vince@example.com', '2121 Spruce St', '555-555-5578'),
(25, 'Wendy Roberts', 'wendy@example.com', '2222 Fir St', '555-555-5579'),
(26, 'Xander Phillips', 'xander@example.com', '2323 Willow St', '555-555-5580'),
(27, 'Yara Evans', 'yara@example.com', '2424 Cherry St', '555-555-5581'),
(28, 'Zachary Turner', 'zachary@example.com', '2525 Aspen St', '555-555-5582'),
(29, 'Aiden Parker', 'aiden@example.com', '2626 Poplar St', '555-555-5583'),
(30, 'Bella Edwards', 'bella@example.com', '2727 Dogwood St', '555-555-5584'),
(31, 'Caleb Collins', 'caleb@example.com', '2828 Magnolia St', '555-555-5585'),
(32, 'Daisy Morris', 'daisy@example.com', '2929 Redwood St', '555-555-5586'),
(33, 'Ethan Murphy', 'ethan@example.com', '3030 Cypress St', '555-555-5587'),
(34, 'Fiona Rogers', 'fiona@example.com', '3131 Maple St', '555-555-5588'),
(35, 'George Cook', 'george@example.com', '3232 Elm St', '555-555-5589'),
(36, 'Hannah Gray', 'hannah@example.com', '3333 Oak St', '555-555-5590'),
(37, 'Isaac Long', 'isaac@example.com', '3434 Pine St', '555-555-5591'),
(38, 'Julia Foster', 'julia@example.com', '3535 Birch St', '555-555-5592'),
(39, 'Kevin Ward', 'kevin@example.com', '3636 Cedar St', '555-555-5593'),
(40, 'Lily Hughes', 'lily@example.com', '3737 Spruce St', '555-555-5594'),
(41, 'Michael Patterson', 'michael@example.com', '3838 Fir St', '555-555-5595'),
(42, 'Nina Simmons', 'nina@example.com', '3939 Willow St', '555-555-5596'),
(43, 'Oscar Jenkins', 'oscar@example.com', '4040 Cherry St', '555-555-5597'),
(44, 'Paula Bryant', 'paula@example.com', '4141 Aspen St', '555-555-5598'),
(45, 'Ryan Woods', 'ryan@example.com', '4242 Poplar St', '555-555-5599'),
(46, 'Sophie Reed', 'sophie@example.com', '4343 Dogwood St', '555-555-5600'),
(47, 'Tommy Sanders', 'tommy@example.com', '4444 Magnolia St', '555-555-5601'),
(48, 'Ursula Barnes', 'ursula@example.com', '4545 Redwood St', '555-555-5602'),
(49, 'Victor Bell', 'victor@example.com', '4646 Cypress St', '555-555-5603'),
(50, 'Willow Chapman', 'willow@example.com', '4747 Maple St', '555-555-5604');

-- Insert Sample Data for Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing'),
(4, 'Home & Kitchen'),
(5, 'Sports & Outdoors'),
(6, 'Toys & Games'),
(7, 'Health & Personal Care'),
(8, 'Automotive');

-- Insert Sample Data for Products
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, StockQuantity) VALUES
(1, 'Laptop', 1, 999.99, 50),
(2, 'Headphones', 1, 199.99, 150),
(3, 'Novel', 2, 9.99, 300),
(4, 'T-Shirt', 3, 19.99, 200),
(5, 'Blender', 4, 49.99, 80),
(6, 'Yoga Mat', 5, 24.99, 120),
(7, 'Board Game', 6, 29.99, 60),
(8, 'Vitamins', 7, 15.99, 90),
(9, 'Car Charger', 8, 9.99, 50),
(10, 'Smartphone', 1, 699.99, 40),
(11, 'Tablet', 1, 399.99, 35),
(12, 'Cookbook', 2, 19.99, 200),
(13, 'Jeans', 3, 49.99, 120),
(14, 'Coffee Maker', 4, 79.99, 70),
(15, 'Tent', 5, 99.99, 50),
(16, 'Action Figure', 6, 14.99, 150),
(17, 'Protein Powder', 7, 39.99, 110),
(18, 'Car Vacuum', 8, 29.99, 60),
(19, 'Smartwatch', 1, 199.99, 45),
(20, 'Speaker', 1, 129.99, 55);

-- Insert Sample Data for Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2023-07-01', 1199.98),
(2, 2, '2023-07-02', 199.99),
(3, 3, '2023-07-03', 299.97),
(4, 4, '2023-07-04', 399.96),
(5, 5, '2023-07-05', 499.95),
(6, 6, '2023-07-06', 599.94),
(7, 7, '2023-07-07', 699.93),
(8, 8, '2023-07-08', 799.92),
(9, 9, '2023-07-09', 899.91),
(10, 10, '2023-07-10', 999.90),
(11, 11, '2023-07-11', 1099.89),
(12, 12, '2023-07-12', 1199.88),
(13, 13, '2023-07-13', 1299.87),
(14, 14, '2023-07-14', 1399.86),
(15, 15, '2023-07-15', 1499.85),
(16, 16, '2023-07-16', 1599.84),
(17, 17, '2023-07-17', 1699.83),
(18, 18, '2023-07-18', 1799.82),
(19, 19, '2023-07-19', 1899.81),
(20, 20, '2023-07-20', 1999.80),
(21, 21, '2023-07-21', 2099.79),
(22, 22, '2023-07-22', 2199.78),
(23, 23, '2023-07-23', 2299.77),
(24, 24, '2023-07-24', 2399.76),
(25, 25, '2023-07-25', 2499.75),
(26, 26, '2023-07-26', 2599.74),
(27, 27, '2023-07-27', 2699.73),
(28, 28, '2023-07-28', 2799.72),
(29, 29, '2023-07-29', 2899.71),
(30, 30, '2023-07-30', 2999.70),
(31, 31, '2023-07-31', 3099.69),
(32, 32, '2023-08-01', 3199.68),
(33, 33, '2023-08-02', 3299.67),
(34, 34, '2023-08-03', 3399.66),
(35, 35, '2023-08-04', 3499.65),
(36, 36, '2023-08-05', 3599.64),
(37, 37, '2023-08-06', 3699.63),
(38, 38, '2023-08-07', 3799.62),
(39, 39, '2023-08-08', 3899.61),
(40, 40, '2023-08-09', 3999.60),
(41, 41, '2023-08-10', 4099.59),
(42, 42, '2023-08-11', 4199.58),
(43, 43, '2023-08-12', 4299.57),
(44, 44, '2023-08-13', 4399.56),
(45, 45, '2023-08-14', 4499.55),
(46, 46, '2023-08-15', 4599.54),
(47, 47, '2023-08-16', 4699.53),
(48, 48, '2023-08-17', 4799.52),
(49, 49, '2023-08-18', 4899.51),
(50, 50, '2023-08-19', 4999.50),
(51, 1, '2023-08-20', 5099.49),
(52, 2, '2023-08-21', 5199.48),
(53, 3, '2023-08-22', 5299.47),
(54, 4, '2023-08-23', 5399.46),
(55, 5, '2023-08-24', 5499.45),
(56, 6, '2023-08-25', 5599.44),
(57, 7, '2023-08-26', 5699.43),
(58, 8, '2023-08-27', 5799.42),
(59, 9, '2023-08-28', 5899.41),
(60, 10, '2023-08-29', 5999.40),
(61, 11, '2023-08-30', 6099.39),
(62, 12, '2023-08-31', 6199.38),
(63, 13, '2023-09-01', 6299.37),
(64, 14, '2023-09-02', 6399.36),
(65, 15, '2023-09-03', 6499.35),
(66, 16, '2023-09-04', 6599.34),
(67, 17, '2023-09-05', 6699.33),
(68, 18, '2023-09-06', 6799.32),
(69, 19, '2023-09-07', 6899.31),
(70, 20, '2023-09-08', 6999.30),
(71, 21, '2023-09-09', 7099.29),
(72, 22, '2023-09-10', 7199.28),
(73, 23, '2023-09-11', 7299.27),
(74, 24, '2023-09-12', 7399.26),
(75, 25, '2023-09-13', 7499.25),
(76, 26, '2023-09-14', 7599.24),
(77, 27, '2023-09-15', 7699.23),
(78, 28, '2023-09-16', 7799.22),
(79, 29, '2023-09-17', 7899.21),
(80, 30, '2023-09-18', 7999.20),
(81, 1, '2023-09-19', 8099.19),
(82, 2, '2023-09-20', 8199.18),
(83, 3, '2023-09-21', 8299.17),
(84, 4, '2023-09-22', 8399.16),
(85, 5, '2023-09-23', 8499.15),
(86, 6, '2023-09-24', 8599.14),
(87, 7, '2023-09-25', 8699.13),
(88, 8, '2023-09-26', 8799.12),
(89, 9, '2023-09-27', 8899.11),
(90, 10, '2023-09-28', 8999.10),
(91, 11, '2023-09-29', 9099.09),
(92, 12, '2023-09-30', 9199.08),
(93, 13, '2023-10-01', 9299.07),
(94, 14, '2023-10-02', 9399.06),
(95, 15, '2023-10-03', 9499.05),
(96, 16, '2023-10-04', 9599.04),
(97, 17, '2023-10-05', 9699.03),
(98, 18, '2023-10-06', 9799.02),
(99, 19, '2023-10-07', 9899.01),
(100, 20, '2023-10-08', 9999.00);

-- Insert Sample Data for OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1, 999.99),
(2, 1, 2, 1, 199.99),
(3, 2, 3, 2, 9.99),
(4, 3, 4, 3, 19.99),
(5, 4, 5, 1, 49.99),
(6, 5, 6, 4, 24.99),
(7, 6, 7, 2, 29.99),
(8, 7, 8, 3, 15.99),
(9, 8, 9, 2, 9.99),
(10, 9, 10, 1, 699.99),
(11, 10, 11, 1, 399.99),
(12, 11, 12, 2, 19.99),
(13, 12, 13, 1, 49.99),
(14, 13, 14, 3, 79.99),
(15, 14, 15, 1, 99.99),
(16, 15, 16, 4, 14.99),
(17, 16, 17, 2, 39.99),
(18, 17, 18, 3, 29.99),
(19, 18, 19, 2, 199.99),
(20, 19, 20, 1, 129.99),
(21, 20, 1, 1, 999.99),
(22, 21, 2, 1, 199.99),
(23, 22, 3, 2, 9.99),
(24, 23, 4, 3, 19.99),
(25, 24, 5, 1, 49.99),
(26, 25, 6, 4, 24.99),
(27, 26, 7, 2, 29.99),
(28, 27, 8, 3, 15.99),
(29, 28, 9, 2, 9.99),
(30, 29, 10, 1, 699.99),
(31, 30, 11, 1, 399.99),
(32, 31, 12, 2, 19.99),
(33, 32, 13, 1, 49.99),
(34, 33, 14, 3, 79.99),
(35, 34, 15, 1, 99.99),
(36, 35, 16, 4, 14.99),
(37, 36, 17, 2, 39.99),
(38, 37, 18, 3, 29.99),
(39, 38, 19, 2, 199.99),
(40, 39, 20, 1, 129.99),
(41, 40, 1, 1, 999.99),
(42, 41, 2, 1, 199.99),
(43, 42, 3, 2, 9.99),
(44, 43, 4, 3, 19.99),
(45, 44, 5, 1, 49.99),
(46, 45, 6, 4, 24.99),
(47, 46, 7, 2, 29.99),
(48, 47, 8, 3, 15.99),
(49, 48, 9, 2, 9.99),
(50, 49, 10, 1, 699.99),
(51, 50, 11, 1, 399.99),
(52, 51, 12, 2, 19.99),
(53, 52, 13, 1, 49.99),
(54, 53, 14, 3, 79.99),
(55, 54, 15, 1, 99.99),
(56, 55, 16, 4, 14.99),
(57, 56, 17, 2, 39.99),
(58, 57, 18, 3, 29.99),
(59, 58, 19, 2, 199.99),
(60, 59, 20, 1, 129.99),
(61, 60, 1, 1, 999.99),
(62, 61, 2, 1, 199.99),
(63, 62, 3, 2, 9.99),
(64, 63, 4, 3, 19.99),
(65, 64, 5, 1, 49.99),
(66, 65, 6, 4, 24.99),
(67, 66, 7, 2, 29.99),
(68, 67, 8, 3, 15.99),
(69, 68, 9, 2, 9.99),
(70, 69, 10, 1, 699.99),
(71, 70, 11, 1, 399.99),
(72, 71, 12, 2, 19.99),
(73, 72, 13, 1, 49.99),
(74, 73, 14, 3, 79.99),
(75, 74, 15, 1, 99.99),
(76, 75, 16, 4, 14.99),
(77, 76, 17, 2, 39.99),
(78, 77, 18, 3, 29.99),
(79, 78, 19, 2, 199.99),
(80, 79, 20, 1, 129.99),
(81, 80, 1, 1, 999.99),
(82, 81, 2, 1, 199.99),
(83, 82, 3, 2, 9.99),
(84, 83, 4, 3, 19.99),
(85, 84, 5, 1, 49.99),
(86, 85, 6, 4, 24.99),
(87, 86, 7, 2, 29.99),
(88, 87, 8, 3, 15.99),
(89, 88, 9, 2, 9.99),
(90, 89, 10, 1, 699.99),
(91, 90, 11, 1, 399.99),
(92, 91, 12, 2, 19.99),
(93, 92, 13, 1, 49.99),
(94, 93, 14, 3, 79.99),
(95, 94, 15, 1, 99.99),
(96, 95, 16, 4, 14.99),
(97, 96, 17, 2, 39.99),
(98, 97, 18, 3, 29.99),
(99, 98, 19, 2, 199.99),
(100, 99, 20, 1, 129.99);

-- Insert Sample Data for Reviews
INSERT INTO Reviews (ReviewID, ProductID, CustomerID, Rating, Comment, ReviewDate) VALUES
(1, 1, 1, 5, 'Great laptop!', '2023-07-05'),
(2, 2, 2, 4, 'Good sound quality.', '2023-07-06'),
(3, 3, 3, 3, 'Interesting book.', '2023-07-07'),
(4, 4, 4, 5, 'Comfortable T-shirt.', '2023-07-08'),
(5, 5, 5, 4, 'Works well.', '2023-07-09'),
(6, 6, 6, 5, 'Perfect for workouts.', '2023-07-10'),
(7, 7, 7, 4, 'Fun game for kids.', '2023-07-11'),
(8, 8, 8, 3, 'Decent quality.', '2023-07-12'),
(9, 9, 9, 5, 'Very useful.', '2023-07-13'),
(10, 10, 10, 4, 'Great phone.', '2023-07-14'),
(11, 11, 11, 3, 'Good tablet.', '2023-07-15'),
(12, 12, 12, 5, 'Excellent book.', '2023-07-16'),
(13, 13, 13, 4, 'Fits well.', '2023-07-17'),
(14, 14, 14, 5, 'Makes great coffee.', '2023-07-18'),
(15, 15, 15, 4, 'Sturdy tent.', '2023-07-19'),
(16, 16, 16, 3, 'Kids love it.', '2023-07-20'),
(17, 17, 17, 5, 'Highly recommend.', '2023-07-21'),
(18, 18, 18, 4, 'Works perfectly.', '2023-07-22'),
(19, 19, 19, 5, 'Amazing watch.', '2023-07-23'),
(20, 20, 20, 4, 'Good quality.', '2023-07-24'),
(21, 1, 21, 5, 'Excellent laptop.', '2023-07-25'),
(22, 2, 22, 4, 'Good headphones.', '2023-07-26'),
(23, 3, 23, 3, 'Nice read.', '2023-07-27'),
(24, 4, 24, 5, 'Good quality T-shirt.', '2023-07-28'),
(25, 5, 25, 4, 'Very effective.', '2023-07-29'),
(26, 6, 26, 5, 'Great for yoga.', '2023-07-30'),
(27, 7, 27, 4, 'Kids enjoy it.', '2023-07-31'),
(28, 8, 28, 3, 'Satisfactory.', '2023-08-01'),
(29, 9, 29, 5, 'Handy tool.', '2023-08-02'),
(30, 10, 30, 4, 'Love the smartphone.', '2023-08-03');

-- Insert Sample Data for Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, ContactInfo) VALUES
(1, 'Tech Supplies Co.', '123 Supplier St'),
(2, 'Books R Us', '456 Book Ln'),
(3, 'Fashion Hub', '789 Style Rd'),
(4, 'Health Mart', '101 Wellness Ave');

-- Insert Sample Data for ProductSuppliers
INSERT INTO ProductSuppliers (ProductID, SupplierID) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(3, 2),
(3, 3),
(4, 3),
(4, 4),
(5, 1),
(5, 3),
(6, 4),
(6, 2),
(7, 4),
(7, 1),
(8, 4),
(8, 3),
(9, 1),
(9, 2),
(10, 1),
(10, 4),
(11, 1),
(11, 3),
(12, 2),
(12, 3),
(13, 3),
(13, 1),
(14, 3),
(14, 2),
(15, 4),
(15, 1),
(16, 4),
(16, 2),
(17, 4),
(17, 1),
(18, 1),
(18, 4),
(19, 1),
(19, 2),
(20, 1),
(20, 3);


-- Insert Sample Data for ShippingInfo
INSERT INTO ShippingInfo (ShippingID, OrderID, ShippingAddress, ShippingDate) VALUES
(1, 1, '123 Main St', '2023-07-03'),
(2, 2, '456 Elm St', '2023-07-04'),
(3, 3, '789 Maple St', '2023-07-05'),
(4, 4, '101 Pine St', '2023-07-06'),
(5, 5, '202 Oak St', '2023-07-07'),
(6, 6, '303 Birch St', '2023-07-08'),
(7, 7, '404 Cedar St', '2023-07-09'),
(8, 8, '505 Spruce St', '2023-07-10'),
(9, 9, '606 Fir St', '2023-07-11'),
(10, 10, '707 Willow St', '2023-07-12'),
(11, 11, '808 Cherry St', '2023-07-13'),
(12, 12, '909 Aspen St', '2023-07-14'),
(13, 13, '1010 Poplar St', '2023-07-15'),
(14, 14, '1111 Dogwood St', '2023-07-16'),
(15, 15, '1212 Magnolia St', '2023-07-17'),
(16, 16, '1313 Redwood St', '2023-07-18'),
(17, 17, '1414 Cypress St', '2023-07-19'),
(18, 18, '1515 Maple St', '2023-07-20'),
(19, 19, '1616 Elm St', '2023-07-21'),
(20, 20, '1717 Oak St', '2023-07-22'),
(21, 21, '1818 Pine St', '2023-07-23'),
(22, 22, '1919 Birch St', '2023-07-24'),
(23, 23, '2020 Cedar St', '2023-07-25'),
(24, 24, '2121 Spruce St', '2023-07-26'),
(25, 25, '2222 Fir St', '2023-07-27'),
(26, 26, '2323 Willow St', '2023-07-28'),
(27, 27, '2424 Cherry St', '2023-07-29'),
(28, 28, '2525 Aspen St', '2023-07-30'),
(29, 29, '2626 Poplar St', '2023-07-31'),
(30, 30, '2727 Dogwood St', '2023-08-01'),
(31, 31, '2828 Magnolia St', '2023-08-02'),
(32, 32, '2929 Redwood St', '2023-08-03'),
(33, 33, '3030 Cypress St', '2023-08-04'),
(34, 34, '3131 Maple St', '2023-08-05'),
(35, 35, '3232 Elm St', '2023-08-06'),
(36, 36, '3333 Oak St', '2023-08-07'),
(37, 37, '3434 Pine St', '2023-08-08'),
(38, 38, '3535 Birch St', '2023-08-09'),
(39, 39, '3636 Cedar St', '2023-08-10'),
(40, 40, '3737 Spruce St', '2023-08-11'),
(41, 41, '3838 Fir St', '2023-08-12'),
(42, 42, '3939 Willow St', '2023-08-13'),
(43, 43, '4040 Cherry St', '2023-08-14'),
(44, 44, '4141 Aspen St', '2023-08-15'),
(45, 45, '4242 Poplar St', '2023-08-16'),
(46, 46, '4343 Dogwood St', '2023-08-17'),
(47, 47, '4444 Magnolia St', '2023-08-18'),
(48, 48, '4545 Redwood St', '2023-08-19'),
(49, 49, '4646 Cypress St', '2023-08-20'),
(50, 50, '4747 Maple St', '2023-08-21');

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
