-- Note: This database is built on MySQL 8.2 local server.
--       The dataset is obtained from Kaggle with the title "Brazilian E-commerce Public Dataset."
--       Importing data from CSV files may result in errors.
--       The raw data needs manipulation due to any commas in columns with text types or unrecognized signs.
--	 Also with the time format, it need manipulation.

-- Create 'olist_ecommerce' Database 
CREATE DATABASE olist_ecommerce;
USE olist_ecommerce;

-- Create Table customer 
CREATE TABLE `customer` (
  `customer_id` varchar(50) NOT NULL,
  `customer_unique_id` varchar(50) NOT NULL,
  `customer_zip_code_prefix` varchar(5) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `check_5_digits` CHECK ((length(`customer_zip_code_prefix`) = 5))
) ENGINE=InnoDB;

-- Import data olist_customers_dataset.csv into customer table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_customers_dataset.csv'
INTO TABLE customer
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create table orders
CREATE TABLE `orders` (
  `order_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `order_purchase_timestamp` text,
  `order_approved_at` text,
  `order_delivered_carrier_date` text,
  `order_delivered_customer_date` text,
  `order_estimated_delivery_date` text,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB;

-- Import data olist_orders_dataset.csv into orders table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Update date type text to date time with custom format from orders table
UPDATE orders
SET order_purchase_timestamp = STR_TO_DATE(order_purchase_timestamp, '%m/%d/%y %h:%i:%s %p');

UPDATE orders
SET	order_approved_at = STR_TO_DATE(order_approved_at, '%m/%d/%y %h:%i:%s %p')
WHERE order_approved_at != '';

UPDATE orders
SET	order_delivered_carrier_date = STR_TO_DATE(order_delivered_carrier_date, '%m/%d/%y %h:%i:%s %p')
WHERE order_delivered_carrier_date != '';

UPDATE orders
SET	order_delivered_customer_date = STR_TO_DATE(order_delivered_customer_date, '%m/%d/%y %h:%i:%s %p')
WHERE order_delivered_customer_date != '';

UPDATE orders
SET	order_estimated_delivery_date = STR_TO_DATE(order_estimated_delivery_date, '%m/%d/%y %h:%i:%s %p');

--Create table order_item
CREATE TABLE `order_item` (
  `order_id` varchar(50) NOT NULL,
  `order_item_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `seller_id` varchar(50) NOT NULL,
  `shipping_limit_date` text,
  `price` float DEFAULT NULL,
  `freight_value` float DEFAULT NULL,
  PRIMARY KEY (`order_id`,`order_item_id`,`product_id`,`seller_id`)
) ENGINE=InnoDB;

-- Import data olist_order_items_dataset.csv into order_item table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_order_items_dataset.csv'
INTO TABLE order_item
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

UPDATE order_item
SET shipping_limit_date = STR_TO_DATE(shipping_limit_date, '%m/%d/%y %h:%i:%s %p');

-- Create table order_payment
CREATE TABLE `order_payment` (
  `order_id` varchar(50) DEFAULT NULL,
  `payment_sequential` int DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_installments` int DEFAULT NULL,
  `payment_value` float DEFAULT NULL
) ENGINE=InnoDB;

-- Import data olist_order_payments_dataset.csv into order_payment table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_order_payments_dataset.csv'
INTO TABLE order_payment
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create table order_review
CREATE TABLE `order_review` (
  `review_id` varchar(50) DEFAULT NULL, 
  `order_id` varchar(50) DEFAULT NULL,
  `review_score` int DEFAULT NULL,
  `review_comment_title` text,
  `review_comment_message` text,
  `review_creation_date` text,
  `review_answer_timestamp` text
) ENGINE=InnoDB;

-- Import data olist_order_reviews_dataset.csv into order_review table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_order_reviews_dataset.csv'
INTO TABLE order_payment
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

UPDATE order_item
SET review_creation_date = STR_TO_DATE(review_creation_date, '%m/%d/%y %h:%i:%s %p');

UPDATE order_item
SET review_answer_timestamp = STR_TO_DATE(review_answer_timestamp, '%m/%d/%y %h:%i:%s %p');


-- Create table products
CREATE TABLE `products` (
  `product_id` varchar(50) NOT NULL,
  `product_category_name` varchar(50) DEFAULT NULL,
  `product_name_lenght` int DEFAULT NULL,
  `product_description_lenght` int DEFAULT NULL,
  `product_photos_qty` int DEFAULT NULL,
  `product_weight_g` int DEFAULT NULL,
  `product_length_cm` int DEFAULT NULL,
  `product_height_cm` int DEFAULT NULL,
  `product_width_cm` int DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB;

-- Import data olist_products_dataset.csv into products table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS
SET
  product_name_lenght = IF(product_name_lenght = '', NULL, product_name_lenght),
  product_description_lenght = IF(product_description_lenght = '', NULL, product_description_lenght),
  product_photos_qty = IF(product_photos_qty = '', NULL, product_photos_qty),
  product_weight_g = IF(product_weight_g = '', NULL, product_weight_g),
  product_length_cm = IF(product_length_cm = '', NULL, product_length_cm),
  product_height_cm = IF(product_height_cm = '', NULL, product_height_cm),
  product_width_cm = IF(product_width_cm = '', NULL, product_width_cm);

UPDATE products
SET `product_width_cm` = IF(`product_width_cm` = '\r', NULL, `product_width_cm`);

	
-- Create table sellers
CREATE TABLE `sellers` (
  `seller_id` varchar(50) NOT NULL,
  `seller_zip_code_prefix` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `seller_city` varchar(50) DEFAULT NULL,
  `seller_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  CONSTRAINT `check_five_digits` CHECK ((length(`seller_zip_code_prefix`) = 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Import data olist_sellers_dataset.csv into sellers table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create table category_name_translation
CREATE TABLE `category_name_translation` (
  `product_category_name` varchar(50) DEFAULT NULL,
  `product_category_name_english` varchar(50) DEFAULT NULL
) ENGINE=InnoDB;

-- Import data olist_category_name_translation.scsv into category_name_translation table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/product_category_name_translation.csv'
INTO TABLE category_name_translation
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

-- Create table geolocation
CREATE TABLE `geolocation` (
  `geolocation_zip_code_prefix` varchar(5) NOT NULL,
  `geolocation_lat` double NOT NULL,
  `geolocation_lng` double NOT NULL,
  `geolocation_city` varchar(50) NOT NULL,
  `geolocation_state` varchar(20) NOT NULL,
  CONSTRAINT `check_five_digits_geo` CHECK ((length(`geolocation_zip_code_prefix`) = 5))
) ENGINE=InnoDB;

-- Import data olist_geolocation_dataset.csv into geolocation table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_geolocation_dataset.csv'
INTO TABLE category_name_translation
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
