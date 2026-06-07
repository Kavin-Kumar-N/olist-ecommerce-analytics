use olist_project;

create or replace view vw_sales_data AS
SELECT
    order_id,
    customer_id,
    product_id,
    seller_id,
    price,
    freight_value,
    payment_value,
    payment_type,
    review_score,
    order_status,
    order_purchase_timestamp,
    order_year,
    order_month,
    delivery_days,
    late_delivery,
    customer_city,
    customer_state,
    product_category_name_english
FROM clean_full_data;

