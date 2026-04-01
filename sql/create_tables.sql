DROP TABLE IF EXISTS olist_order_items_dataset;
DROP TABLE IF EXISTS olist_orders_dataset;
DROP TABLE IF EXISTS olist_customers_dataset;
CREATE TABLE olist_orders_dataset (
order_id TEXT PRIMARY KEY,
customer_id TEXT,
order_status TEXT,
order_purchase_timestamp TIMESTAMP,
order_approved_at TIMESTAMP,
order_delivered_carrier_date TIMESTAMP,
order_delivered_customer_date TIMESTAMP,
order_estimated_delivery_date TIMESTAMP
);
CREATE TABLE olist_order_items_dataset (
order_id TEXT,
order_item_id INTEGER,
product_id TEXT,
seller_id TEXT,
shipping_limit_date TIMESTAMP,
price NUMERIC(10,2),
freight_value NUMERIC(10,2)
);
CREATE TABLE olist_customers_dataset (
customer_id TEXT PRIMARY KEY,
customer_unique_id TEXT,
customer_zip_code_prefix INTEGER,
customer_city TEXT,
customer_state TEXT
);
