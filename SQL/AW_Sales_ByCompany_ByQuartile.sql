USE AdventureWorksLT2012

SELECT 
	SalesLT.Customer.CompanyName AS CompanyName,
	Sum(SalesLT.SalesOrderDetail.LineTotal),
	NTILE(4) OVER(ORDER BY Sum(SalesLT.SalesOrderDetail.LineTotal) DESC) AS Quartile
FROM   SalesLT.Customer INNER JOIN
             SalesLT.SalesOrderHeader ON SalesLT.Customer.CustomerID = SalesLT.SalesOrderHeader.CustomerID INNER JOIN
             SalesLT.SalesOrderDetail ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID
GROUP BY CompanyName;