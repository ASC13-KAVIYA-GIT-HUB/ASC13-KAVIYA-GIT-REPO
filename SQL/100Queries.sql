-- BASIC SELECT QUERIES (1-10)
SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.Product;
SELECT FirstName, LastName, EmailAddress FROM SalesLT.Customer;
SELECT Name, ListPrice FROM SalesLT.Product;
SELECT COUNT(*) AS TotalCustomers FROM SalesLT.Customer;
SELECT COUNT(*) AS TotalProducts FROM SalesLT.Product;
SELECT DISTINCT Color FROM SalesLT.Product WHERE Color IS NOT NULL;
SELECT TOP 10 Name, ListPrice FROM SalesLT.Product ORDER BY ListPrice DESC;
SELECT * FROM SalesLT.SalesOrderHeader;
SELECT Name, ProductNumber, StandardCost FROM SalesLT.Product WHERE SellEndDate IS NULL;

-- FILTERING WITH WHERE CLAUSE (11-20)
SELECT Name, ListPrice FROM SalesLT.Product WHERE ListPrice > 1000;
SELECT FirstName, LastName, CompanyName 
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City = 'Seattle';
SELECT Name, Color, ListPrice FROM SalesLT.Product WHERE Color = 'Red';
SELECT SalesOrderID, OrderDate, TotalDue FROM SalesLT.SalesOrderHeader WHERE YEAR(OrderDate) = 2008;
SELECT Name, ListPrice FROM SalesLT.Product WHERE ListPrice BETWEEN 100 AND 500;
SELECT * FROM SalesLT.Customer WHERE EmailAddress LIKE '%adventure-works.com';
SELECT * FROM SalesLT.Product WHERE Name LIKE 'Mountain%';
SELECT * FROM SalesLT.Product WHERE Color IS NULL;
SELECT * FROM SalesLT.Customer WHERE Phone IS NOT NULL;
SELECT p.* FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name IN ('Helmets', 'Gloves');

-- AGGREGATE FUNCTIONS (21-30)
SELECT AVG(ListPrice) AS AveragePrice FROM SalesLT.Product;
SELECT SUM(TotalDue) AS TotalSales FROM SalesLT.SalesOrderHeader;
SELECT MAX(ListPrice) AS MaxPrice FROM SalesLT.Product;
SELECT MIN(ListPrice) AS MinPrice FROM SalesLT.Product WHERE ListPrice > 0;
SELECT Color, COUNT(*) AS ProductCount FROM SalesLT.Product WHERE Color IS NOT NULL GROUP BY Color;
SELECT YEAR(OrderDate) AS OrderYear, AVG(TotalDue) AS AverageOrderTotal FROM SalesLT.SalesOrderHeader GROUP BY YEAR(OrderDate);
SELECT p.Name, SUM(sod.OrderQty) AS TotalUnitsSold
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name;
SELECT CustomerID, COUNT(*) AS OrdersPlaced FROM SalesLT.SalesOrderHeader GROUP BY CustomerID;
SELECT pc.Name AS CategoryName, AVG(p.ListPrice) AS AveragePrice
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name;
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, SUM(TotalDue) AS MonthlySales
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

-- JOINS (31-40)
SELECT p.Name AS ProductName, pc.Name AS CategoryName 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID;
SELECT soh.SalesOrderID, c.FirstName, c.LastName, soh.OrderDate, soh.TotalDue 
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID;
SELECT sod.SalesOrderID, p.Name, sod.OrderQty, sod.UnitPrice, sod.LineTotal 
FROM SalesLT.SalesOrderDetail sod
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;
SELECT c.FirstName, c.LastName, a.AddressLine1, a.City, a.StateProvince, a.PostalCode 
FROM SalesLT.Customer c
INNER JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
INNER JOIN SalesLT.Address a ON ca.AddressID = a.AddressID;
SELECT p.Name AS ProductName, pc.Name AS Category, pcp.Name AS ParentCategory 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
LEFT JOIN SalesLT.ProductCategory pcp ON pc.ParentProductCategoryID = pcp.ProductCategoryID;
SELECT soh.SalesOrderID, c.FirstName, c.LastName, p.Name AS ProductName, sod.OrderQty, sod.UnitPrice, sod.LineTotal
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
INNER JOIN SalesLT.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN SalesLT.Product p ON sod.ProductID = p.ProductID;
SELECT p.*
FROM SalesLT.Product p
LEFT JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
WHERE sod.ProductID IS NULL;
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalSpending
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
SELECT pm.Name AS ProductModelName, pd.Description
FROM SalesLT.ProductModel pm
INNER JOIN SalesLT.ProductModelProductDescription pmpd ON pm.ProductModelID = pmpd.ProductModelID
INNER JOIN SalesLT.ProductDescription pd ON pmpd.ProductDescriptionID = pd.ProductDescriptionID
WHERE pmpd.Culture = 'en';
SELECT soh.SalesOrderID, a.AddressLine1, a.AddressLine2, a.City, a.StateProvince, a.PostalCode, a.CountryRegion
FROM SalesLT.SalesOrderHeader soh
INNER JOIN SalesLT.Address a ON soh.ShipToAddressID = a.AddressID;

-- GROUP BY & HAVING (41-50)
SELECT pc.Name AS Category, COUNT(*) AS ProductCount 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
GROUP BY pc.Name 
HAVING COUNT(*) > 10;
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > 10000;
SELECT p.ProductID, p.Name, SUM(sod.OrderQty) AS TotalSold 
FROM SalesLT.Product p
INNER JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID 
GROUP BY p.ProductID, p.Name 
HAVING SUM(sod.OrderQty) > 100;
SELECT Color, AVG(ListPrice) AS AvgPrice, COUNT(*) AS ProductCount 
FROM SalesLT.Product 
WHERE Color IS NOT NULL 
GROUP BY Color 
HAVING AVG(ListPrice) > 500;
SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS TotalSales 
FROM SalesLT.SalesOrderHeader 
GROUP BY YEAR(OrderDate) 
HAVING SUM(TotalDue) > 1000000;
SELECT CustomerID, COUNT(*) AS OrderCount
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(*) > 3;
SELECT p.Name AS ProductName, AVG(sod.OrderQty) AS AvgOrderQty
FROM SalesLT.Product p
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY p.Name
HAVING AVG(sod.OrderQty) > 5;
SELECT a.City, COUNT(DISTINCT ca.CustomerID) AS CustomerCount
FROM SalesLT.CustomerAddress ca
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
GROUP BY a.City
HAVING COUNT(DISTINCT ca.CustomerID) > 5;
SELECT pc.Name AS CategoryName, SUM(sod.LineTotal) AS TotalSales
FROM SalesLT.Product p
JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID
JOIN SalesLT.SalesOrderDetail sod ON p.ProductID = sod.ProductID
GROUP BY pc.Name
HAVING SUM(sod.LineTotal) > 50000;
SELECT YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth, COUNT(*) AS OrderCount
FROM SalesLT.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
HAVING COUNT(*) > 50
ORDER BY OrderYear, OrderMonth;

-- SUBQUERIES (51-60)
SELECT Name, ListPrice 
FROM SalesLT.Product 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM SalesLT.Product);
SELECT CustomerID, FirstName, LastName 
FROM SalesLT.Customer 
WHERE CustomerID IN (
    SELECT CustomerID 
    FROM SalesLT.SalesOrderHeader 
    WHERE YEAR(OrderDate) = 2008
);
SELECT p.Name, p.ListPrice, pc.Name AS Category 
FROM SalesLT.Product p
INNER JOIN SalesLT.ProductCategory pc ON p.ProductCategoryID = pc.ProductCategoryID 
WHERE p.ListPrice = (
    SELECT MAX(p2.ListPrice) 
    FROM SalesLT.Product p2 
    WHERE p2.ProductCategoryID = p.ProductCategoryID
);
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases 
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID 
GROUP BY c.CustomerID, c.FirstName, c.LastName 
HAVING SUM(soh.TotalDue) > (
    SELECT AVG(CustomerTotal) 
    FROM (
        SELECT SUM(TotalDue) AS CustomerTotal 
        FROM SalesLT.SalesOrderHeader 
        GROUP BY CustomerID
    ) AS Totals
);
SELECT ProductID, Name 
FROM SalesLT.Product 
WHERE ProductID NOT IN (
    SELECT DISTINCT ProductID 
    FROM SalesLT.SalesOrderDetail
);
SELECT * FROM SalesLT.SalesOrderHeader
WHERE TotalDue > (
    SELECT AVG(TotalDue)
    FROM SalesLT.SalesOrderHeader
);
SELECT TOP 5 c.CustomerID, c.FirstName, c.LastName, SUM(soh.TotalDue) AS TotalPurchases
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalPurchases DESC;
SELECT * FROM SalesLT.Product
WHERE ProductCategoryID = (
    SELECT TOP 1 ProductCategoryID
    FROM SalesLT.Product
    GROUP BY ProductCategoryID
    ORDER BY AVG(ListPrice) DESC
);
SELECT c.*
FROM SalesLT.Customer c
JOIN SalesLT.CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
WHERE a.City IN (
    SELECT TOP 3 a.City
    FROM SalesLT.CustomerAddress ca
    JOIN SalesLT.Address a ON ca.AddressID = a.AddressID
    GROUP BY a.City
    ORDER BY COUNT(DISTINCT ca.CustomerID) DESC
);
SELECT p.*
FROM SalesLT.Product p
WHERE ListPrice > (
    SELECT AVG(ListPrice)
    FROM SalesLT.Product
    WHERE ProductCategoryID = p.ProductCategoryID
);

-- DATE & TIME FUNCTIONS (61-70)
SELECT DATENAME(WEEKDAY, OrderDate) AS DayOfWeek, COUNT(*) AS OrderCount 
FROM SalesLT.SalesOrderHeader 
GROUP BY DATENAME(WEEKDAY, OrderDate) 
ORDER BY OrderCount DESC;
SELECT SalesOrderID, OrderDate, TotalDue 
FROM SalesLT.SalesOrderHeader 
WHERE OrderDate >= DATEADD(DAY, -30, (SELECT MAX(OrderDate) FROM SalesLT.SalesOrderHeader));
SELECT Name, SellStartDate, DATEDIFF(DAY, SellStartDate, GETDATE()) AS DaysOld 
FROM SalesLT.Product 
ORDER BY DaysOld DESC;
SELECT YEAR(OrderDate) AS Year, DATEPART(QUARTER, OrderDate) AS Quarter, COUNT(*) AS OrderCount 
FROM SalesLT.SalesOrderHeader 
GROUP BY YEAR(OrderDate), DATEPART(QUARTER, OrderDate) 
ORDER BY Year, Quarter;
SELECT Name, SellStartDate 
FROM SalesLT.Product 
WHERE YEAR(SellStartDate) = 2005;
SELECT SalesOrderID, OrderDate, ShipDate,
       DATEDIFF(DAY, OrderDate, ShipDate) AS DaysToShip
FROM SalesLT.SalesOrderHeader
WHERE ShipDate IS NOT NULL;
SELECT FORMAT(OrderDate, 'yyyy-MM') AS OrderMonth,
       COUNT(*) AS OrderCount,
       SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY OrderMonth;
SELECT * FROM SalesLT.Product
WHERE SellStartDate <= GETDATE()
  AND (SellEndDate IS NULL OR SellEndDate >= GETDATE());
SELECT CustomerID,
       MIN(OrderDate) AS FirstOrderDate,
       MAX(OrderDate) AS LastOrderDate
FROM SalesLT.SalesOrderHeader
GROUP BY CustomerID;
SELECT * FROM SalesLT.Product
WHERE YEAR(SellEndDate) = 2006;

-- STRING FUNCTIONS (71-80)
SELECT CustomerID, FirstName + ' ' + LastName AS FullName FROM SalesLT.Customer;
SELECT EmailAddress, SUBSTRING(EmailAddress, CHARINDEX('@', EmailAddress) + 1, LEN(EmailAddress)) AS Domain FROM SalesLT.Customer;
SELECT UPPER(Name) AS ProductName FROM SalesLT.Product;
SELECT Name, LEN(Name) AS NameLength FROM SalesLT.Product WHERE LEN(Name) > 20;
SELECT ProductNumber, REPLACE(ProductNumber, ' ', '') AS CleanProductNumber FROM SalesLT.Product;
SELECT Name, LEFT(Name, 3) AS FirstThreeLetters FROM SalesLT.Product;

-- 1. DATA DEFINITION LANGUAGE (DDL)
CREATE DATABASE SQLWORKS2;
USE SQLWORKS2;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    "Location" VARCHAR(100)
);
ALTER TABLE Employees ADD PhoneNumber VARCHAR(15);
ALTER TABLE Employees ALTER COLUMN Email VARCHAR(150);
ALTER TABLE Employees DROP COLUMN PhoneNumber;
DROP TABLE IF EXISTS EMPLOYEES, DEPARTMENTS;

-- 2. DATA MANIPULATION LANGUAGE (DML)
INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (1, 'IT', 'New York'),
       (2, 'HR', 'Chicago'),
       (3, 'Sales', 'Los Angeles');
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES (1, 'John', 'Doe', 'john.doe@company.com', '2020-01-15', 75000.00, 1);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
VALUES 
    (2, 'Jane', 'Smith', 'jane.smith@company.com', '2019-03-20', 82000.00, 2),
    (3, 'Mike', 'Johnson', 'mike.j@company.com', '2021-06-10', 68000.00, 3),
    (4, 'Sarah', 'Williams', 'sarah.w@company.com', '2018-11-05', 95000.00, 1),
    (5, 'Tom', 'Brown', 'tom.brown@company.com', '2022-02-14', 71000.00, 2);
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
UPDATE Employees SET Salary = 78000.00 WHERE EmployeeID = 1;
UPDATE Employees SET Salary = Salary * 1.10 WHERE DepartmentID = 1;
DELETE FROM Employees WHERE EmployeeID = 5;
DELETE FROM Employees WHERE Salary < 70000;
GO;
SET IMPLICIT_TRANSACTIONS ON;
BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10000000000000000000 WHERE DepartmentID = 2;
ROLLBACK;
BEGIN TRANSACTION;
    INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, HireDate, Salary, DepartmentID)
    VALUES (8, 'TRAN', 'Davis', 'anna.d@company.com', '2023-01-10', 72000.00, 3);
    UPDATE Employees SET Salary = Salary * 10 WHERE DepartmentID = 2;
COMMIT;
GO;
SELECT * FROM EMPLOYEES;
BEGIN TRANSACTION;
    DELETE FROM Employees WHERE DepartmentID = 3;
    DELETE FROM Employees WHERE DepartmentID = 1;
ROLLBACK;

-- 3. DATA RETRIEVAL
SELECT * FROM Employees;
SELECT FirstName, LastName, Salary FROM Employees;
SELECT DISTINCT DepartmentID FROM Employees;
SELECT * FROM Employees WHERE Salary > 75000;
SELECT FirstName, LastName FROM Employees WHERE DepartmentID = 1;
SELECT * FROM Employees WHERE HireDate >= '2020-01-01';
SELECT * FROM Employees WHERE Salary BETWEEN 70000 AND 85000;
SELECT * FROM Employees WHERE DepartmentID IN (1, 2);
SELECT * FROM Employees WHERE FirstName LIKE 'J%';
SELECT * FROM Employees WHERE Email LIKE '%@company.com';
SELECT * FROM Employees WHERE Salary > 70000 AND DepartmentID = 1;
SELECT * FROM Employees WHERE DepartmentID = 1 OR DepartmentID = 3;
SELECT * FROM Employees WHERE NOT DepartmentID = 2;
SELECT * FROM Employees WHERE Email IS NOT NULL;
SELECT * FROM Employees ORDER BY Salary DESC;
SELECT FirstName, LastName, HireDate FROM Employees ORDER BY HireDate ASC;
SELECT TOP 3 * FROM Employees ORDER BY Salary DESC;
SELECT * FROM Employees ORDER BY EmployeeID OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;

-- 4. SQL FUNCTIONS
SELECT FirstName, UPPER(FirstName) AS UpperName, LOWER(LastName) AS LowerName FROM Employees;
SELECT FirstName, SUBSTRING(FirstName, 1, 3) AS ShortName FROM Employees;
SELECT FirstName, LEN(FirstName) AS NameLength FROM Employees;
SELECT CONCAT(FirstName, '                       ', LastName) AS FullName FROM Employees;
SELECT RTRIM('                       Hello World  ') AS TrimmedText;
SELECT Email, REPLACE(Email, 'company.com', 'newdomain.com') AS NewEmail FROM Employees;

SELECT Salary, ROUND(Salary, 0) AS RoundedSalary FROM Employees;
SELECT ROUND(1234.567, 0);
SELECT ROUND(1234.467, 0);
SELECT ROUND(1234.567, -1);
SELECT ROUND(1234.567, 1);
SELECT ROUND(1256.567, -2) AS 'ROUNDED VALUE';  
SELECT ROUND(-1234.567, 0);
SELECT ROUND(-1234.467, 0);
SELECT ROUND(-1234.567, -1);
SELECT ROUND(-1254.567, -2);
SELECT ROUND(-1256.567, -3) AS 'ROUNDED VALUE';  
SELECT ROUND(-1256.567, -2) AS 'ROUNDED VALUE';

SELECT FLOOR(1.2);  
SELECT CEILING (1.6);  
SELECT FLOOR(-1.2);  
SELECT CEILING (-1.6);  
SELECT CEILING (1.2);  
SELECT FLOOR(-1.8);                    
SELECT Salary, CEILING(Salary/1000) * 1000 AS CeilingSalary, FLOOR(Salary/1000) * 1000 AS FloorSalary FROM Employees;

SELECT ABS(-150) AS AbsoluteValue;
SELECT POWER(2, 3) AS PowerResult, SQRT(16) AS SquareRoot;
SELECT GETDATE() AS CurrentDateTime;

SELECT HireDate, DATEADD(YEAR, 1, HireDate) AS OneYearLater FROM Employees;
SELECT FirstName, HireDate, DATEDIFF(DAY, HireDate, GETDATE()) AS DaysEmployed FROM Employees;
SELECT HireDate, YEAR(HireDate) AS HireYear, MONTH(HireDate) AS HireMonth, DAY(HireDate) AS HireDay FROM Employees;
SELECT HireDate, FORMAT(HireDate, 'MM/dd/yyyy') AS FormattedDate FROM Employees;
SELECT Salary, CAST(Salary AS INT) AS IntSalary FROM Employees;
SELECT HireDate, CONVERT(VARCHAR, HireDate, 101) AS USDate FROM Employees;

SELECT TRY_CAST('123' AS INT) AS ValidNumber, TRY_CAST('ABC' AS INT) AS InvalidNumber;
SELECT COUNT(*) AS TotalEmployees FROM Employees;
SELECT DepartmentID, COUNT(*) AS EmployeeCount FROM Employees GROUP BY DepartmentID;
SELECT SUM(Salary) AS TotalSalary FROM Employees;
SELECT AVG(Salary) AS AverageSalary FROM Employees;
SELECT DepartmentID, AVG(Salary) AS AvgSalary FROM Employees GROUP BY DepartmentID;
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;

