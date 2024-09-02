USE AdventureWorksLT2012

SELECT SalesLT.Product.Name, Count(SalesLT.SalesOrderDetail.SalesOrderID) AS SalesOrderCount
FROM SalesLT.Product LEFT JOIN SalesLT.SalesOrderDetail ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
GROUP BY SalesLT.Product.Name
ORDER BY SalesLT.Product.Name;
