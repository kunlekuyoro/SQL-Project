# PROJECT GUIDE

## Copy and run the Script in the link below to create NorthWind Database on your Microsoft SQL Server:

https://raw.githubusercontent.com/microsoft/sql-server- samples/master/samples/databases/northwind-pubs/instnwnd.sql

## Schema link:
https://documentation.red-gate.com/dms6/data-masker-help/sample-masking-sets-and- databases/an-er-diagram-for-the-northwind-sample-database.

# SQL Questions:
1. Write a script to display CategoryName and Description from the categories table, sort your output by CategoryName.

2. Write a script to display ContactName, CompanyName, ContactTitle and Phone number from the customers table, sort your output by Phone.

3. Write a script to output a unique list of customers across customers and suppliers tables. Display Customername, Contactname and City. Sort your outcome by Customername Desc.

4. Write a script to output Total, Average, Min and Max Freight by ShipCountry, order by Maximum freight desc.

5. For each product, display the Total sales amount (including discount), order by the highest sales amount.


# Solution (Queries)

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
