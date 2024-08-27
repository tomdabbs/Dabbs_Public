
USE AdventureWorksLT2012

SELECT SalesLT.Customer.CompanyName, SalesLT.Product.Name, Sum(SalesLT.SalesOrderDetail.LineTotal) AS SumOfLineTotal
FROM SalesLT.Product INNER JOIN (SalesLT.Customer INNER JOIN (SalesLT.SalesOrderHeader INNER JOIN SalesLT.SalesOrderDetail ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID) ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID) ON SalesLT.Product.ProductID = SalesLT.SalesOrderDetail.ProductID
GROUP BY SalesLT.Customer.CompanyName, SalesLT.Product.Name
ORDER BY Sum(SalesLT.SalesOrderDetail.LineTotal) DESC;



--See OneNote -> DABBS-SOLLUS_SQL for more details





