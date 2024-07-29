CREATE INDEX idx_orders_orderdate ON Orders(OrderDate);

CREATE INDEX idx_orderdetails_productid ON OrderDetails(ProductID);

CREATE INDEX idx_reviews_productid ON Reviews(ProductID);

CREATE INDEX idx_orders_customerid ON Orders(CustomerID);

CREATE INDEX idx_reviews_productid ON Reviews(ProductID);
