EXPLAIN SELECT 
    ProductName,
    StockQuantity
FROM Products
ORDER BY StockQuantity DESC
LIMIT 5;

EXPLAIN SELECT 
    ProductName,
    StockQuantity
FROM Products
ORDER BY StockQuantity ASC
LIMIT 5;
