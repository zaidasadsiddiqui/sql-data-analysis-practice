-- =========================================
--  JOINS
-- =========================================


-- Problem 1: Orders that were returned
SELECT 
    o.order_id,
    o.region_,
    o.sales_,
    r.status_
FROM orders_clean o
INNER JOIN returns_clean r
ON o.order_id = r.order_id;

-- Problem 2: Show all orders with return status
SELECT 
    o.order_id,
    o.sales_,
    r.order_id AS returned_order
FROM orders_clean o
LEFT JOIN returns_clean r
ON o.order_id = r.order_id;

-- Problem 3: Total sales and returned sales by region
SELECT 
    o.region_,
    SUM(o.sales_) AS total_sales,
    SUM(o.sales_) FILTER (WHERE r.order_id IS NOT NULL) AS returned_sales
FROM orders_clean o
LEFT JOIN returns_clean r
ON o.order_id = r.order_id
GROUP BY o.region_;


-- Problem 4: All returned records with order details
SELECT 
    o.order_id,
    o.sales_,
    r.status_
FROM orders_clean o
RIGHT JOIN returns_clean r
ON o.order_id = r.order_id;

-- Problem 5: Total sales by manager
SELECT 
    m.manager_,
    SUM(o.sales_) AS total_sales
FROM orders_clean o
JOIN managers_clean m
ON o.region_ = m.region_
GROUP BY m.manager_;

-- Problem 6: Return Rate by Region
SELECT o.region_,
COUNT(DISTINCT o.order_id) AS Total_orders,
COUNT(DISTINCT r.order_id) AS Returned_orders,
COUNT(DISTINCT r.order_id)::NUMERIC*100 / COUNT(DISTINCT o.order_id) AS Return_Rate
FROM orders_clean o
LEFT JOIN returns_clean r
ON o.order_id =r.order_id
GROUP BY o.region_
ORDER BY Return_rate DESC;

-- Problem 7: Customers With Most Returns
SELECT
o.customer_name,
COUNT(DISTINCT o.order_id) AS Returned_orders,
SUM(o.sales_)  AS Total_Returned_sales
FROM orders_clean o
INNER JOIN returns_clean r
On o.order_id = r.order_id
GROUP BY o.customer_name
ORDER BY Returned_orders DESC
LIMIT 10;

-- Problem 8: Net Profit After Returns by Region
SELECT o.region_,
SUM(o.sales_) AS Total_sales,
SUM(o.profit_) AS Total_Profit,
COALESCE (SUM(o.profit_) FILTER(WHERE r.order_id IS NOT NULL),0) AS Total_profit_from_returns,
SUM(o.profit_) - COALESCE (SUM(o.profit_) FILTER(WHERE r.order_id IS NOT NULL),0) AS Net_Profit
FROM orders_clean o
LEFT JOIN returns_clean r
ON o.order_id = r.order_id
GROUP BY o.region_
ORDER BY Net_Profit DESC;
