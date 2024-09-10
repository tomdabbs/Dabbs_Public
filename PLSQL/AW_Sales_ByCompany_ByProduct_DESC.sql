
SELECT c.CompanyName, p.Name, SUM(sod.LineTotal) AS SumOfLineTotal
FROM SalesOrderDetail sod
INNER JOIN SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN Product p ON sod.ProductID = p.ProductID
GROUP BY c.CompanyName, p.Name
ORDER BY SUM(sod.LineTotal) DESC;
