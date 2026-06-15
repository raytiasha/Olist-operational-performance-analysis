--- What time period does the dataset cover?
  SELECT
  MIN(order_purchase_timestamp),
  MAX(order_purchase_timestamp)
  FROM orders;
  
  2016-09-04 21:15:19	to 2018-10-17 17:30:18

--- Check duplicate order id's
  SELECT order_id,
     COUNT(*)
  FROM orders
  GROUP BY order_id
  HAVING COUNT(*) > 1;

  0 rows returned => No duplicate orders.

  --- Check missing timestamps

SELECT
COUNT(*)
FROM orders
WHERE order_purchase_timestamp IS NULL;

Output: 0
  
SELECT
COUNT(*)
FROM orders
WHERE order_approved_at IS NULL;

Output: 160

SELECT
COUNT(*)
FROM orders
WHERE order_delivered_carrier_date IS NULL;

Output: 1783

SELECT
COUNT(*)
FROM orders
WHERE order_delivered_customer_date IS NULL;

Output: 2965

SELECT
COUNT(*)
FROM orders
WHERE order_estimated_delivery_date IS NULL;

Output: 0
  
  /*
  The MySQL Import Wizard was unable to correctly handle blank values in TIMESTAMP columns, causing valid records to be rejected with "Incorrect datetime value" 
  errors. LOAD DATA INFILE provides better control over data transformations during import, allowing blank values to be converted to NULL using NULLIF(), thereby 
  ensuring complete and accurate loading of the dataset.
  */

SHOW VARIABLES LIKE 'secure_file_priv';
C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\

--- Load Orders table
  
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

--- Load Order Review table

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    @review_creation_date,
    @review_answer_timestamp
)
SET
    review_creation_date = NULLIF(@review_creation_date,''),
    review_answer_timestamp = NULLIF(@review_answer_timestamp,'');
