-- =========================================
-- CASE STATEMENTS
-- =========================================

-- Problem 1: Classify orders by profit status
SELECT 
    order_id,
    profit_,
    CASE 
        WHEN profit_ > 0 THEN 'Profit'
        WHEN profit_ < 0 THEN 'Loss'
        ELSE 'Break-even'
    END AS profit_status
FROM orders_clean;

-- Problem 2: Categorize orders based on sales amount
SELECT 
    order_id,
    sales_,
    CASE 
        WHEN sales_ > 2000 THEN 'High Value'
        WHEN sales_ BETWEEN 1000 AND 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS sales_category
FROM orders_clean;

-- Problem 3: Total profit and loss separately
SELECT 
    SUM(CASE WHEN profit_ > 0 THEN profit_ ELSE 0 END) AS total_profit,
    SUM(CASE WHEN profit_ < 0 THEN profit_ ELSE 0 END) AS total_loss
FROM orders_clean;

-- Problem 4: Count orders by profitability type
SELECT 
    CASE 
        WHEN profit_ > 0 THEN 'Profit'
        WHEN profit_ < 0 THEN 'Loss'
        ELSE 'Break-even'
    END AS profit_status,
    COUNT(*) AS total_orders
FROM orders_clean
GROUP BY 
    CASE 
        WHEN profit_ > 0 THEN 'Profit'
        WHEN profit_ < 0 THEN 'Loss'
        ELSE 'Break-even'
    END;

-- Problem 5: Classify customers based on total sales
SELECT 
    customer_name,
    SUM(sales_) AS total_sales,
    CASE 
        WHEN SUM(sales_) > 50000 THEN 'Premium'
        WHEN SUM(sales_) BETWEEN 20000 AND 50000 THEN 'Standard'
        ELSE 'Basic'
    END AS customer_type
FROM orders_clean
GROUP BY customer_name
ORDER BY total_sales DESC;

-- Problem 6: Tag regions based on profitability
SELECT 
    region_,
    SUM(profit_) AS total_profit,
    CASE 
        WHEN SUM(profit_) > 50000 THEN 'High Performing'
        WHEN SUM(profit_) BETWEEN 10000 AND 50000 THEN 'Moderate'
        ELSE 'Low Performing'
    END AS performance_level
FROM orders_clean
GROUP BY region_;



