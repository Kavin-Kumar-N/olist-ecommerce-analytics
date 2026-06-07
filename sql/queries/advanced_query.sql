-- Top Categories Per Year
WITH category_sales AS (
    SELECT
        order_year,
        product_category_name_english,
        SUM(payment_value) AS revenue
    FROM vw_sales_data
    GROUP BY
        order_year,
        product_category_name_english
)

SELECT
    *,
    RANK() OVER (
        PARTITION BY order_year
        ORDER BY revenue DESC
    ) AS revenue_rank
FROM category_sales;