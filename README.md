# Olist Operational Insights

### The goal of this project is to identify operational bottlenecks across order processing, seller fulfillment, and delivery execution in order to reduce delivery delays, improve customer satisfaction, and prioritize operational improvement initiatives.

### Table of Contents
* [Project Background](#project-background)
* [Executive Summary](#executive-summary)
* [Dataset Structure](#dataset-structure)
* [Insights Summary](#insights-summary)
    * [Monthly Order Volume](#monthly-order-volume)
    * [Average Delivery Time](#average-delivery-time)
    * [Delayed Delivery Rate](#delayed-delivery-rate)
    * [Average Review Score](#average-review-score)
* [Recommendations](#recommendations)
* [Assumptions and Limitations](#assumptions-and-limitations)

## Project Background

Olist is a Brazilian e-commerce platform that enables small and medium-sized merchants to sell products through the Olist Store and fulfill orders using Olist's logistics partners. After an order is placed, sellers are responsible for processing the order while Olist coordinates shipment and delivery to customers across Brazil. After an order is delivered, or once the estimated delivery date has passed, customers receive a satisfaction survey that captures ratings and feedback on their overall purchase experience.

The primary stakeholder for this project is the Operations Manager, who is responsible for overseeing order fulfillment efficiency and delivery performance. As order volumes increase, maintaining efficient operations and ensuring timely deliveries become critical to delivering a positive customer experience. To support operational decision-making, the stakeholder requires insights into demand patterns, fulfillment bottlenecks, and delivery performance. These insights will help identify opportunities to improve operational efficiency, reduce delivery delays, and enhance customer satisfaction.

The business questions and supporting KPIs that guide this analysis are outlined [here](https://github.com/raytiasha/WIP_Project/blob/main/Business%20Questions%20and%20KPIs.md).

## Executive Summary
Order demand grew rapidly throughout 2017, increasing from 800 orders in January 2017 to 7,544 orders in November 2017, a nearly 9-fold increase. Average delivery time remained relatively stable at approximately 11–13 days throughout most of 2017, indicating that operations generally scaled effectively with growing demand. However, the sharp increase in demand during November 2017 coincided with average delivery time rising from 11.4 days in October to 14.7 days in November, suggesting that sudden spikes in order volume can place temporary strain on operational capacity.

Delivery performance continued to deteriorate until March 2018, with average delivery time peaking at 16.9 days in February, driven primarily by an increase in shipping duration from 10.0 to 12.9 days. Performance then improved significantly, with average delivery time declining to 7.3 days by August 2018 despite sustained order volumes of approximately 6,000–7,000 orders per month, indicating substantial improvements in operational and logistics efficiency.

A breakdown of the fulfillment process revealed that shipping was the primary contributor to overall delivery time and the main driver of delays during peak-demand periods. During the November 2017 demand surge, seller fulfillment time increased by approximately 1 day, while shipping time increased by 3 days compared to the previous months, accounting for the majority of the deterioration in delivery performance. Improvements observed from April 2018 onward were also driven primarily by logistics efficiency, with average shipping duration decreasing from 8.2 days in April 2018 to 4.9 days in August 2018, reducing overall delivery times approximately by 4 days.

Customer satisfaction was strongly linked to delivery performance. On-time deliveries achieved an average review score of 4.29, while orders delayed by 8+ days received an average score of only 1.71. Customer ratings declined consistently as delivery delays increased, demonstrating that reliable delivery performance plays a critical role in maintaining a positive customer experience.

Based on these findings, operational improvement efforts should prioritize logistics performance, shipping capacity planning during peak-demand periods, and initiatives that reduce delivery delays to improve customer satisfaction.

<img width="1000" height="800" alt="Executive Summary" src= "https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Visualization/executive_summary.png"/>

## Dataset Structure

The Olist dataset consists of nine relational tables containing information on customers, orders, order items, products, sellers, payments, and customer reviews. This analysis focused on the **orders** and **order_reviews** tables, which provided the information required to evaluate demand trends, delivery performance, and customer satisfaction. Additional tables could support further analysis of seller, product, and payment-related factors, but were outside the scope of this project.

<img width="1000" height="800" alt="ERD diagram" src= "https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Visualization/ERD.png"/>

## Insights Summary

**In order to evaluate operational performance, we focused on the following key metrics:**
- **Monthly Order Volume:** Measures demand trends and operational workload over time.
- **Delivery Cycle Analysis:** Measures the efficiency and reliability of the end-to-end order fulfillment process, from order placement to delivery.
- **Average Review Score:** Measures customer satisfaction and quantifies the impact of operational performance on customer experience.

#### Monthly Order Volume
- Order demand increased significantly from 324 orders in October 2016 to a peak of 7,544 orders in November 2017.
- Demand remained relatively stable throughout most of 2018, averaging approximately 6,000–7,500 orders per month.
- This trend suggests strong platform adoption and expansion during 2017, followed by a period of more consistent and mature demand levels in 2018.

<img width="1000" height="800" alt="ERD diagram" src= "https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Visualization/demand_vs_delivery.png"/>

#### Delivery Cycle Analysis
- As order volume increased from 800 orders in January 2017 to 7,544 orders in November 2017, average delivery time remained relatively stable at approximately 11-13 days throughout most of 2017, indicating that operations generally scaled alongside increasing demand.
- The November 2017 demand surge coincided with average delivery time increasing from 11.4 days in October to 14.7 days in November, an increase of 3.3 days, suggesting that sudden spikes in demand can temporarily strain operational capacity.
- Delivery performance worsened in early 2018, with average delivery time peaking at 16.9 days in February 2018. Performance then improved significantly, declining to 7.3 days by August 2018, a reduction of approximately 9.6 days, despite order volumes remaining consistently high at approximately 6,000–7,000 orders per month. This improvement was driven primarily by logistics efficiency, as average shipping duration decreased from 12.9 days in February 2018 to 4.9 days in August 2018, a reduction of approximately 8 days, while approval and seller fulfillment times remained relatively stable.
- Overall, there was no consistent month-to-month relationship between higher order volumes and longer delivery times. However, periods of exceptionally high demand were associated with temporary declines in delivery performance.
- Order approval remained consistently below 0.5 days throughout the analysis period and did not contribute meaningfully to delivery delays.
- Seller fulfillment time increased from 2.6 days in October 2017 to 3.1 days in November 2017, an  increase of approximately 0.6 days, and remained a relatively small component of the overall delivery cycle.
- Shipping was the primary operational bottleneck, consistently accounting for the largest share of delivery time across all periods.
- During the November 2017 demand surge, shipping duration increased from 8.0 days to 10.6 days, an increase of approximately 2.6 days, accounting for the majority of the deterioration in delivery performance.
- Delivery performance improved substantially from April 2018 onward, driven primarily by reductions in shipping duration rather than changes in approval or fulfillment times.

<img width="1000" height="800" alt="ERD diagram" src= "https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Visualization/fulfillment_bottleneck.png"/>

#### Average Review Score
- On-time deliveries received the highest customer satisfaction scores, averaging 4.29 out of 5.
- Even short delays of 1–3 days reduced average review scores by approximately 23%, from 4.29 to 3.29.
- Customer satisfaction declines consistently as delivery delays become more severe, indicating a strong negative relationship between delivery performance and customer experience.
- Orders delayed by 8+ days received an average review score of only 1.71, less than half the score of on-time deliveries.

<img width="1000" height="800" alt="ERD diagram" src= "https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Visualization/customer_satisfaction.png"/>
  
## Recommendations
- **Improve Demand Forecasting and Peak-Season Planning.** Further analysis using additional years of data is recommended to determine whether the November demand spike represents a recurring seasonal pattern. Identifying seasonal demand peaks would enable more accurate forecasting and proactive allocation of fulfillment and logistics resources.
- **Prioritize Logistics Performance During Demand Surges.** Strengthen logistics capacity planning and carrier performance management during peak-demand periods, as shipping was identified as the primary contributor to delivery delays. Monitoring logistics partner performance and preparing for demand surges can help reduce delivery disruptions and maintain service levels.
- **Reduce Delivery Delays to Improve Customer Satisfaction.** Reducing delivery delays should be a key operational priority, as customer satisfaction declines significantly with increasing delay duration. Particular attention should be given to preventing delays exceeding 4 days, where customer ratings drop sharply and the customer experience is most negatively affected.

---

## Assumptions and Limitations

### Questions for Stakeholders prior to analysis

##### Assumptions
- Only delivered orders were included in delivery performance analysis.
- Review scores were used as a proxy for customer satisfaction.
- Delivery delays were defined as deliveries completed after the estimated delivery date.
- September and October 2018 were excluded due to incomplete data.

##### Limitations
- The dataset does not include carrier-level operational details to explain shipping delays.
- Customer reviews may be influenced by factors beyond delivery performance.
- The available time period is insufficient to conclusively identify recurring seasonal demand patterns.

---

- Read the full report [here](https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Olist%20Insights%20Report.pdf).
- View the source data [here](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and the table details [here](https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Dataset.md).
- See my SQL queries [here](https://github.com/raytiasha/Olist-operational-performance-analysis/tree/main/sql).

---

- For more of my projects and data journey, visit my [Portfolio](https://github.com/raytiasha/My-Portfolio).
- Reach out to me on [LinkedIn](https://www.linkedin.com/in/raytiasha).
