-- =========================================
-- 01 BASIC SELECT QUERIES
-- =========================================

-- Problem 1: Retrieve all records
SELECT *
FROM orders_clean;

-- Problem 2: Retrieve customer names
SELECT customer_name
FROM orders_clean;

-- Problem 3: Show specific columns
SELECT 
    order_id, 
    customer_name, 
    product_category, 
    product_name, 
    profit_status
FROM orders_clean;
