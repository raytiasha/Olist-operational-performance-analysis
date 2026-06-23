--- Order Volume vs. Average Delivery Time Analysis

SELECT
    YEAR(order_purchase_timestamp) AS order_year,
    MONTH(order_purchase_timestamp) AS order_month,
    COUNT(*) AS total_orders,
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ),
        2
    ) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered'
GROUP BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp)
ORDER BY
    order_year,
    order_month;

--- Average Time Spent in Each Delivery Stage

SELECT
    YEAR(order_purchase_timestamp) AS order_year,
    MONTH(order_purchase_timestamp) AS order_month,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                order_purchase_timestamp,
                order_approved_at
            )
        ),
        2
    ) AS approval_days,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                order_approved_at,
                order_delivered_carrier_date
            )
        ),
        2
    ) AS fulfillment_days,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                order_delivered_carrier_date,
                order_delivered_customer_date
            )
        ),
        2
    ) AS shipping_days,
    ROUND(
        AVG(
            TIMESTAMPDIFF(
                DAY,
                order_purchase_timestamp,
                order_delivered_customer_date
            )
        ),
        2
    ) AS total_delivery_days
FROM orders
WHERE order_status = 'delivered'
GROUP BY
    YEAR(order_purchase_timestamp),
    MONTH(order_purchase_timestamp)
ORDER BY
    order_year,
    order_month;

--- Overall Average Time Spent in Each Delivery Stage

SELECT
    ROUND(
        AVG(TIMESTAMPDIFF(DAY,
            order_purchase_timestamp,
            order_approved_at)),
        2
    ) AS approval_days,
    ROUND(
        AVG(TIMESTAMPDIFF(DAY,
            order_approved_at,
            order_delivered_carrier_date)),
        2
    ) AS fulfillment_days,
    ROUND(
        AVG(TIMESTAMPDIFF(DAY,
            order_delivered_carrier_date,
            order_delivered_customer_date)),
        2
    ) AS shipping_days
FROM orders;
WHERE order_status = 'delivered';

