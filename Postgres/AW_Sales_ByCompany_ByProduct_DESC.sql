-- Active: 1725218694444@@localhost@5432@AdventureWorks

SELECT 
    c."CompanyName", 
    p."Name", 
    SUM(sod."LineTotal") AS "SumOfLineTotal"
FROM 
    "Product" p
INNER JOIN 
    "SalesOrderDetail" sod ON p."ProductID" = sod."ProductID"
INNER JOIN 
    "SalesOrderHeader" soh ON sod."SalesOrderID" = soh."SalesOrderID"
INNER JOIN 
    "Customer" c ON soh."CustomerID" = c."CustomerID"
GROUP BY 
    c."CompanyName", 
    p."Name"
ORDER BY 
    "SumOfLineTotal" DESC;
