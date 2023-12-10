ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customer(customer_id);

ALTER TABLE order_item
ADD CONSTRAINT fk_order_item_product_id FOREIGN KEY (product_id) REFERENCES products(product_id),
ADD CONSTRAINT fk_order_item_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_item
ADD CONSTRAINT fk_order_item_seller_id FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

ALTER TABLE order_review
ADD CONSTRAINT fk_order_review_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_payment
ADD CONSTRAINT fk_order_payment_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id);
