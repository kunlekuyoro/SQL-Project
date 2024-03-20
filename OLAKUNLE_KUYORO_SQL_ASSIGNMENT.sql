---Question 1

SELECT CategoryName, Description FROM Categories ORDER BY CategoryName;


---Question 2

SELECT ContactName, CompanyName, ContactTitle, Phone AS PhoneNumber FROM Customers ORDER BY Phone;


---Question 3

SELECT DISTINCT C.CompanyName  AS Customername,C. ContactName, C.City
FROM Customers AS C 
FULL OUTER JOIN Suppliers AS S ON C.CompanyName = S.CompanyName ORDER BY Customername DESC;


---Question 4

SELECT SUM(FREIGHT) AS TOTAL, AVG(FREIGHT) AS AVERAGE, MIN(FREIGHT) AS MIN, MAX(FREIGHT) AS MAX, SHIPCOUNTRY 
FROM Orders 
GROUP BY ShipCountry
ORDER BY MAX DESC;


---Question 5

SELECT p.ProductName, SUM((o.UnitPrice * o.Quantity) * (1 - o.Discount)) AS TotalSales
FROM Products p
INNER JOIN [Order Details] o ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;

--OR

SELECT p.ProductName, SUM((o.UnitPrice * o.Quantity) - (o.UnitPrice * o.Quantity * o.Discount)) AS TotalSales
FROM Products p
INNER JOIN [Order Details] o ON p.ProductID = o.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;
