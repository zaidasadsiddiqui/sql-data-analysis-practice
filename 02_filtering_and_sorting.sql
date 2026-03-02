-- =========================================
-- 02 FILTERING AND SORTING
-- =========================================

-- Problem 1: Show all orders where company made loss.
SELECT 
order_ID, customer_name, product_category, product_name, profit_status
FROM orders_clean
WHERE profit_status='Loss';

-- Problem 2: Retrieve orders from a specific region
SELECT *
FROM orders_clean
WHERE region_ = 'West';

-- Problem 3: Find orders with sales greater than 1000
SELECT *
FROM orders_clean
WHERE sales_ > 1000;

-- Problem 4: Orders from West region with profit greater than 500
SELECT *
FROM orders_clean
WHERE region_ = 'West'
AND profit_ > 500;

-- Problem 5: Orders with sales between 500 and 2000
SELECT *
FROM orders_clean
WHERE sales_ BETWEEN 500 AND 2000;

-- Problem 6: Orders from selected regions
SELECT *
FROM orders_clean
WHERE region_ IN ('West', 'East');

-- Problem 7: Customers whose name starts with 'A'
SELECT *
FROM orders_clean
WHERE customer_name LIKE 'A%';

-- Problem 8: Find orders with missing profit
SELECT *
FROM orders_clean
WHERE profit_ IS NULL;

-- Problem 9: Sort orders by sales descending
SELECT *
FROM orders_clean
ORDER BY sales_ DESC;

-- Problem 10: Sort by region and then by sales descending
SELECT *
FROM orders_clean
ORDER BY region_, sales_ DESC;
