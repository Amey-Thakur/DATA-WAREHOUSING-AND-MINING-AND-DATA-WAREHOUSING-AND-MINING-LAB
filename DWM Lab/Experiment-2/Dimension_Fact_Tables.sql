-- ============================================================================================
-- DATA WAREHOUSING AND MINING LABORATORY
-- Experiment 2: Dimension Tables and Fact Table Implementation
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
-- AIM:
-- Implementation of all dimension tables and fact tables related to the case study 
-- mentioned in the first experiment.
--
-- OUTCOME:
-- After successful completion of this experiment, students will be able to design
-- a data warehouse with dimension modelling.
-- ============================================================================================

-- ============================================================================================
-- THEORY:
-- ============================================================================================
-- Dimensions are categories by which summarized data can be viewed. E.g., a profit summary
-- in a fact table can be viewed by a Time dimension (profit by month, quarter, year),
-- Region dimension (profit by country, state, city), Product dimension (profit for product1,
-- product2).
--
-- A fact table contains summarized numerical and historical data (facts) and a multipart
-- index composed of foreign keys from the primary keys of related dimension tables.
--
-- Dimension tables are referenced by fact tables using keys. When creating a dimension
-- table in a data warehouse, a system-generated key (surrogate key) is used to uniquely
-- identify a row in the dimension.
-- ============================================================================================

-- ============================================================================================
-- DIMENSION TABLE 1: CUSTOMER
-- ============================================================================================
-- The CUSTOMER dimension table stores information about customers who make purchases.
-- This dimension enables analysis by customer demographics such as gender.
--
-- Fields:
-- - CUSTOMER_ID: Primary key, unique identifier for each customer (VARCHAR2 for flexibility)
-- - NAME: Full name of the customer (NOT NULL constraint ensures data integrity)
-- - GENDER: Gender of the customer for demographic analysis
-- ============================================================================================

CREATE TABLE CUSTOMER
(
    CUSTOMER_ID     VARCHAR2(10)    PRIMARY KEY,    -- Unique customer identifier
    NAME            VARCHAR2(40)    NOT NULL,       -- Customer's full name
    GENDER          VARCHAR(10)                     -- Gender for demographic segmentation
);

-- Sample customer data representing various customers
INSERT INTO CUSTOMER VALUES (1, 'Archit Konde', 'MALE');
INSERT INTO CUSTOMER VALUES (2, 'Saakshi Deokar', 'FEMALE');
INSERT INTO CUSTOMER VALUES (3, 'Hasan Rizvi', 'MALE');
INSERT INTO CUSTOMER VALUES (4, 'Mega Modha', 'FEMALE');
INSERT INTO CUSTOMER VALUES (5, 'Mayuresh Phansikar', 'MALE');
INSERT INTO CUSTOMER VALUES (6, 'Injila Hussain', 'FEMALE');

-- Verify customer data
-- SELECT * FROM CUSTOMER;

-- ============================================================================================
-- DIMENSION TABLE 2: PRODUCT
-- ============================================================================================
-- The PRODUCT dimension table stores information about products available for sale.
-- This dimension enables analysis by product name and cost.
--
-- Fields:
-- - PRODUCT_ID: Primary key, unique identifier for each product
-- - PRODUCT_NAME: Name of the product (NOT NULL for data integrity)
-- - PRODUCT_COST: Price of the product in the local currency
-- ============================================================================================

CREATE TABLE PRODUCT
(
    PRODUCT_ID      VARCHAR2(10)    PRIMARY KEY,    -- Unique product identifier
    PRODUCT_NAME    VARCHAR2(40)    NOT NULL,       -- Product name
    PRODUCT_COST    VARCHAR(10)                     -- Product price
);

-- Sample product data - Chocolate/Confectionery products
INSERT INTO PRODUCT VALUES (1, 'Cadbury Dairy Milk Silk', '140');
INSERT INTO PRODUCT VALUES (2, 'Nestle Kit Kat White', '380');
INSERT INTO PRODUCT VALUES (3, 'Twix Miniature', '449');
INSERT INTO PRODUCT VALUES (4, 'Ferrero Rocher Truffles', '849');
INSERT INTO PRODUCT VALUES (5, 'Toblerone Dark Bar', '1299');
INSERT INTO PRODUCT VALUES (6, 'Galaxy Smooth Milk', '300');

-- Verify product data
-- SELECT * FROM PRODUCT;

-- ============================================================================================
-- DIMENSION TABLE 3: STORE
-- ============================================================================================
-- The STORE dimension table stores information about retail store locations.
-- This dimension enables geographical analysis of sales by store, city, and state.
--
-- Fields:
-- - STORE_ID: Primary key, unique identifier for each store
-- - STORE_NAME: Name of the retail store chain (NOT NULL)
-- - STORE_LOCATION: Specific location/mall name of the store
-- - STORE_CITY: City where the store is located
-- - STORE_STATE: State for regional analysis
-- ============================================================================================

CREATE TABLE STORE
(
    STORE_ID        VARCHAR2(10)    PRIMARY KEY,    -- Unique store identifier
    STORE_NAME      VARCHAR2(40)    NOT NULL,       -- Store chain name
    STORE_LOCATION  VARCHAR2(40),                   -- Mall/Location name
    STORE_CITY      VARCHAR2(20),                   -- City name
    STORE_STATE     VARCHAR2(20)                    -- State for regional analysis
);

-- Sample store data - Retail stores in Thane, Maharashtra
INSERT INTO STORE VALUES (1, 'Star Bazaar', 'Korum Mall', 'Thane', 'Maharashtra');
INSERT INTO STORE VALUES (2, 'DMart', 'Ghodbunder Road', 'Thane', 'Maharashtra');
INSERT INTO STORE VALUES (3, 'Big Bazaar', 'High Street Mall', 'Thane', 'Maharashtra');
INSERT INTO STORE VALUES (4, 'Reliance Fresh', 'Naupada', 'Thane', 'Maharashtra');
INSERT INTO STORE VALUES (5, 'Hyper City', 'Viviana Mall', 'Thane', 'Maharashtra');

-- Verify store data
-- SELECT * FROM STORE;

-- ============================================================================================
-- DIMENSION TABLE 4: SALESPERSON
-- ============================================================================================
-- The SALESPERSON dimension table stores information about sales employees.
-- This dimension enables analysis of sales performance by individual employees.
--
-- Fields:
-- - SALESPERSON_ID: Primary key, unique identifier for each salesperson
-- - SALESPERSON_NAME: Name of the salesperson (NOT NULL)
-- - STORE_ID: Store where the salesperson works (foreign key reference)
-- - LOCATION: Specific location within the store
-- - CITY: City of employment
-- - STATE: State for regional HR analysis
-- ============================================================================================

CREATE TABLE SALESPERSON
(
    SALESPERSON_ID      VARCHAR2(10)    PRIMARY KEY,    -- Unique salesperson identifier
    SALESPERSON_NAME    VARCHAR2(40)    NOT NULL,       -- Employee name
    STORE_ID            VARCHAR2(10),                   -- Store assignment
    LOCATION            VARCHAR(20),                    -- Location within store
    CITY                VARCHAR2(10),                   -- City of work
    STATE               VARCHAR2(20)                    -- State for regional analysis
);

-- Sample salesperson data - Employees across different stores
INSERT INTO SALESPERSON VALUES (1, 'Supreet', 1, 'Korum Mall', 'Thane', 'Maharashtra');
INSERT INTO SALESPERSON VALUES (2, 'Filly', 1, 'Korum Mall', 'Thane', 'Maharashtra');
INSERT INTO SALESPERSON VALUES (3, 'Saiganesh', 2, 'Ghodbunder Road', 'Thane', 'Maharashtra');
INSERT INTO SALESPERSON VALUES (4, 'Saurabh', 3, 'High Street Mall', 'Thane', 'Maharashtra');
INSERT INTO SALESPERSON VALUES (5, 'Sakshi', 3, 'High Street Mall', 'Thane', 'Maharashtra');
INSERT INTO SALESPERSON VALUES (6, 'Hemant', 4, 'Naupada', 'Thane', 'Maharashtra');
INSERT INTO SALESPERSON VALUES (7, 'Rutika', 5, 'Viviana Mall', 'Thane', 'Maharashtra');

-- Verify salesperson data
-- SELECT * FROM SALESPERSON;

-- ============================================================================================
-- FACT TABLE: PRODUCTSALES
-- ============================================================================================
-- The PRODUCTSALES fact table is the central table that records all sales transactions.
-- It contains foreign keys to all dimension tables and measurable facts.
--
-- This table follows the Star Schema design where:
-- - The fact table is at the center
-- - Dimension tables surround it with foreign key relationships
--
-- Fields:
-- - TRANSACTION_ID: Primary key, unique identifier for each transaction
-- - INVOICE_NO: Invoice number for the transaction
-- - TOTAL_AMOUNT: Total sale amount (measure/fact)
-- - CUSTOMER_ID: Foreign key referencing CUSTOMER dimension
-- - PRODUCT_ID: Foreign key referencing PRODUCT dimension
-- - STORE_ID: Foreign key referencing STORE dimension
-- - SALESPERSON_ID: Foreign key referencing SALESPERSON dimension
-- ============================================================================================

CREATE TABLE PRODUCTSALES
(
    TRANSACTION_ID      VARCHAR2(20)    PRIMARY KEY,    -- Unique transaction identifier
    INVOICE_NO          VARCHAR2(10),                   -- Invoice reference number
    TOTAL_AMOUNT        VARCHAR2(10),                   -- Total sale amount (measure)
    CUSTOMER_ID         VARCHAR2(10)    REFERENCES CUSTOMER(CUSTOMER_ID),       -- FK to Customer
    PRODUCT_ID          VARCHAR2(10)    REFERENCES PRODUCT(PRODUCT_ID),         -- FK to Product
    STORE_ID            VARCHAR2(10)    REFERENCES STORE(STORE_ID),             -- FK to Store
    SALESPERSON_ID      VARCHAR2(10)    REFERENCES SALESPERSON(SALESPERSON_ID)  -- FK to Salesperson
);

-- Sample transaction data
INSERT INTO PRODUCTSALES VALUES ('1', '501', '1678', '4', '3', '5', '2');

-- Verify fact table data
-- SELECT * FROM PRODUCTSALES;

-- ============================================================================================
-- SAMPLE ANALYTICAL QUERIES
-- ============================================================================================
-- 
-- 1. View all sales with customer details:
--    SELECT PS.*, C.NAME, C.GENDER
--    FROM PRODUCTSALES PS
--    JOIN CUSTOMER C ON PS.CUSTOMER_ID = C.CUSTOMER_ID;
--
-- 2. Sales by store location:
--    SELECT S.STORE_NAME, S.STORE_CITY, COUNT(*) AS TOTAL_TRANSACTIONS
--    FROM PRODUCTSALES PS
--    JOIN STORE S ON PS.STORE_ID = S.STORE_ID
--    GROUP BY S.STORE_NAME, S.STORE_CITY;
--
-- 3. Sales performance by salesperson:
--    SELECT SP.SALESPERSON_NAME, SUM(TO_NUMBER(PS.TOTAL_AMOUNT)) AS TOTAL_SALES
--    FROM PRODUCTSALES PS
--    JOIN SALESPERSON SP ON PS.SALESPERSON_ID = SP.SALESPERSON_ID
--    GROUP BY SP.SALESPERSON_NAME;
--
-- ============================================================================================

-- ============================================================================================
-- CONCLUSION:
-- The concept of a fact table and dimension tables was implemented using dimension modelling.
-- This Star Schema design enables efficient OLAP operations and analytical queries.
-- ============================================================================================
