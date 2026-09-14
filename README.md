# Customer Summary Stored Procedure – SQL Server

## 📌 Project Overview

This project demonstrates how to create and execute a **SQL Server Stored Procedure** that generates a customer and sales summary based on a specified country.

The stored procedure performs basic **data preparation, data cleaning, aggregation, table joins, parameter handling, and error handling** using `TRY...CATCH`.

The procedure also demonstrates how SQL Server handles runtime errors and how those errors can be captured using built-in error functions such as `ERROR_MESSAGE()`, `ERROR_NUMBER()`, `ERROR_PROCEDURE()`, and `ERROR_LINE()`.

---

## 🎯 Objectives

The main objectives of this project are:

* Create a parameterized SQL Server stored procedure.
* Clean missing customer scores before generating the report.
* Calculate the total number of customers for a country.
* Calculate the average customer score.
* Calculate total orders and total sales.
* Join customer and order data using `CustomerID`.
* Implement structured error handling using `TRY...CATCH`.
* Capture and display detailed error information.
* Execute the procedure for different countries.

---

## 🗂️ Database Tables

The procedure works with two tables:

### `Sales.Customers`

| Column       | Description                |
| ------------ | -------------------------- |
| `CustomerID` | Unique customer identifier |
| `Country`    | Customer's country         |
| `Score`      | Customer score             |

### `Sales.Orders`

| Column       | Description                        |
| ------------ | ---------------------------------- |
| `OrderID`    | Unique order identifier            |
| `CustomerID` | Customer associated with the order |
| `Sales`      | Sales amount                       |

---

## 🔄 Procedure Workflow

The stored procedure follows this process:

```text
Input Country
     │
     ▼
Check for NULL Customer Scores
     │
     ├── NULL Scores Found
     │       ↓
     │   Update Scores to 0
     │
     └── No NULL Scores
             ↓
     Calculate Customer Summary
             │
             ├── Total Customers
             └── Average Score
             │
             ▼
     Join Customers + Orders
             │
             ├── Total Orders
             └── Total Sales
             │
             ▼
       Error Handling
```


This allows developers to identify:

* What went wrong
* Which procedure generated the error
* The SQL Server error number
* The line where the error occurred


> **Note:** The `1/0` statement is included only for learning and testing purposes. It should be removed from production code.

The procedure will:

1. Check for NULL scores among USA customers.
2. Replace NULL scores with `0` if they exist.
3. Calculate the total number of USA customers.
4. Calculate their average score.
5. Calculate total orders for USA customers.
6. Calculate total sales for USA customers.
7. Encounter the intentional `1/0` error.
8. Transfer execution to the `CATCH` block.
9. Print the error details.

---

## 🧩 SQL Skills Demonstrated

This project demonstrates practical knowledge of:

* SQL Server
* T-SQL
* Stored Procedures
* Input Parameters
* Default Parameters
* Variables
* `IF...ELSE`
* `IF EXISTS`
* `UPDATE`
* `COUNT()`
* `AVG()`
* `SUM()`
* `INNER JOIN`
* Aggregate Functions
* Data Cleaning
* `TRY...CATCH`
* SQL Server Error Handling
* `ERROR_MESSAGE()`
* `ERROR_NUMBER()`
* `ERROR_PROCEDURE()`
* `ERROR_LINE()`
* Debugging and Exception Handling

---

## 🚀 Possible Enhancements

The procedure can be further improved by:

* Returning the summary using a structured result set instead of `PRINT`.
* Adding date-range parameters for sales analysis.
* Adding transaction handling with `BEGIN TRANSACTION` / `ROLLBACK`.
* Logging errors into a dedicated error-log table.
* Adding validation for invalid or missing country values.
* Returning customer and sales KPIs in a single result set.
* Adding indexes on frequently filtered/joined columns such as `Country` and `CustomerID`.
* Replacing the intentional `1/0` statement with production-grade error logging.

## 👨‍💻 Author

**Sandeep Pal**

Data Analyst | SAS Developer | SQL

Skills: **SQL Server | T-SQL | SAS | SQL | Data Analytics | Data Quality | Reporting | ETL**
