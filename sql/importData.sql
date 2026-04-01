\copy olist_orders_dataset
FROM 'data/olist_orders_dataset.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

\copy olist_order_items_dataset
FROM 'data/olist_order_items_dataset.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');

\copy olist_customers_dataset
FROM 'data/olist_customers_dataset.csv'
WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');
