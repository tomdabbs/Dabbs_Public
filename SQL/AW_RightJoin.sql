USE AdventureWorksLT2012

SELECT SalesLT.Product.Name, Count(SalesLT.SalesOrderDetail.SalesOrderID) AS SalesOrderCount
FROM SalesLT.SalesOrderDetail RIGHT JOIN SalesLT.Product ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
GROUP BY SalesLT.Product.Name
ORDER BY SalesLT.Product.Name;
