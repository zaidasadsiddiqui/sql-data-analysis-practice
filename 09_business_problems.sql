-- =========================================
-- BUSINESS PROBLEMS
-- =========================================

-- Problem 1: Net Profit After Returns by Region
SELECT 
    o.region_,
    SUM(o.sales_) AS total_sales,
    SUM(o.profit_) AS total_profit,
    SUM(o.profit_) FILTER (WHERE r.order_id IS NOT NULL) AS profit_lost_from_returns,
    SUM(o.profit_) 
        - SUM(o.profit_) FILTER (WHERE r.order_id IS NOT NULL)
        AS net_profit
FROM orders_clean o
LEFT JOIN returns_clean r
ON o.order_id = r.order_id
GROUP BY o.region_
ORDER BY net_profit DESC;

-- Problem 2: Top 3 Customers by Sales in Each Region
SELECT *
FROM (
    SELECT 
        region_,
        customer_name,
        SUM(sales_) AS total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY region_
            ORDER BY SUM(sales_) DESC
        ) AS rank_in_region
    FROM orders_clean
    GROUP BY region_, customer_name
) ranked_customers
WHERE rank_in_region <= 3;

-- Problem 3: Customer Return Rate Percentage
SELECT 
    o.customer_name,
    COUNT(o.order_id) AS total_orders,
    COUNT(r.order_id) AS returned_orders,
    ROUND(
        COUNT(r.order_id) * 100.0 / COUNT(o.order_id),
        2
    ) AS return_percentage
FROM orders_clean o
LEFT JOIN returns_clean r
ON o.order_id = r.order_id
GROUP BY o.customer_name
ORDER BY return_percentage DESC;

-- Problem 4: Region Contribution to Total Company Sales
SELECT 
    region_,
    SUM(sales_) AS total_sales,
    ROUND(
        SUM(sales_) * 100.0 
        / SUM(SUM(sales_)) OVER (),
        2
    ) AS company_sales_percentage
FROM orders_clean
GROUP BY region_
ORDER BY total_sales DESC;

