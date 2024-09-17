USE AdventureWorksLT2012

SELECT 
    p.Name, 
    COUNT(sod.SalesOrderID) AS SalesOrderCount,
    CASE 
        WHEN COUNT(sod.SalesOrderID) = 0 THEN 'Yes'
        ELSE 'No'
    END AS NoSales
FROM 
    SalesLT.Product AS p 
LEFT JOIN 
    SalesLT.SalesOrderDetail AS sod 
    ON p.ProductID = sod.ProductID
GROUP BY 
    p.Name
HAVING 
    COUNT(sod.SalesOrderID) > 0
ORDER BY 
    p.Name;
