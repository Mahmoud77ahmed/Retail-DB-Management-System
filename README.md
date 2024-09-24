# Retail Database Management System

This project is a SQL-based Retail Database Management System, designed to manage and track product inventory, customer orders, and supplier information for a fictional retail company.

## Project Overview

The system provides features to:
- Manage product information and stock levels.
- Track customer orders and order history.
- Handle supplier data and product supply details.

It includes the use of:
- SQL joins, views, and stored procedures.
- CRUD operations (Create, Read, Update, Delete).
- Advanced queries with subqueries, Common Table Expressions (CTEs), and window functions.

## Tools & Technologies
- **SQL Server Management Studio (SSMS)**
- **SQL Server**

## Database Design

### Tables
The system consists of five main tables:

- **Products**: Manages product details, categories, prices, and stock levels.
- **Customers**: Stores customer information, including order history.
- **Orders**: Tracks order details, statuses, and shipping information.
- **OrderDetails**: Records each order's product details, including quantity and price.
- **Suppliers**: Manages supplier details and their product supply information.

### Table Structure
- **Products**: `ProductID`, `ProductName`, `Category`, `Price`, `StockQuantity`
- **Customers**: `CustomerID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`
- **Orders**: `OrderID`, `CustomerID`, `OrderDate`, `TotalAmount`, `OrderStatus`
- **OrderDetails**: `OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `UnitPrice`
- **Suppliers**: `SupplierID`, `SupplierName`, `ContactName`, `Phone`, `Email`

## Key Features

### 1. CRUD Operations
The system performs basic CRUD operations such as inserting, updating, deleting, and selecting records across all tables.

- **Example**: Insert a new customer, update product prices, delete discontinued products.

### 2. Advanced Queries
Includes SQL queries using different types of joins (INNER, LEFT, RIGHT, FULL OUTER), subqueries, CTEs, and window functions.

- **Example**: Retrieve order details along with customer and product information, rank products by sales, and more.

### 3. Views
Created views for commonly accessed data such as active orders with customer details.

- **Example**: View all active orders with customer information in one query.

### 4. Stored Procedures
Stored procedures handle tasks such as adding new orders, updating stock levels, and generating sales reports.

- **Example**: A stored procedure to insert new orders and automatically update stock levels.

## Setup Instructions

1. **Database Setup**:
   - Run the script to create the `RetailDB` database.
   - Execute the SQL scripts to create the necessary tables.

2. **Data Insertion**:
   - Insert sample data into the `Products`, `Customers`, `Orders`, `OrderDetails`, and `Suppliers` tables.

3. **Executing Queries**:
   - Perform CRUD operations and execute advanced queries to fetch insights.

4. **Stored Procedures**:
   - Create stored procedures to handle order management and reporting.

## Deliverables

- SQL Scripts:
  - Database Creation
  - Data Insertion
  - CRUD Operations
  - Advanced Queries
  - Views and Stored Procedures

## Report

- **Database Design**: Explanation of table relationships and design choices.
- **Sample Data**: Overview of the sample data used.
- **Queries**: Examples and explanations of complex queries.
- **Views and Stored Procedures**: Details on their purpose and usage.
