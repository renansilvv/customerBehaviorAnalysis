CREATE OR REPLACE VIEW fact_sales AS
SELECT
    o.order_id,
    c.customer_unique_id AS customer_id,
    o.order_purchase_timestamp::date AS order_date,
    o.order_status,
    oi.order_item_id,
    oi.product_id,
    oi.seller_id,
    oi.price,
    oi.price AS revenue
FROM olist_orders_dataset o
JOIN olist_customers_dataset c
    ON c.customer_id = o.customer_id
JOIN olist_order_items_dataset oi
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';
