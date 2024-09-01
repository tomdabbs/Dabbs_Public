
SELECT 
    p."Name", 
    COUNT(sod."SalesOrderID") AS "SalesOrderCount"
FROM 
    "Product" p
LEFT JOIN 
    "SalesOrderDetail" sod 
    ON p."ProductID" = sod."ProductID"
GROUP BY 
    p."Name"
ORDER BY 
    p."Name";
