--- On-Time vs Delayed Deliveries

SELECT
    CASE
        WHEN DATEDIFF(order_delivered_customer_date,
                      order_estimated_delivery_date) <= 0
            THEN 'On Time'
        ELSE 'Delayed'
    END AS delivery_status,
    COUNT(*) AS total_orders,
    ROUND(AVG(review_score), 2) AS avg_review_score
FROM orders o
JOIN order_reviews r
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY delivery_status;

--- On-Time vs Delayed Deliveries grouped by bucket

SELECT
    CASE
        WHEN DATEDIFF(order_delivered_customer_date,
                      order_estimated_delivery_date) <= 0
            THEN 'On Time'
        WHEN DATEDIFF(order_delivered_customer_date,
                      order_estimated_delivery_date) BETWEEN 1 AND 3
            THEN '1-3 Days Late'
        WHEN DATEDIFF(order_delivered_customer_date,
                      order_estimated_delivery_date) BETWEEN 4 AND 7
            THEN '4-7 Days Late'
        ELSE '8+ Days Late'
    END AS delay_bucket,
    COUNT(*) AS total_orders
FROM orders o
JOIN order_reviews r
    ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
  AND o.order_estimated_delivery_date IS NOT NULL
GROUP BY delay_bucket;

--- Average Delivery Delay (late orders only)

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_estimated_delivery_date
            )
        ),
        2
    ) AS avg_delivery_delay_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND DATEDIFF(
        order_delivered_customer_date,
        order_estimated_delivery_date
      ) > 0;

--- Late Delivery Rate

SELECT
    ROUND(
        SUM(
            CASE
                WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) > 0
                THEN 1
                ELSE 0
            END
        ) * 100.0 /
        COUNT(*),
        2
    ) AS late_delivery_rate_percent
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;

--- On-Time Delivery Rate

SELECT
    ROUND(
        SUM(
            CASE
                WHEN DATEDIFF(order_delivered_customer_date, order_estimated_delivery_date) <= 0
                THEN 1
                ELSE 0
            END
        ) * 100.0 /
        COUNT(*),
        2
    ) AS on_time_delivery_rate_percent
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;
