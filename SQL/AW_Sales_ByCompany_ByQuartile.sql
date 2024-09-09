USE AdventureWorksLT2012

SELECT 
	c.CompanyName AS CompanyName,
	Sum(sod.LineTotal),
	NTILE(4) OVER(ORDER BY Sum(sod.LineTotal) DESC) AS Quartile
FROM   SalesLT.Customer AS c INNER JOIN
             SalesLT.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID INNER JOIN
             SalesLT.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY CompanyName;