
USE AdventureWorksLT2012

SELECT TOP (5) 
Product1.Name AS Product1,
Product2.Name AS Product2,
Order1.ProductID AS ProductNum1,
Order2.ProductID AS ProductNum2, COUNT(*) AS pair_count
FROM SalesLT.SalesOrderDetail AS Order1 INNER JOIN
     SalesLT.SalesOrderDetail AS Order2 ON Order1.SalesOrderID = Order2.SalesOrderID AND Order1.ProductID < Order2.ProductID INNER JOIN
     SalesLT.Product AS Product1 ON Order1.ProductID = Product1.ProductID INNER JOIN
     SalesLT.Product AS Product2 ON Order2.ProductID = Product2.ProductID
GROUP BY Order1.ProductID, Order2.ProductID, Product2.Name, Product1.Name
ORDER BY pair_count DESC;

---This query is used to select the top 5 combination of products sold together.