-- Top Sellers by Revenue
SELECT
    seller_id,
    ROUND(SUM(payment_value), 2) AS total_revenue
FROM vw_sales_data
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Seller Review Performance
SELECT
    seller_id,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM vw_sales_data
GROUP BY seller_id
ORDER BY avg_review_score DESC;