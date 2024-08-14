-- Average Rating of Products
SELECT p.ProductName, AVG(r.Rating) AS AverageRating
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;

-- Customers with Multiple Orders
SELECT OrderCount, COUNT(CustomerID) AS NumberOfCustomers
FROM (
    SELECT CustomerID, COUNT(OrderID) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) AS CustomerOrderCounts
GROUP BY OrderCount;

-- Monthly Sales Report
SELECT DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month, COUNT(o.OrderID) AS NumberOfOrders, SUM(o.TotalAmount) AS TotalSales
FROM Orders o
GROUP BY DATE_FORMAT(o.OrderDate, '%Y-%m')
ORDER BY Month;

-- Most Popular Products
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 5;

-- Customers with Biggest Orders
SELECT c.CustomerID, c.Name, SUM(o.TotalAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 10;

-- Products with Sales Above Average
SELECT p.ProductName, SUM(od.Quantity) AS TotalSold
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING SUM(od.Quantity) > (
    SELECT AVG(TotalSold)
    FROM (
        SELECT SUM(Quantity) AS TotalSold
        FROM OrderDetails
        GROUP BY ProductID
    ) AS Subquery
)

-- Sales by Category
SELECT c.CategoryID, c.CategoryName, SUM(od.Quantity * p.Price) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName
ORDER BY TotalSales DESC;

-- Stock Levels
SELECT 
    ProductName,
    StockQuantity
FROM Products
ORDER BY StockQuantity DESC

-- Most Popular Products Per Category
WITH ProductSales AS (
    SELECT p.ProductID, p.ProductName, c.CategoryName, SUM(od.Quantity) AS TotalSold
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY p.ProductID, p.ProductName, c.CategoryName
)
SELECT ProductID, ProductName, CategoryName, TotalSold
FROM (
    SELECT ps.*, ROW_NUMBER() OVER (PARTITION BY ps.CategoryName ORDER BY ps.TotalSold DESC) AS `Rank`
    FROM ProductSales ps
) AS RankedProducts
WHERE `Rank` = 1;

-- Total Sales Per Customer
WITH CustomerSales AS (
    SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
)
SELECT CustomerID, TotalSpent,
    RANK() OVER (ORDER BY TotalSpent DESC) AS CustomerRank
FROM CustomerSales;

-- Total Sales
SELECT YEAR(OrderDate) AS Year, MONTH(OrderDate) AS Month, SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;
