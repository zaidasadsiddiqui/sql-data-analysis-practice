-- =========================================
--  GROUP BY & HAVING
-- =========================================

-- Problem 1: Sales, Profit, and Orders count by Region
SELECT 
    region_,
    COUNT(order_id) AS total_orders,
    SUM(sales_) AS total_sales,
    SUM(profit_) AS total_profit
FROM orders_clean
GROUP BY region_;

-- Problem 2: Sales by Region and Category
SELECT 
    region_,
    product_category,
    SUM(sales_) AS total_sales
FROM orders_clean
GROUP BY region_, product_category;

-- Problem 3: Categories with total profit greater than 50000
SELECT 
    product_category,
    SUM(profit_) AS total_profit
FROM orders_clean
GROUP BY product_category
HAVING SUM(profit_) > 50000;

-- Problem 4: Customers who placed more than 5 orders
SELECT 
    customer_name,
    COUNT(order_id) AS total_orders
FROM orders_clean
GROUP BY customer_name
HAVING COUNT(order_id) > 5;

-- Problem 5: Regions with high sales sorted by total sales
SELECT 
    region_,
    SUM(sales_) AS total_sales
FROM orders_clean
GROUP BY region_
HAVING SUM(sales_) > 100000
ORDER BY total_sales DESC;

-- Problem 6: Average sales per customer by region
SELECT 
    region_,
    AVG(sales_) AS avg_sales
FROM orders_clean
GROUP BY region_;

-- Problem 7: Shipping mode and progit analysis
SELECT ship_mode,
AVG(shipping_cost) AS Avg_shipping_cost,
AVG(delivery_days) AS Avg_delivery_days,
SUM(profit_) AS total_profit
FROM orders_clean
GROUP BY ship_mode
ORDER BY total_profit ASC; 
