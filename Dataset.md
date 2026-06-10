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


| Business Question              | Tables Needed    |
| ------------------------------ | ---------------- |
| Demand vs Performance          | orders           |
| Fulfillment Bottlenecks        | orders           |
| Delivery Delays & Satisfaction | orders + reviews |
