
USE AdventureWorksLT2012

SELECT TOP 3
    o1.ProductID AS Product1, 
    o2.ProductID AS Product2, 
    COUNT(*) AS pair_count
FROM SalesLT.SalesOrderDetail o1
JOIN SalesLT.SalesOrderDetail o2 ON o1.SalesOrderID = o2.SalesOrderID AND o1.ProductID < o2.ProductID
GROUP BY o1.ProductID, o2.ProductID
ORDER BY pair_count DESC;


