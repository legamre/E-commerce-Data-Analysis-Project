SELECT 
    c.CustomerID, 
    c.Name, 
    AVG(o.TotalAmount) AS AvgOrderValue
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.CustomerID, c.Name
ORDER BY 
    AvgOrderValue DESC;
