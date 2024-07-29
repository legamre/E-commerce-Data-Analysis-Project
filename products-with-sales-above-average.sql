SELECT 
    p.ProductName,
    SUM(od.Quantity) AS TotalSold
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
);
