SELECT 
    DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month, 
    COUNT(o.OrderID) AS NumberOfOrders, 
    SUM(o.TotalAmount) AS TotalSales
FROM 
    Orders o
GROUP BY 
    DATE_FORMAT(o.OrderDate, '%Y-%m')
ORDER BY 
    Month;
