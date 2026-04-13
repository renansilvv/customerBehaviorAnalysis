DROP VIEW IF EXISTS repeat_rate;
DROP VIEW IF EXISTS customer_revenue_rank;
DROP VIEW IF EXISTS monthly_sales;
DROP VIEW IF EXISTS customer_summary;
DROP VIEW IF EXISTS fact_sales;

DROP TABLE IF EXISTS olist_order_items_dataset;
DROP TABLE IF EXISTS olist_orders_dataset;
DROP TABLE IF EXISTS olist_customers_dataset;

CREATE TABLE olist_customers_dataset (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT NOT NULL,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT
);

CREATE TABLE olist_orders_dataset (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT NOT NULL,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES olist_customers_dataset(customer_id)
);

CREATE TABLE olist_order_items_dataset (
    order_id TEXT NOT NULL,
    order_item_id INTEGER NOT NULL,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),
    CONSTRAINT pk_order_items PRIMARY KEY (order_id, order_item_id),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES olist_orders_dataset(order_id)
);
