-- Average Delivery Days
SELECT
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM vw_sales_data;

-- Late Delivery Percentage
SELECT
    ROUND((
        SUM(CASE WHEN late_delivery > 0 THEN 1 ELSE 0 END)
        / COUNT(*))* 100.0,
        2
    ) AS late_delivery_percentage
FROM vw_sales_data;

-- States with Highest Delivery Delays
SELECT
    customer_state,
    ROUND(AVG(delivery_days), 2) AS avg_delivery_days
FROM vw_sales_data
GROUP BY customer_state
ORDER BY avg_delivery_days DESC;

-- Relationship Between Delays & Reviews
SELECT
    late_delivery,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM vw_sales_data
GROUP BY late_delivery;