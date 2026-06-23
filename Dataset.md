### Tables information

| Table            | Purpose                                       |
| ---------------- | --------------------------------------------- |
| orders           | Order lifecycle dates and status              |
| customers        | Customer information                          |
| order_items      | Products within orders                        |
| products         | Product details                              |
| sellers          | Seller information                            |
| order_reviews    | Customer ratings                              |
| order_payments   | Payment information                           |
| geolocation      | Geographic data                               |
| order_delivered? | Delivery timestamps ( in orders table)        |


---

### Order Lifecycle

Order Purchased -> Payment Approved -> Carrier Pickup -> Customer Delivery


---

### Breakdown of Orders table


| Column                  | Business Meaning                        |
| ----------------------- | ------------------------------ |
| order_purchase_timestamp      | Customer places order          |
| order_approved_at             | Payment approved               |
| order_delivered_carrier_date  | Seller hands package to carrier |
| order_delivered_customer_date | Customer receives order        |
| order_estimated_delivery_date | Promised delivery date         |
