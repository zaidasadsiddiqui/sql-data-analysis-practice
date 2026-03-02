-- =========================================
-- SUBQUERIES
-- =========================================

-- Problem 1: Orders with sales greater than average sales
SELECT 
    order_id,
    sales_
FROM orders_clean
WHERE sales_ > (
    SELECT AVG(sales_)
    FROM orders_clean
);

-- Problem 2: Customers who placed returned orders
SELECT DISTINCT customer_name
FROM orders_clean
WHERE order_id IN (
    SELECT order_id
    FROM returns_clean
);

-- Problem 3: Orders with sales greater than average sales of their region
SELECT 
    o.order_id,
    o.region_,
    o.sales_
FROM orders_clean o
WHERE o.sales_ > (
    SELECT AVG(sales_)
    FROM orders_clean
    WHERE region_ = o.region_
);

-- Problem 4: Find the second highest sales value
SELECT MAX(sales_) AS second_highest_sales
FROM orders_clean
WHERE sales_ < (
    SELECT MAX(sales_)
    FROM orders_clean
);

-- Problem 5: Regions contributing more than 30% of total company sales
SELECT 
    region_,
    SUM(sales_) AS total_sales
FROM orders_clean
GROUP BY region_
HAVING SUM(sales_) > (
    SELECT SUM(sales_) * 0.30
    FROM orders_clean
);

-- Problem 6: Orders where sales are greater than customer's average order sales
SELECT 
    o.order_id,
    o.customer_name,
    o.sales_
FROM orders_clean o
WHERE o.sales_ > (
    SELECT AVG(sales_)
    FROM orders_clean
    WHERE customer_name = o.customer_name
);
