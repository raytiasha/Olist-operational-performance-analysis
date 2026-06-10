/*
  The MySQL Import Wizard was unable to correctly handle blank values in TIMESTAMP columns, causing valid records to be rejected with "Incorrect datetime value" 
  errors. LOAD DATA INFILE provides better control over data transformations during import, allowing blank values to be converted to NULL using NULLIF(), thereby 
  ensuring complete and accurate loading of the dataset.
  */
  SHOW VARIABLES LIKE 'secure_file_priv';
C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    customer_id,
    order_status,
    @order_purchase_timestamp,
    @order_approved_at,
    @order_delivered_carrier_date,
    @order_delivered_customer_date,
    @order_estimated_delivery_date
)
SET
    order_purchase_timestamp =
        NULLIF(@order_purchase_timestamp, ''),
    order_approved_at =
        NULLIF(@order_approved_at, ''),
    order_delivered_carrier_date =
        NULLIF(@order_delivered_carrier_date, ''),
    order_delivered_customer_date =
        NULLIF(@order_delivered_customer_date, ''),
    order_estimated_delivery_date =
        NULLIF(@order_estimated_delivery_date, '');
