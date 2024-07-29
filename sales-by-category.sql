SELECT 
    c.CategoryID, 
    c.CategoryName, 
    SUM(od.Quantity * p.Price) AS TotalSales
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Categories c ON p.CategoryID = c.CategoryID
GROUP BY 
    c.CategoryID, c.CategoryName
ORDER BY 
    TotalSales DESC;
