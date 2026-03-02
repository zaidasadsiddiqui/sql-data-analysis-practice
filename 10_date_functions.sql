-- =========================================
-- DATE FUNCTIONS
-- =========================================

-- Problem 1: Extract year, month, and quarter from order date
SELECT 
    order_id,
    order_date,
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(QUARTER FROM order_date) AS order_quarter
FROM orders_clean;

-- Problem 2: Total sales per month
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_) AS total_sales
FROM orders_clean
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- Problem 3: Total sales per year
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(sales_) AS total_sales,
    SUM(profit_) AS total_profit
FROM orders_clean
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY year;

-- Problem 4: Orders placed in last 30 days
SELECT *
FROM orders_clean
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

-- Problem 5: Delivery time in days
SELECT 
    order_id,
    ship_date - order_date AS delivery_days
FROM orders_clean;
