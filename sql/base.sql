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

CREATE OR REPLACE VIEW customer_summary AS
SELECT
    customer_id,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(revenue) AS total_revenue,
    MIN(order_date) AS first_purchase,
    MAX(order_date) AS last_purchase,
    (MAX(order_date) - MIN(order_date)) AS days_active,
    CASE
        WHEN COUNT(DISTINCT order_id) = 1 THEN 'One-time'
        WHEN COUNT(DISTINCT order_id) BETWEEN 2 AND 3 THEN 'Recurring'
        ELSE 'High-value'
    END AS segment
FROM fact_sales
GROUP BY customer_id;


CREATE OR REPLACE VIEW monthly_sales AS
SELECT
    DATE_TRUNC('month', order_date)::date AS month_start,
    TO_CHAR(DATE_TRUNC('month', order_date), 'YYYY-MM') AS year_month,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(revenue) AS total_revenue
FROM fact_sales
GROUP BY 1, 2
ORDER BY 1;

CREATE OR REPLACE VIEW customer_revenue_rank AS
WITH base AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_revenue,
        COUNT(DISTINCT order_id) AS total_orders
    FROM fact_sales
    GROUP BY customer_id
)
SELECT
    customer_id,
    total_revenue,
    total_orders,
    SUM(total_revenue) OVER (ORDER BY total_revenue DESC) AS running_revenue,
    SUM(total_revenue) OVER () AS overall_revenue,
    ROUND(
        SUM(total_revenue) OVER (ORDER BY total_revenue DESC) /
        NULLIF(SUM(total_revenue) OVER (), 0),
        4
    ) AS cumulative_share
FROM base;


CREATE OR REPLACE VIEW repeat_rate AS
SELECT
    COUNT(*) FILTER (WHERE total_orders > 1)::numeric / COUNT(*) AS repeat_rate
FROM customer_summary;
