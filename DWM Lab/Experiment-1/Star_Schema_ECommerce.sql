-- ============================================================================================
-- DATA WAREHOUSING AND MINING LABORATORY
-- Experiment 1: Star Schema Implementation for E-Commerce Data Warehouse
-- ============================================================================================
--
-- Author: Amey Thakur
-- GitHub: https://github.com/Amey-Thakur
-- Repository: https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB
-- 
-- Course: Data Warehousing and Mining Lab (CSL603)
-- Semester: VI | Institution: Terna Engineering College | University: Mumbai
-- Date: February 02, 2021
--
-- ============================================================================================
-- PROBLEM STATEMENT:
-- Design a Data Warehouse for an e-commerce website and through analytical processing
-- find out the total amount of products sold in a particular period and the total sales
-- for the same.
-- ============================================================================================

-- ============================================================================================
-- STAR SCHEMA DESIGN
-- ============================================================================================
-- The Star Schema consists of:
-- 1. FACT TABLE: SALES (Central table containing measurable, quantitative data)
-- 2. DIMENSION TABLES: PRODUCTDIMENSION, TIMEDIMENSION, EMPDIMENSION
--    (Descriptive attributes related to fact data)
--
-- Star Schema Advantages:
-- - Simplified queries with fewer joins
-- - Faster aggregations due to denormalized structure
-- - Easy to understand and navigate
-- - Optimized for OLAP operations
-- ============================================================================================

-- ============================================================================================
-- FACT TABLE: SALES
-- ============================================================================================
-- The SALES table is the central fact table that stores transactional data.
-- It contains foreign keys to all dimension tables and measurable facts.
-- 
-- Fields:
-- - PRODUCTID: Foreign key linking to PRODUCTDIMENSION (which product was sold)
-- - ORDERID: Foreign key linking to TIMEDIMENSION (when the order was placed)
-- - CUSTID: Customer identifier for customer analysis
-- - EMPID: Foreign key linking to EMPDIMENSION (which employee handled the sale)
-- - DISCOUNT: Discount applied to the sale (fact/measure)
-- ============================================================================================

CREATE TABLE SALES
(
    PRODUCTID INT,      -- Foreign Key: References PRODUCTDIMENSION.PRODUCTID
    ORDERID INT,        -- Foreign Key: References TIMEDIMENSION.ORDERID
    CUSTID INT,         -- Customer identifier for segmentation analysis
    EMPID INT,          -- Foreign Key: References EMPDIMENSION.EMPID
    DISCOUNT INT        -- Discount percentage/amount applied (Measure)
);

-- ============================================================================================
-- DIMENSION TABLE: PRODUCTDIMENSION
-- ============================================================================================
-- Contains descriptive information about products sold in the e-commerce platform.
-- This dimension allows analysis by product name, category, and unit.
--
-- Fields:
-- - PRODUCTID: Primary key, unique identifier for each product
-- - PRODUCTNAME: Name of the product (max 20 characters)
-- - PRODUCTCAT: Product category for grouping (e.g., Electronics, Clothing)
-- - UNIT: Unit of measurement (e.g., Piece, Kg, Box)
-- ============================================================================================

CREATE TABLE PRODUCTDIMENSION
(
    PRODUCTID INT,              -- Primary Key: Unique product identifier
    PRODUCTNAME VARCHAR(20),    -- Name of the product
    PRODUCTCAT VARCHAR(20),     -- Product category for analysis
    UNIT VARCHAR(20)            -- Unit of measurement
);

-- ============================================================================================
-- DIMENSION TABLE: TIMEDIMENSION
-- ============================================================================================
-- Contains temporal information about orders for time-based analysis.
-- This dimension enables OLAP operations like drill-down by year, month, or specific date.
--
-- Fields:
-- - ORDERID: Primary key, unique identifier for each order
-- - ORDERDATE: Exact date when the order was placed
-- - YEAR: Year extracted for yearly aggregations
-- - MONTH: Month extracted for monthly trend analysis
-- ============================================================================================

CREATE TABLE TIMEDIMENSION
(
    ORDERID INT,            -- Primary Key: Unique order identifier
    ORDERDATE DATE,         -- Full date of order placement
    YEAR INT,               -- Year component for time-based analysis
    MONTH INT               -- Month component for seasonal analysis
);

-- ============================================================================================
-- DIMENSION TABLE: EMPDIMENSION
-- ============================================================================================
-- Contains information about employees who handle sales transactions.
-- This dimension allows analysis by employee, department, and region.
--
-- Fields:
-- - EMPID: Primary key, unique identifier for each employee
-- - EMPNAME: Name of the employee (max 20 characters)
-- - DEPARTMENT: Department where employee works (e.g., Sales, Support)
-- - REGION: Geographical region for regional sales analysis
-- ============================================================================================

CREATE TABLE EMPDIMENSION
(
    EMPID INT,                  -- Primary Key: Unique employee identifier
    EMPNAME VARCHAR(20),        -- Employee name
    DEPARTMENT VARCHAR(20),     -- Department for departmental analysis
    REGION VARCHAR(20)          -- Region for geographical analysis
);

-- ============================================================================================
-- ANALYTICAL QUERIES (OLAP Operations)
-- ============================================================================================
-- After populating the tables with data, the following queries can be used for analysis:
--
-- 1. Total products sold in a particular period:
--    SELECT COUNT(*) AS TotalProducts, T.YEAR, T.MONTH
--    FROM SALES S
--    JOIN TIMEDIMENSION T ON S.ORDERID = T.ORDERID
--    GROUP BY T.YEAR, T.MONTH;
--
-- 2. Total sales by product category:
--    SELECT P.PRODUCTCAT, COUNT(*) AS SalesCount
--    FROM SALES S
--    JOIN PRODUCTDIMENSION P ON S.PRODUCTID = P.PRODUCTID
--    GROUP BY P.PRODUCTCAT;
--
-- 3. Sales by region (Roll-up operation):
--    SELECT E.REGION, COUNT(*) AS RegionalSales
--    FROM SALES S
--    JOIN EMPDIMENSION E ON S.EMPID = E.EMPID
--    GROUP BY E.REGION;
-- ============================================================================================

-- End of Star Schema Implementation
-- ============================================================================================
