-- =========================================
-- WINDOW FUNCTIONS
-- =========================================

-- Problem 1: Rank orders by sales within each region
SELECT 
    order_id,
    region_,
    sales_,
    ROW_NUMBER() OVER (
        PARTITION BY region_
        ORDER BY sales_ DESC
    ) AS sales_rank
FROM orders_clean;

-- Problem 2: Rank customers by total sales
SELECT 
    customer_name,
    SUM(sales_) AS total_sales,
    DENSE_RANK() OVER (ORDER BY SUM(sales_) DESC) AS rank_position
FROM orders_clean
GROUP BY customer_name;

-- Problem 3: Running total of sales within each region
SELECT 
    region_,
    order_date,
    sales_,
    SUM(sales_) OVER (
        PARTITION BY region_
        ORDER BY order_date
    ) AS regional_running_total
FROM orders_clean;

-- Problem 4: Percentage contribution of each order within its region
SELECT 
    order_id,
    region_,
    sales_,
    ROUND(
        sales_ * 100.0 / SUM(sales_) OVER (PARTITION BY region_),
        2
    ) AS region_sales_percentage
FROM orders_clean;

