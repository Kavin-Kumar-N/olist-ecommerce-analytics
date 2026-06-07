use olist_project;

create table customers (
customer_id varchar(50),
customer_unique_id varchar(50),
customer_zip_code_prefix varchar(10),
customer_city varchar(100),
customer_state char(2));

create table geolocation(
geolocation_zip_code_prefix varchar(10),
geolocation_lat decimal(12,8),
geolocation_lng decimal(12,8),
geolocation_city varchar(100),
geolocation_state char(2));

create table order_items(
order_id varchar(50),
order_item_id int,
product_id varchar(50),
seller_id varchar(50),
shipping_limit_date datetime,
price decimal(10,2),
freight_value decimal(10,2));

create table order_payments(
order_id varchar(50),
payment_sequential int,
payment_type varchar(30),
payment_installments tinyint,
payment_value decimal(10,2));

create table order_reviews(
review_id  varchar(50),
order_id  varchar(50),
review_score int,
review_comment_title  text,
review_comment_message  text,
review_creation_date datetime,
review_answer_timestamp datetime);

create table orders(
order_id  varchar(50),
customer_id  varchar(50),
order_status  varchar(20),
order_purchase_timestamp  datetime,
order_approved_at  datetime,
order_delivered_carrier_date  datetime,
order_delivered_customer_date datetime,
order_estimated_delivery_date datetime);

create table products(
product_id  varchar(50),
product_category_name  varchar(200),
product_name_lenght  smallint,
product_description_lenght  smallint,
product_photos_qty  tinyint,
product_weight_g int,
product_length_cm smallint,
product_height_cm smallint,
product_width_cm smallint);

create table sellers(
seller_id  varchar(50),
seller_zip_code_prefix varchar(10),
seller_city varchar(100),
seller_state char(2));

create table category_translation(
product_category_name varchar(100),
product_category_name_english varchar(100));

-- clean full data table structure, don't run this, used for practice, ignore this if you're doing project.
CREATE TABLE sales_data (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    payment_value DECIMAL(10,2),
    payment_type VARCHAR(30),
    review_score INT,
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_year INT,
    order_month INT,
    delivery_days INT,
    late_delivery BOOLEAN,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10),
    product_category_name_english VARCHAR(100)
);
-- ignore this for project,these are all for practice
LOAD DATA LOCAL INFILE 'D:/Datasets/clean_full_data.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;