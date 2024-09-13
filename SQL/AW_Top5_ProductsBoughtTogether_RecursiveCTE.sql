
USE AdventureWorksLT2012

WITH RecursiveProductPairs AS (
    SELECT 
        Customer.CompanyName AS CustomerName,
        Product1.Name AS Product1,
        Product2.Name AS Product2,
        Order1.ProductID AS ProductNum1,
        Order2.ProductID AS ProductNum2,
        COUNT(*) AS pair_count
    FROM SalesLT.SalesOrderDetail AS Order1 
    INNER JOIN SalesLT.Customer AS Customer
        ON Order1.CustomerID = Customer.CustomerID
    INNER JOIN SalesLT.SalesOrderDetail AS Order2 
        ON Order1.SalesOrderID = Order2.SalesOrderID 
        AND Order1.ProductID < Order2.ProductID 
    INNER JOIN SalesLT.Product AS Product1 
        ON Order1.ProductID = Product1.ProductID 
    INNER JOIN SalesLT.Product AS Product2 
        ON Order2.ProductID = Product2.ProductID

    GROUP BY 
        Customer.CustomerID,
        Order1.ProductID, 
        Order2.ProductID, 
        Product2.Name, 
        Product1.Name

    UNION ALL

    SELECT 
        RecursiveProductPairs.CustomerName,
        Product1.Name AS Product1,
        Product2.Name AS Product2,
        Order1.ProductID AS ProductNum1,
        Order2.ProductID AS ProductNum2,
        COUNT(*) AS pair_count
    FROM RecursiveProductPairs
    INNER JOIN SalesLT.SalesOrderDetail AS Order1 
        ON RecursiveProductPairs.ProductNum1 = Order1.ProductID 
    INNER JOIN SalesLT.SalesOrderDetail AS Order2 
        ON RecursiveProductPairs.ProductNum2 = Order2.ProductID 
    INNER JOIN SalesLT.Product AS Product1 
        ON Order1.ProductID = Product1.ProductID 
    INNER JOIN SalesLT.Product AS Product2 
        ON Order2.ProductID = Product2.ProductID
    GROUP BY 
        RecursiveProductPairs.CustomerName,
        Order1.ProductID, 
        Order2.ProductID, 
        Product2.Name, 
        Product1.Name
)

SELECT TOP (5)
    CustomerName,
    Product1, 
    Product2, 
    ProductNum1, 
    ProductNum2, 
    pair_count
FROM RecursiveProductPairs
ORDER BY pair_count DESC;
