-- Total Revenue
USE olist_project;

SELECT
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM vw_sales_data;

-- Total Orders
SELECT
    COUNT(DISTINCT order_id) AS total_orders
FROM vw_sales_data;

-- Average Order Value
SELECT
    ROUND(
        SUM(payment_value)
        / COUNT(DISTINCT order_id),
        2
    ) AS avg_order_value
FROM vw_sales_data;

-- Monthly Revenue Trend
SELECT
    order_year,
    order_month,
    ROUND(SUM(payment_value), 2) AS monthly_revenue
FROM vw_sales_data
GROUP BY
    order_year,
    order_month
ORDER BY
    order_year,
    order_month;