SELECT 
    OrderCount, 
    COUNT(CustomerID) AS NumberOfCustomers
FROM (
    SELECT 
        CustomerID, 
        COUNT(OrderID) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) AS CustomerOrderCounts
GROUP BY OrderCount;
