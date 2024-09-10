
SELECT 
    c.CompanyName AS CompanyName,
    SUM(sod.LineTotal) AS TotalLineAmount,
    NTILE(4) OVER(ORDER BY SUM(sod.LineTotal) DESC) AS Quartile
FROM 
    Customer c
INNER JOIN 
    SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
INNER JOIN 
    SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY 
    c.CompanyName;
