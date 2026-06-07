use olist_project;

SET GLOBAL local_infile = 1;

SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_customers_dataset.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/product_category_name_translation.csv'
INTO TABLE category_translation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_geolocation_dataset.csv'
INTO TABLE geolocation
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_order_items_dataset.csv'
INTO TABLE order_items
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_order_payments_dataset.csv'
INTO TABLE order_payments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
-- for order reviews the row count shown as a csv may not be same but the correct row count is 99224. so if this is shown then everything is good.


LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_orders_dataset.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_products_dataset.csv'
INTO TABLE products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'D:/Projects/olist-ecommerce-project/data/raw/olist_sellers_dataset.csv'
INTO TABLE sellers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

show warnings;

-- TRUNCATE TABLE customers;
-- TRUNCATE TABLE geolocation;
-- TRUNCATE TABLE order_items;
-- TRUNCATE TABLE order_payments;
-- TRUNCATE TABLE orders;
-- TRUNCATE TABLE products;
-- TRUNCATE TABLE sellers;
-- TRUNCATE TABLE order_reviews;
-- TRUNCATE TABLE category_translation;

SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'Category_trans', COUNT(*) FROM category_translation;

select * from clean_full_data;