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


| Business Question              | Tables Needed    |
| ------------------------------ | ---------------- |
| Demand vs Performance          | orders           |
| Fulfillment Bottlenecks        | orders           |
| Delivery Delays & Satisfaction | orders + reviews |


---


| Question                          | Tables Needed    |   Because it contains |
| --------------------------------- | ---------------- | --------------------- |
| How has demand changed over time?                    | orders           | order_purchase_timestamp |
| Which fulfillment stages contribute to delays?       | orders           | purchase date, approval date, carrier date, delivery date, estimated date |
| How do delays affect customer satisfaction?          | orders + reviews | delay information + review score |


---


| Column                  | Meaning                        |
| ----------------------- | ------------------------------ |
| purchase_timestamp      | Customer placed order          |
| approved_at             | Payment approved               |
| delivered_carrier_date  | Seller handed order to carrier |
| delivered_customer_date | Customer received order        |
| estimated_delivery_date | Promised delivery date         |
