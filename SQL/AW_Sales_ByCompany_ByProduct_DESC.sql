
USE AdventureWorksLT2012

SELECT c.CompanyName, p.Name, Sum(sod.LineTotal) AS SumOfLineTotal
FROM SalesLT.Product as p INNER JOIN 
(SalesLT.Customer as c INNER JOIN 
(SalesLT.SalesOrderHeader as soh INNER JOIN SalesLT.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID)
ON c.CustomerID = soh.CustomerID) 
ON p.ProductID = sod.ProductID
GROUP BY c.CompanyName, p.Name
ORDER BY Sum(sod.LineTotal) DESC;







