-- Step 1: Database Setup
-- Create Database
CREATE DATABASE RetailDB;
GO

USE RetailDB;
GO

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);
GO

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Address NVARCHAR(200)
);
GO

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus NVARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

-- Create Suppliers Table
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100) NOT NULL,
    ContactName NVARCHAR(100),
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);
GO

-- Step 2: Data Insertion

-- Insert Proudcts
INSERT INTO Products(ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 999.99, 50),
('Smartphone', 'Electronics', 699.99, 100),
('Headphones', 'Electronics', 199.99, 200),
('Coffee Maker', 'Appliances', 49.99, 150),
('Blender', 'Appliances', 79.99, 80),
('Tablet', 'Electronics', 399.99, 60),
('Smartwatch', 'Electronics', 149.99, 75),
('Microwave', 'Appliances', 99.99, 40),
('Refrigerator', 'Appliances', 499.99, 30),
('Toaster', 'Appliances', 29.99, 100)
GO

-- Insert Customers 
INSERT INTO Customers (FirstName, LastName, Email, Phone, [Address])
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St, Springfield'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak St, Metropolis'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', '789 Pine St, Gotham'),
('Bob', 'Brown', 'bob.brown@example.com', '444-555-6666', '101 Maple St, Star City'),
('Carol', 'Davis', 'carol.davis@example.com', '333-777-8888', '202 Birch St, Central City'),
('David', 'Miller', 'david.miller@example.com', '111-222-3333', '303 Cedar St, Coast City'),
('Emma', 'Wilson', 'emma.wilson@example.com', '444-555-6666', '404 Spruce St, Hill Valley'),
('Frank', 'Moore', 'frank.moore@example.com', '777-888-9999', '505 Willow St, Smallville'),
('Grace', 'Taylor', 'grace.taylor@example.com', '222-333-4444', '606 Redwood St, Emerald City'),
('Henry', 'Anderson', 'henry.anderson@example.com', '888-999-0000', '707 Aspen St, Riverdale')
GO

-- Insert Orders 
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus)
VALUES 
(1, '2024-07-01', 1199.97, 'Shipped'),
(2, '2024-07-02', 699.99, 'Processing'),
(3, '2024-07-03', 249.98, 'Delivered'),
(4, '2024-07-04', 129.98, 'Cancelled'),
(5, '2024-07-05', 49.99, 'Shipped'),
(6, '2024-07-06', 399.99, 'Processing'),
(7, '2024-07-07', 599.97, 'Delivered'),
(8, '2024-07-08', 99.99, 'Shipped'),
(9, '2024-07-09', 1499.97, 'Processing'),
(10, '2024-07-10', 79.99, 'Cancelled')
GO

-- Insert OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
VALUES 
(1, 1, 1, 999.99),
(1, 3, 1, 199.99),
(2, 2, 1, 699.99),
(3, 3, 2, 199.99),
(4, 4, 1, 49.99),
(4, 5, 1, 79.99),
(5, 4, 1, 49.99),
(6, 6, 1, 399.99),
(7, 2, 1, 699.99),
(7, 3, 1, 199.99),
(8, 8, 1, 99.99),
(9, 1, 1, 999.99),
(9, 7, 1, 149.99),
(9, 10, 1, 29.99),
(10, 5, 1, 79.99)
GO

-- Insert Suppliers
INSERT INTO Suppliers (SupplierName, ContactName, Phone, Email)
VALUES 
('Tech Suppliers Inc.', 'Mike Johnson', '123-456-7890', 'mike.johnson@techsuppliers.com'),
('Home Goods Ltd.', 'Sarah Wilson', '987-654-3210', 'sarah.wilson@homegoods.com'),
('Electro World', 'James Brown', '555-123-4567', 'james.brown@electroworld.com'),
('Kitchen Essentials', 'Laura Davis', '444-555-6666', 'laura.davis@kitchenessentials.com'),
('Gadget Warehouse', 'Tom Clark', '333-777-8888', 'tom.clark@gadgetwarehouse.com'),
('Office Supplies Co.', 'Nancy Harris', '222-111-3333', 'nancy.harris@officesupplies.com'),
('Sports Gear Inc.', 'Kevin Lee', '444-666-7777', 'kevin.lee@sportsgear.com'),
('Outdoor Equipment Ltd.', 'Peter Parker', '555-888-9999', 'peter.parker@outdoorequipment.com'),
('Fashion Hub', 'Sophia Green', '666-555-4444', 'sophia.green@fashionhub.com'),
('Beauty Essentials', 'Emily White', '777-666-5555', 'emily.white@beautyessentials.com')
GO

-- Step 3: Basic CRUD Operations

-- Insert Operations
-- Insert new product
INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES ('Smartwatch', 'Electronics', 199.99, 100);
GO

-- Insert new customer
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Alice', 'Williams', 'alice.w@example.com', '222-333-4444', '789 Pine Road');
GO

-- Update Operations
-- Update product price
UPDATE Products
SET Price = 899.99
WHERE ProductID = 1;
GO

-- Update customer information
UPDATE Customers
SET Email = 'john.newemail@example.com'
WHERE CustomerID = 1;
GO

-- Delete Operations
-- Delete from OrderDetails table first to avoid foreign key constraint violations
DELETE FROM OrderDetails
WHERE ProductID = 3;
GO

-- Now delete from the Products table
DELETE FROM Products
WHERE ProductID = 3;
GO

-- Delete from OrderDetails table for a specific order
DELETE FROM OrderDetails
WHERE OrderID = 2;
GO

-- Now delete the order from Orders table
DELETE FROM Orders
WHERE OrderID = 2;
GO


-- Select Operations
-- Select all products
SELECT * FROM Products;
GO

-- List all customers
SELECT * FROM Customers;
GO

-- Step 4: Advanced Queries

-- Joins
-- Retrieve order details along with product and customer information
SELECT 
    o.OrderID, o.OrderDate, o.TotalAmount, 
    c.FirstName, c.LastName, 
    p.ProductName, od.Quantity, od.UnitPrice
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;
GO

-- Subqueries
-- Find customers who have placed the most orders
SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) = (
    SELECT MAX(OrderCount)
    FROM (
        SELECT CustomerID, COUNT(OrderID) AS OrderCount
        FROM Orders
        GROUP BY CustomerID
    ) AS OrderCounts
);
GO

-- Common Table Expressions (CTEs)
-- Hierarchical query example (if applicable)
WITH OrderCTE AS (
    SELECT OrderID, CustomerID, OrderDate, TotalAmount
    FROM Orders
    WHERE OrderStatus = 'Shipped'
)
SELECT * FROM OrderCTE;
GO

-- Window Functions
-- Ranking products by sales
SELECT 
    p.ProductName, SUM(od.Quantity) AS TotalSold,
    RANK() OVER (ORDER BY SUM(od.Quantity) DESC) AS SalesRank
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;
GO

-- Step 5: Views

-- Create Views
-- View for all active orders with customer details
CREATE VIEW ActiveOrders AS
SELECT 
    o.OrderID, o.OrderDate, o.TotalAmount, o.OrderStatus,
    c.FirstName, c.LastName, c.Email
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.OrderStatus = 'Processing';
GO

-- Using Views
-- Select from view
SELECT * FROM ActiveOrders;
GO

-- Step 6: Stored Procedures

-- Create User-Defined Table Type for OrderDetails
CREATE TYPE OrderDetailsType AS TABLE (
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);
GO

-- Create Stored Procedures
-- Procedure to insert new order and update stock levels
CREATE PROCEDURE InsertOrder
    @CustomerID INT,
    @OrderDate DATE,
    @OrderDetails OrderDetailsType READONLY -- User-defined table type for order details
AS
BEGIN
    DECLARE @OrderID INT;

    -- Insert order
    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus)
    VALUES (@CustomerID, @OrderDate, (SELECT SUM(UnitPrice * Quantity) FROM @OrderDetails), 'Processing');

    SET @OrderID = SCOPE_IDENTITY();

    -- Insert order details and update stock levels
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
    SELECT @OrderID, ProductID, Quantity, UnitPrice FROM @OrderDetails;

    UPDATE Products
    SET StockQuantity = StockQuantity - od.Quantity
    FROM Products p
    JOIN @OrderDetails od ON p.ProductID = od.ProductID;
END;
GO

-- Procedure to update product information
CREATE PROCEDURE UpdateProductStock
    @ProductID INT,
    @StockAdjustment INT
AS
BEGIN
    UPDATE Products
    SET StockQuantity = StockQuantity + @StockAdjustment
    WHERE ProductID = @ProductID;
END;
GO

-- Procedure to generate sales report
CREATE PROCEDURE GenerateSalesReport
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT 
        p.Category, SUM(od.Quantity * od.UnitPrice) AS TotalSales
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE o.OrderDate BETWEEN @StartDate AND @EndDate
    GROUP BY p.Category;
END;
GO


-- Additional Advanced Queries

-- Aggregate Functions
-- Calculate total sales amount for each product
SELECT 
    p.ProductName, SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;
GO

-- Using Views
-- View active orders and their details
SELECT * FROM ActiveOrders;
GO

-- Using Stored Procedures

-- Procedure to insert new order and update stock levels
-- Define the table type for passing multiple order details
DECLARE @NewOrderDetails OrderDetailsType;
INSERT INTO @NewOrderDetails (ProductID, Quantity, UnitPrice)
VALUES (1, 2, 999.99), (2, 1, 599.99);

-- Call the stored procedure to insert the order
EXEC InsertOrder @CustomerID = 1, @OrderDate = '2024-07-14', @OrderDetails = @NewOrderDetails;
GO

-- Update product stock levels
-- Increase stock for product with ProductID 1 by 50 units
EXEC UpdateProductStock @ProductID = 1, @StockAdjustment = 50;
GO

-- Generate sales report for a specific period
-- Get sales report from 2024-07-01 to 2024-07-14
EXEC GenerateSalesReport @StartDate = '2024-07-01', @EndDate = '2024-07-14';
GO

-- Additional Error Handling and Transactions

-- Stored Procedure with Transaction Example
CREATE PROCEDURE InsertOrderWithTransaction
    @CustomerID INT,
    @OrderDate DATE,
    @OrderDetails OrderDetailsType READONLY -- User-defined table type for order details
AS
BEGIN
    BEGIN TRANSACTION;

    DECLARE @OrderID INT;

    -- Insert order
    INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, OrderStatus)
    VALUES (@CustomerID, @OrderDate, (SELECT SUM(UnitPrice * Quantity) FROM @OrderDetails), 'Processing');

    SET @OrderID = SCOPE_IDENTITY();

    -- Insert order details and update stock levels
    BEGIN TRY
        INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
        SELECT @OrderID, ProductID, Quantity, UnitPrice FROM @OrderDetails;

        UPDATE Products
        SET StockQuantity = StockQuantity - od.Quantity
        FROM Products p
        JOIN @OrderDetails od ON p.ProductID = od.ProductID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        -- Handle the error
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;
GO

-- Example call to the procedure with transaction
DECLARE @NewOrderDetailsTrans OrderDetailsType;
INSERT INTO @NewOrderDetailsTrans (ProductID, Quantity, UnitPrice)
VALUES (1, 1, 999.99), (2, 2, 599.99);

EXEC InsertOrderWithTransaction @CustomerID = 2, @OrderDate = '2024-07-14', @OrderDetails = @NewOrderDetailsTrans;
GO
