LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/coba3.csv'
INTO TABLE order_review
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

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


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;
	
	
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

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

UPDATE products
SET `product_width_cm` = IF(`product_width_cm` = '\r', NULL, `product_width_cm`);

ALTER TABLE products
MODIFY product_name_lenght INT,
modify product_description_lenght INT,
MODIFY product_photos_qty INT,
MODIFY product_weight_g INT,
MODIFY product_length_cm INT,
MODIFY product_height_cm INT,
MODIFY product_width_cm INT;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/product_category_name_translation.csv'
INTO TABLE category_name_translation
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

ALTER TABLE sellers
MODIFY seller_zip_code_prefix TEXT;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ';'
IGNORE 1 ROWS;

UPDATE sellers
SET seller_zip_code_prefix = LPAD(seller_zip_code_prefix, 5, '0');

ALTER TABLE sellers
ADD CONSTRAINT check_five_digits
CHECK (LENGTH(seller_zip_code_prefix) = 5);


ALTER TABLE geolocation
MODIFY geolocation_zip_code_prefix VARCHAR(5);

UPDATE geolocation
SET geolocation_zip_code_prefix = LPAD(geolocation_zip_code_prefix, 5, '0');

ALTER TABLE customer
ADD CONSTRAINT check_5_digits
CHECK (LENGTH(customer_zip_code_prefix) = 5);

ALTER TABLE order_item
ADD PRIMARY KEY (order_id, order_item_id, product_id, seller_id);

alter TABLE order_payment
add PRIMARY KEY (order_id); 
