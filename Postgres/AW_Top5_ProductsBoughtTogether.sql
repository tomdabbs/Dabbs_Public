
SELECT 
    p1."Name" AS "Product1",
    p2."Name" AS "Product2",
    o1."ProductID" AS "ProductNum1",
    o2."ProductID" AS "ProductNum2", 
    COUNT(*) AS "pair_count"
FROM 
    "SalesOrderDetail" o1
INNER JOIN 
    "SalesOrderDetail" o2 
    ON o1."SalesOrderID" = o2."SalesOrderID" 
    AND o1."ProductID" < o2."ProductID"
INNER JOIN 
    "Product" p1 
    ON o1."ProductID" = p1."ProductID"
INNER JOIN 
    "Product" p2 
    ON o2."ProductID" = p2."ProductID"
GROUP BY 
    o1."ProductID", 
    o2."ProductID", 
    p1."Name", 
    p2."Name"
ORDER BY 
    "pair_count" DESC
LIMIT 5;
