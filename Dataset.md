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


| Question                          | Tables Needed    |   Because it contains |
| --------------------------------- | ---------------- | --------------------- |
| How has demand changed over time? (Demand = orders placed)              | orders           | order_purchase_timestamp |
| Which fulfillment stages contribute to delays? (need timestamp at each stage)      | orders           | purchase date, approval date, carrier date, delivery date, estimated date |
| How do delays affect customer satisfaction? (To calculate delays: delivered_customer_date & estimated_delivery_date is needed)         | orders + reviews | delay information + review score |


---
### Orders table


| Column                  | Business Meaning                        |
| ----------------------- | ------------------------------ |
| order_purchase_timestamp      | Customer places order          |
| order_approved_at             | Payment approved               |
| order_delivered_carrier_date  | Seller hands package to carrier |
| order_delivered_customer_date | Customer receives order        |
| order_estimated_delivery_date | Promised delivery date         |


---


### Order Lifecycle

Order Purchased -> Payment Approved -> Carrier Pickup -> Customer Delivery
