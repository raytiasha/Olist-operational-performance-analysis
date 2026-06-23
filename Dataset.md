### Dataset Tables Overview

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
