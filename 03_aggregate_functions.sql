-- =========================================
-- AGGREGATE FUNCTIONS
-- =========================================
-- COUNT() --

-- Problem 1: Total number of orders
SELECT COUNT(*) AS total_orders
FROM orders_clean;

-- Problem 2: Count orders with profit recorded
SELECT COUNT(profit_) AS profit_records
FROM orders_clean;

-- SUM() --

-- Problem 3: Total sales
SELECT SUM(sales_) AS total_sales
FROM orders_clean;

-- Problem 4: Total profit
SELECT SUM(profit_) AS total_profit
FROM orders_clean;

-- AVG() --

-- Problem 5: Average sales per order
SELECT AVG(sales_) AS avg_sales
FROM orders_clean;

--MIN() and MAX() --

-- Problem 6: Minimum and Maximum sales value
SELECT 
MIN(sales_) AS min_sales,
MAX(sales_) AS max_sales
FROM orders_clean;

-- BASIC GROUP AGGREGATION --

-- Problem 7: Total sales by region
SELECT 
region_,
SUM(sales_) AS total_sales
FROM orders_clean
GROUP BY region_;

-- Problem 8: Average profit by category
SELECT 
product_category,
AVG(profit_) AS avg_profit
FROM orders_clean
GROUP BY product_category;

-- FILTERING AGGREGATED DATA --

-- Problem 9: Regions with total sales greater than 100000
SELECT 
region_,
SUM(sales_) AS total_sales
FROM orders_clean
GROUP BY region_
HAVING SUM(sales_) > 100000;

-- Problem 10: Total unique customers
SELECT COUNT(DISTINCT customer_name) AS unique_customers
FROM orders_clean;
