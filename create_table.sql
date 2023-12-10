CREATE TABLE `customer` (
  `customer_id` varchar(50) NOT NULL,
  `customer_unique_id` varchar(50) NOT NULL,
  `customer_zip_code_prefix` varchar(5) DEFAULT NULL,
  `customer_city` varchar(50) DEFAULT NULL,
  `customer_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_zip_code` (`customer_zip_code_prefix`),
  CONSTRAINT `fk_customer_zip_code` FOREIGN KEY (`customer_zip_code_prefix`) REFERENCES `geo_seller_cust` (`combined_zip_code_prefix`),
  CONSTRAINT `check_5_digits` CHECK ((length(`customer_zip_code_prefix`) = 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `orders` (
  `order_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT NULL,
  `order_purchase_timestamp` text,
  `order_approved_at` text,
  `order_delivered_carrier_date` text,
  `order_delivered_customer_date` text,
  `order_estimated_delivery_date` text,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customer_id` (`customer_id`),
  CONSTRAINT `fk_orders_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `order_item` (
  `order_id` varchar(50) NOT NULL,
  `order_item_id` varchar(50) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `seller_id` varchar(50) NOT NULL,
  `shipping_limit_date` text,
  `price` float DEFAULT NULL,
  `freight_value` float DEFAULT NULL,
  PRIMARY KEY (`order_id`,`order_item_id`,`product_id`,`seller_id`),
  KEY `fk_order_item_product_id` (`product_id`),
  KEY `fk_order_item_seller_id` (`seller_id`),
  CONSTRAINT `fk_order_item_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_order_item_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_order_item_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `order_review` (
  `review_id` varchar(50) DEFAULT NULL,
  `order_id` varchar(50) DEFAULT NULL,
  `review_score` int DEFAULT NULL,
  `review_comment_title` text,
  `review_comment_message` text,
  `review_creation_date` text,
  `review_answer_timestamp` text,
  KEY `fk_order_review_order_id` (`order_id`),
  CONSTRAINT `fk_order_review_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `order_payment` (
  `order_id` varchar(50) DEFAULT NULL,
  `payment_sequential` int DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `payment_installments` int DEFAULT NULL,
  `payment_value` float DEFAULT NULL,
  KEY `fk_order_payment_order_id` (`order_id`),
  CONSTRAINT `fk_order_payment_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `sellers` (
  `seller_id` varchar(50) NOT NULL,
  `seller_zip_code_prefix` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `seller_city` varchar(50) DEFAULT NULL,
  `seller_state` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`seller_id`),
  KEY `fk_sellers_zip_code` (`seller_zip_code_prefix`),
  CONSTRAINT `fk_sellers_zip_code` FOREIGN KEY (`seller_zip_code_prefix`) REFERENCES `geo_seller_cust` (`combined_zip_code_prefix`),
  CONSTRAINT `check_five_digits` CHECK ((length(`seller_zip_code_prefix`) = 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `geolocation` (
  `geolocation_zip_code_prefix` varchar(5) NOT NULL,
  `geolocation_lat` double NOT NULL,
  `geolocation_lng` double NOT NULL,
  `geolocation_city` varchar(50) NOT NULL,
  `geolocation_state` varchar(20) NOT NULL,
  KEY `fk_geolocation_zip_code` (`geolocation_zip_code_prefix`),
  CONSTRAINT `fk_geolocation_zip_code` FOREIGN KEY (`geolocation_zip_code_prefix`) REFERENCES `geo_seller_cust` (`combined_zip_code_prefix`),
  CONSTRAINT `check_five_digits_geo` CHECK ((length(`geolocation_zip_code_prefix`) = 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `geo_seller_cust` (
  `combined_zip_code_prefix` varchar(5) NOT NULL,
  PRIMARY KEY (`combined_zip_code_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `category_name_translation` (
  `product_category_name` varchar(50) DEFAULT NULL,
  `product_category_name_english` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
