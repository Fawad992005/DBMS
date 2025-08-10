CREATE DATABASE CarShowroomDB;


CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Cars (
    CarID SERIAL PRIMARY KEY,
    Model VARCHAR(50),
    Brand VARCHAR(50),
    Year INT,
    Price NUMERIC(12,2),
    Color VARCHAR(30),
    InventoryCount INT
);

CREATE TABLE Salespersons (
    SalespersonID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    HireDate DATE
);

CREATE TABLE Sales (
    SaleID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    CarID INT REFERENCES Cars(CarID),
    SaleDate DATE,
    SalePrice NUMERIC(12,2),
    SalespersonID INT REFERENCES Salespersons(SalespersonID)
);

CREATE TABLE ServiceRecords (
    RecordID SERIAL PRIMARY KEY,
    CarID INT REFERENCES Cars(CarID),
    ServiceDate DATE,
    ServiceType VARCHAR(50),
    Cost NUMERIC(10,2),
    TechnicianID INT
);


INSERT INTO Customers (CustomerName, City, State, JoinDate) VALUES
('Alice Johnson', 'New York', 'NY', '2022-01-15'),
('Bob Smith', 'Los Angeles', 'CA', '2021-11-20'),
('Charlie Brown', 'Chicago', 'IL', '2023-03-10'),
('Diana Prince', 'Houston', 'TX', '2020-07-08'),
('Ethan Hunt', 'Phoenix', 'AZ', '2022-05-30'),
('Fiona Gallagher', 'Miami', 'FL', '2023-02-14');


INSERT INTO Cars (Model, Brand, Year, Price, Color, InventoryCount) VALUES
('Falcon X', 'MegaMotors', 2023, 80000, 'Red', 5),
('Falcon S', 'MegaMotors', 2022, 75000, 'Blue', 3),
('Falcon Z', 'MegaMotors', 2023, 90000, 'Black', 4),
('Eagle X', 'MegaMotors', 2022, 65000, 'White', 2),
('Eagle S', 'MegaMotors', 2023, 70000, 'Silver', 6),
('Eagle Z', 'MegaMotors', 2023, 72000, 'Red', 2),
('Storm', 'AutoKing', 2023, 55000, 'Blue', 7),
('Blaze', 'AutoKing', 2022, 60000, 'Black', 3),
('Racer', 'Speedster', 2021, 45000, 'Yellow', 10),
('Bolt', 'Speedster', 2023, 50000, 'Green', 8);

-- Salespersons
INSERT INTO Salespersons (Name, Department, HireDate) VALUES
('Sarah Connor', 'Luxury', '2019-06-15'),
('John Wick', 'Performance', '2020-09-01'),
('Tony Stark', 'Luxury', '2018-04-20');


INSERT INTO Sales (CustomerID, CarID, SaleDate, SalePrice, SalespersonID) VALUES

(1, 1, '2023-05-10', 80000, 1),
(2, 1, '2023-05-11', 82000, 1),
(3, 1, '2023-05-12', 81000, 1),
(4, 1, '2023-05-13', 83000, 1),
(5, 1, '2023-05-14', 82000, 1),
(6, 1, '2023-05-15', 80000, 1),
(1, 1, '2023-05-16', 81000, 1),
(2, 1, '2023-05-17', 80000, 1),
(3, 1, '2023-05-18', 82000, 1),
(4, 1, '2023-05-19', 81000, 1),
(5, 1, '2023-05-20', 80000, 1),
-- Sales for other cars
(1, 7, '2023-06-01', 55000, 2),
(2, 8, '2023-06-02', 60000, 2),
(3, 9, '2023-06-03', 45000, 3),
(4, 10, '2023-06-04', 50000, 3),

(5, 7, '2023-06-05', 55000, 2),
(6, 8, '2023-06-06', 60000, 2),
(1, 9, '2023-06-07', 45000, 3),
(2, 10, '2023-06-08', 50000, 3),
(3, 7, '2023-06-09', 55000, 2),
(4, 8, '2023-06-10', 60000, 2),
(5, 9, '2023-06-11', 45000, 3),
(6, 10, '2023-06-12', 50000, 3),
(1, 7, '2023-06-13', 55000, 2),
(2, 8, '2023-06-14', 60000, 2),
(3, 9, '2023-06-15', 45000, 3),
(4, 10, '2023-06-16', 50000, 3),
(5, 7, '2023-06-17', 55000, 2),
(6, 8, '2023-06-18', 60000, 2);

INSERT INTO ServiceRecords (CarID, ServiceDate, ServiceType, Cost, TechnicianID) VALUES
(1, '2023-07-01', 'Engine Repair', 1200, 101),
(2, '2023-07-05', 'Oil Change', 200, 102),
(3, '2023-07-07', 'Brake Replacement', 800, 103),
(4, '2023-07-09', 'Engine Repair', 1500, 101),
(5, '2023-07-11', 'Tire Rotation', 100, 104),
(6, '2023-07-13', 'Engine Repair', 1300, 101),
(7, '2023-07-15', 'Brake Replacement', 700, 103),
(8, '2023-07-17', 'Oil Change', 250, 102),
(9, '2023-07-19', 'Brake Replacement', 900, 103),
(10, '2023-07-21', 'Engine Repair', 1400, 101);



SELECT COUNT(*) AS TotalCustomers
FROM Customers;


SELECT AVG(SalePrice) AS AverageSalePrice
FROM Sales;


SELECT MAX(SalePrice) AS MostExpensiveCar
FROM Sales;


SELECT SUM(InventoryCount) AS TotalInventory
FROM Cars;

SELECT MIN(SaleDate) AS EarliestSaleDate,
       MAX(SaleDate) AS LatestSaleDate
FROM Sales;


SELECT Brand, COUNT(DISTINCT Model) AS ModelCount
FROM Cars
GROUP BY Brand;

SELECT SalespersonID, SUM(SalePrice) AS TotalSales
FROM Sales
GROUP BY SalespersonID;


SELECT CarID, AVG(SalePrice) AS AveragePrice
FROM Sales
GROUP BY CarID;


SELECT ServiceType, AVG(Cost) AS AverageServiceCost
FROM ServiceRecords
GROUP BY ServiceType;


SELECT Brand, Color, COUNT(*) AS CarCount
FROM Cars
GROUP BY Brand, Color;


SELECT Brand, COUNT(DISTINCT Model) AS ModelCount
FROM Cars
GROUP BY Brand
HAVING COUNT(DISTINCT Model) > 5;


SELECT CarID, COUNT(*) AS SaleCount
FROM Sales
GROUP BY CarID
HAVING COUNT(*) > 10;


SELECT SalespersonID, AVG(SalePrice) AS AvgSalePrice
FROM Sales
GROUP BY SalespersonID
HAVING AVG(SalePrice) > 50000;


SELECT TO_CHAR(SaleDate, 'YYYY-MM') AS SaleMonth, COUNT(*) AS SaleCount
FROM Sales
GROUP BY TO_CHAR(SaleDate, 'YYYY-MM')
HAVING COUNT(*) > 20;


SELECT ServiceType, AVG(Cost) AS AvgCost
FROM ServiceRecords
GROUP BY ServiceType
HAVING AVG(Cost) > 500;
