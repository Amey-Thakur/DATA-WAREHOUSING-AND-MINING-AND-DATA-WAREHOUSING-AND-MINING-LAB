-- ============================================================================================
-- DATA WAREHOUSING AND MINING LABORATORY
-- Experiment 3: OLAP Operations Implementation
-- ============================================================================================
--
-- Author: Amey Thakur
-- GitHub: https://github.com/Amey-Thakur
-- Repository: https://github.com/Amey-Thakur/DATA-WAREHOUSING-AND-MINING-AND-DATA-WAREHOUSING-AND-MINING-LAB
-- 
-- Course: Data Warehousing and Mining Lab (CSL603)
-- Semester: VI | Institution: Terna Engineering College | University: Mumbai
-- Date: March 23, 2021
--
-- ============================================================================================
-- AIM:
-- Implementation of OLAP operations in SQL Environment for the problem statement
-- defined in the first experiment.
--
-- OLAP OPERATIONS COVERED:
-- 1. Roll-up: Aggregating data by climbing up the hierarchy
-- 2. Drill-down: Navigating from less detailed to more detailed data
-- 3. Slice: Selecting one dimension and creating a sub-cube
-- 4. Dice: Selecting multiple dimensions with specific values
-- ============================================================================================

-- ============================================================================================
-- OLAP TABLE CREATION
-- ============================================================================================
-- The OLAP table is designed to store pre-aggregated data for analytical operations.
-- This denormalized structure enables faster OLAP queries.
--
-- Fields:
-- - CUST_ID: Customer identifier (Primary key)
-- - CUST_NAME: Customer name for display purposes
-- - NO_OF_PRODUCTS: Number of products purchased (measure for aggregation)
-- - STORE_NAME: Name of the retail store
-- - STORE_LOCATION: Location/City of the store (for geographical analysis)
-- ============================================================================================

CREATE TABLE OLAP
(
    CUST_ID         NUMBER(3)       PRIMARY KEY,    -- Unique customer identifier
    CUST_NAME       VARCHAR2(20),                   -- Customer name
    NO_OF_PRODUCTS  NUMBER(3),                      -- Number of products (measure)
    STORE_NAME      VARCHAR2(54),                   -- Store name for store-level analysis
    STORE_LOCATION  VARCHAR2(25)                    -- Store location for geographical analysis
);

-- ============================================================================================
-- SAMPLE DATA INSERTION
-- ============================================================================================
-- Inserting sample customer purchase data from various stores and locations
-- This data represents customer transactions across different retail stores in Mumbai region

INSERT INTO OLAP VALUES ('1', 'ARCHIT KONDE', '2', 'Star Bazzar', 'THANE');
INSERT INTO OLAP VALUES ('2', 'SAAKSHI DEOKAR', '1', 'DMart', 'GOREGAON');
INSERT INTO OLAP VALUES ('3', 'HASAN RIZVI', '4', 'DMart', 'THANE');
INSERT INTO OLAP VALUES ('4', 'MEGA MODHA', '3', 'Big Bazaar', 'GHATKOPAR');
INSERT INTO OLAP VALUES ('5', 'MAYURESH PHANSIKAR', '2', 'DMart', 'SEAWOODS');
INSERT INTO OLAP VALUES ('6', 'INJILA HUSSAIN', '1', 'Big Bazaar', 'KURLA');
INSERT INTO OLAP VALUES ('7', 'SAURABH KILLEKAR', '2', 'Hyper City', 'THANE');
INSERT INTO OLAP VALUES ('8', 'SAKSHI KHARE', '1', 'Star Bazzar', 'GHATKOPAR');

-- Verify data insertion
SELECT * FROM OLAP;

-- ============================================================================================
-- OLAP OPERATION 1: ROLL-UP
-- ============================================================================================
-- Roll-up operation performs aggregation on data by climbing up the conceptual hierarchy.
-- It moves from detailed level to summarized level.
--
-- Example 1: Roll-up by STORE_NAME
-- Aggregates total products sold by each store (moves up from customer to store level)
-- ============================================================================================

-- Roll-up by Store Name: Total products sold per store
SELECT 
    STORE_NAME, 
    SUM(NO_OF_PRODUCTS) AS TOTALPRODUCT 
FROM OLAP 
GROUP BY STORE_NAME;

-- Expected Results:
-- STORE_NAME    | TOTALPRODUCT
-- --------------+-------------
-- Star Bazzar   | 3
-- Big Bazaar    | 4
-- DMart         | 7
-- Hyper City    | 2

-- ============================================================================================
-- Roll-up by Store Location: Total products sold per location
-- Further aggregation to location level (higher in hierarchy than store)
-- ============================================================================================

SELECT 
    STORE_LOCATION, 
    SUM(NO_OF_PRODUCTS) AS TOTALPRODUCT 
FROM OLAP 
GROUP BY STORE_LOCATION;

-- Expected Results:
-- STORE_LOCATION | TOTALPRODUCT
-- ---------------+-------------
-- THANE          | 8
-- GOREGAON       | 1
-- GHATKOPAR      | 4
-- SEAWOODS       | 2
-- KURLA          | 1

-- ============================================================================================
-- OLAP OPERATION 2: DRILL-DOWN
-- ============================================================================================
-- Drill-down operation is the reverse of roll-up.
-- It navigates from general to more detailed data.
--
-- Example: Drill-down from summary to individual customer records
-- Shows customer-level details with their product counts and locations
-- ============================================================================================

-- Drill-down to customer level details
SELECT 
    CUST_ID, 
    CUST_NAME, 
    NO_OF_PRODUCTS, 
    STORE_LOCATION 
FROM OLAP;

-- This query reveals individual customer details that were aggregated in roll-up operations
-- Each row shows a specific customer's purchase activity at their store location

-- ============================================================================================
-- OLAP OPERATION 3: SLICE
-- ============================================================================================
-- Slice operation selects one particular dimension from a given cube, creating a sub-cube.
-- It filters data based on a single dimension value.
--
-- Example: Slice by STORE_LOCATION = 'THANE'
-- Extracts all records where the store is located in Thane
-- ============================================================================================

-- Slice: Select all customers from THANE location
SELECT * 
FROM OLAP 
WHERE STORE_LOCATION = 'THANE';

-- Expected Results:
-- CUST_ID | CUST_NAME         | NO_OF_PRODUCTS | STORE_NAME   | STORE_LOCATION
-- --------+-------------------+----------------+--------------+---------------
-- 1       | ARCHIT KONDE      | 2              | Star Bazzar  | THANE
-- 3       | HASAN RIZVI       | 4              | DMart        | THANE
-- 7       | SAURABH KILLEKAR  | 2              | Hyper City   | THANE

-- ============================================================================================
-- OLAP OPERATION 4: DICE
-- ============================================================================================
-- Dice operation selects two or more dimensions from a cube and creates a sub-cube.
-- It applies multiple conditions across different dimensions.
--
-- Example: Dice by NO_OF_PRODUCTS = 2 AND STORE_LOCATION = 'THANE'
-- Filters customers who bought exactly 2 products in Thane stores
-- ============================================================================================

-- Dice: Customers with 2 products in THANE
SELECT * 
FROM OLAP 
WHERE NO_OF_PRODUCTS = 2 
  AND STORE_LOCATION = 'THANE';

-- Expected Results:
-- CUST_ID | CUST_NAME         | NO_OF_PRODUCTS | STORE_NAME   | STORE_LOCATION
-- --------+-------------------+----------------+--------------+---------------
-- 1       | ARCHIT KONDE      | 2              | Star Bazzar  | THANE
-- 7       | SAURABH KILLEKAR  | 2              | Hyper City   | THANE

-- ============================================================================================
-- ADDITIONAL OLAP OPERATIONS (For Practice)
-- ============================================================================================

-- Pivot: Cross-tabulation of data (conceptual - SQL implementation varies by database)
-- SELECT * FROM (SELECT STORE_NAME, STORE_LOCATION, NO_OF_PRODUCTS FROM OLAP)
-- PIVOT (SUM(NO_OF_PRODUCTS) FOR STORE_LOCATION IN ('THANE', 'GOREGAON', 'GHATKOPAR'));

-- Top-N Analysis: Find top customers by products purchased
SELECT CUST_NAME, NO_OF_PRODUCTS 
FROM OLAP 
ORDER BY NO_OF_PRODUCTS DESC;

-- ============================================================================================
-- CONCLUSION:
-- Successfully implemented OLAP operations (Roll-up, Drill-down, Slice, Dice) on a
-- data warehouse table. These operations enable multidimensional analysis of data
-- from various perspectives, supporting business intelligence and decision-making.
-- ============================================================================================
