WITH ProductSales AS (
    SELECT
        p.ProductID,
        p.ProductName,
        c.CategoryName,
        SUM(od.Quantity) AS TotalSold
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY p.ProductID, p.ProductName, c.CategoryName
)
SELECT
    ProductID,
    ProductName,
    CategoryName,
    TotalSold
FROM (
    SELECT
        ps.*,
        ROW_NUMBER() OVER (PARTITION BY ps.CategoryName ORDER BY ps.TotalSold DESC) AS `Rank`
    FROM ProductSales ps
) AS RankedProducts
WHERE `Rank` <= 3;
