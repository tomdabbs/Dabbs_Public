
USE AdventureWorksLT2012

;WITH SalesData AS (
    SELECT 
        c.CompanyName,
        p.Name, 
        sod.LineTotal
    FROM 
        SalesLT.Product AS p
    INNER JOIN SalesLT.SalesOrderDetail AS sod 
        ON p.ProductID = sod.ProductID
    INNER JOIN SalesLT.SalesOrderHeader AS soh 
        ON sod.SalesOrderID = soh.SalesOrderID
    INNER JOIN SalesLT.Customer AS c 
        ON soh.CustomerID = c.CustomerID
)
SELECT 
    CompanyName, 
    Name, 
    SUM(LineTotal) AS SumOfLineTotal
FROM 
    SalesData
GROUP BY 
    CompanyName, 
    Name
ORDER BY 
    SumOfLineTotal DESC;
