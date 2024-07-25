-- Index on OrderDate in Orders table
CREATE INDEX idx_orders_orderdate ON Orders(OrderDate);

-- Index on ProductID in OrderDetails table
CREATE INDEX idx_orderdetails_productid ON OrderDetails(ProductID);

-- Index on ProductID in Reviews table
CREATE INDEX idx_reviews_productid ON Reviews(ProductID);

-- Index on CustomerID in Orders table
CREATE INDEX idx_orders_customerid ON Orders(CustomerID);

-- Index on ProductID in Reviews table
CREATE INDEX idx_reviews_productid ON Reviews(ProductID);

