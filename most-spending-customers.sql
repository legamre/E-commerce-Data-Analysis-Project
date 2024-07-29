SELECT 
    c.CustomerID, 
    c.Name, 
    SUM(o.TotalAmount) AS TotalSpent
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, c.Name
ORDER BY 
    TotalSpent DESC
LIMIT 10;
