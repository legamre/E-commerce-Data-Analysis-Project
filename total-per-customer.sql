WITH CustomerSales AS (
    SELECT 
        CustomerID,
        SUM(TotalAmount) AS TotalSpent
    FROM Orders
    GROUP BY CustomerID
)
SELECT 
    CustomerID,
    TotalSpent,
    RANK() OVER (ORDER BY TotalSpent DESC) AS CustomerRank
FROM CustomerSales;
