EXPLAIN SELECT 
    p.ProductName,
    AVG(r.Rating) AS AverageRating
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AverageRating DESC;
