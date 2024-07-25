-- Highest Stock Levels
SELECT 
    ProductName,
    StockQuantity
FROM Products
ORDER BY StockQuantity DESC
LIMIT 5;

-- Lowest Stock Levels
SELECT 
    ProductName,
    StockQuantity
FROM Products
ORDER BY StockQuantity ASC
LIMIT 5;

