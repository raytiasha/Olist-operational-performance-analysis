| Table            | Purpose                                       |
| ---------------- | --------------------------------------------- |
| orders           | Order lifecycle dates and status              |
| customers        | Customer information                          |
| order_items      | Products within orders                        |
| products         | Product metadata                              |
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


| Column                  | Meaning                        |
| ----------------------- | ------------------------------ |
| purchase_timestamp      | Customer placed order          |
| approved_at             | Payment approved               |
| delivered_carrier_date  | Seller handed order to carrier |
| delivered_customer_date | Customer received order        |
| estimated_delivery_date | Promised delivery date         |


---


| Table         | Primary Purpose        | Key Column           |
| ------------- | ---------------------- | -------------------- |
| orders        | Order lifecycle        | order_id             |
| order_reviews | Customer feedback      | review_id / order_id |
| customers     | Customer information   | customer_id          |
| sellers       | Seller information     | seller_id            |
| order_items   | Products within orders | order_id             |
| products      | Product details        | product_id           |


---


| Column                        | Business Meaning         |
| ----------------------------- | ------------------------ |
| order_purchase_timestamp      | Customer places order    |
| order_approved_at             | Payment approved         |
| order_delivered_carrier_date  | Carrier receives package |
| order_delivered_customer_date | Customer receives order  |
| order_estimated_delivery_date | Promised delivery date   |


---


Order Lifecycle

Order Purchased
        ↓
Payment Approved
        ↓
Carrier Pickup
        ↓
Customer Delivery
