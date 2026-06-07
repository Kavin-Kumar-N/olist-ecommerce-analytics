-- Repeat Customers
SELECT
    customer_unique_id,
    COUNT(DISTINCT order_id) AS total_orders
FROM clean_full_data
GROUP BY customer_unique_id
HAVING total_orders > 1
ORDER BY total_orders DESC;

-- Top Customer States
SELECT
    customer_state,
    COUNT(DISTINCT order_id) AS total_orders
FROM vw_sales_data
GROUP BY customer_state
ORDER BY total_orders DESC;

-- Average Review Score by State
SELECT
    customer_state,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM vw_sales_data
GROUP BY customer_state
ORDER BY avg_review_score DESC;

