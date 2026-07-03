--- On-Time vs Delayed Deliveries

SELECT
    CASE
        WHEN order_delivered_customer_date <= order_estimated_delivery_date
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
GROUP BY delivery_status;

--- 

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
