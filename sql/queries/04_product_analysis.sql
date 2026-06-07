-- Top Product Categories
SELECT
    product_category_name_english,
    ROUND(SUM(payment_value), 2) AS revenue
FROM vw_sales_data
GROUP BY product_category_name_english
ORDER BY revenue DESC
LIMIT 10;

-- Most Ordered Products
SELECT
    product_id,
    COUNT(*) AS total_orders
FROM vw_sales_data
GROUP BY product_id
ORDER BY total_orders DESC
LIMIT 10;
