USE AdventureWorksLT2012

SELECT p.Name, Count(sod.SalesOrderID) AS SalesOrderCount
FROM SalesLT.Product as p LEFT JOIN SalesLT.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY p.Name;
