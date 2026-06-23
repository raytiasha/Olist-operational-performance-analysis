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
* [Clarifying Questions, Assumptions, and Caveats](#clarifying-questions-assumptions-and-caveats)

## Project Background

Olist is a Brazilian e-commerce platform that connects small and medium-sized merchants to multiple online marketplaces through a single integrated platform. When a customer places an order, the seller is responsible for processing and fulfilling it, while Olist coordinates shipment and delivery through its logistics partners across Brazil. After an order is delivered, or once the estimated delivery date has passed, customers receive a satisfaction survey that captures ratings and feedback on their overall purchase experience.

The primary stakeholder for this project is the Operations Manager, who is responsible for overseeing order fulfillment efficiency and delivery performance. As order volumes increase, maintaining efficient operations and ensuring timely deliveries become critical to delivering a positive customer experience. To support operational decision-making, the stakeholder requires insights into demand patterns, fulfillment bottlenecks, and delivery performance. These insights will help identify opportunities to improve operational efficiency, reduce delivery delays, and enhance customer satisfaction.

The business questions and supporting KPIs that guide this analysis are outlined [here](https://github.com/raytiasha/WIP_Project/blob/main/Business%20Questions%20and%20KPIs.md).

## Executive Summary
Order demand grew rapidly throughout 2017, increasing nearly ninefold between January and November before stabilizing at consistently higher levels during 2018. Despite this significant growth, delivery performance remained relatively stable overall, indicating that operations generally scaled effectively with increasing demand. However, major demand surges, particularly in November 2017, coincided with longer delivery times, suggesting that sudden spikes in order volume can place temporary strain on operational capacity.

A breakdown of the fulfillment process revealed that shipping was the primary contributor to overall delivery time and the main driver of delays during peak-demand periods. While seller fulfillment times increased slightly when demand surged, the largest increases in delivery duration were caused by longer shipping times. Improvements in delivery performance observed from April 2018 onward were largely driven by reductions in shipping duration, highlighting logistics efficiency as a key operational lever.

Customer satisfaction was strongly linked to delivery performance. On-time deliveries achieved an average review score of 4.29, while orders delayed by more than eight days received an average score of only 1.71. Customer ratings declined consistently as delivery delays increased, demonstrating that reliable delivery performance plays a critical role in maintaining a positive customer experience.

Based on these findings, operational improvement efforts should prioritize logistics performance, shipping capacity planning during peak-demand periods, and initiatives that reduce delivery delays to improve customer satisfaction.

## Dataset Structure

## Insights Summary

**In order to evaluate operational performance, we focused on the following key metrics:**
- **Monthly Order Volume:** Tracks changes in demand over time and identifies periods of increased operational workload.
- **Average Delivery Time & Delayed Delivery Rate:** Measures the efficiency and reliability of the fulfillment and delivery process.
- **Average Review Score:** Evaluates customer satisfaction and helps quantify the customer impact of delivery performance.

#### Monthly Order Volume
- Order demand increased significantly from 324 orders in October 2016 to a peak of 7,544 orders in November 2017.
- Demand remained relatively stable throughout most of 2018, averaging approximately 6,000–7,500 orders per month.
- This trend suggests strong platform adoption and expansion during 2017, followed by a period of more consistent and mature demand levels in 2018.

#### Average Delivery Time
- Delivery performance remained relatively stable despite significant growth in order volume throughout 2017, suggesting that operations were generally able to scale alongside increasing demand.
- The sharp increase in order volume during November 2017 coincided with a notable rise in average delivery times of about 3-4 days, indicating that sudden demand surges may place additional strain on operational capacity.
- Average delivery times improved substantially from April 2018 onward while order volumes remained consistently high, suggesting improvements in fulfillment and delivery efficiency.
- Overall, there was no consistent month-to-month relationship between higher order volumes and longer delivery times. However, periods of exceptionally high demand were associated with temporary declines in delivery performance.

#### Delayed Delivery Rate
- Order approval remained consistently below one day throughout the analysis period and did not contribute meaningfully to overall delivery delays.
- Seller fulfillment times increased by 1 day during peak-demand periods, but remained a relatively small component of the total delivery cycle.
- Shipping was the primary operational bottleneck, consistently accounting for the largest share of delivery time across all periods.
- During the November 2017 demand surge, shipping time increased by over 2.5 days compared to the previous month, indicating that logistics operations were more affected by peak demand than seller fulfillment processes.
- Delivery performance improved substantially from April 2018 onward, driven primarily by reductions in shipping duration rather than changes in approval or fulfillment times.

#### Average Review Score
- On-time deliveries received the highest customer satisfaction scores, averaging 4.29 out of 5.
- Even short delays of 1–3 days reduced average review scores by approximately 23%, from 4.29 to 3.29.
- Customer satisfaction declines consistently as delivery delays become more severe, indicating a strong negative relationship between delivery performance and customer experience.
- Orders delayed by more than eight days received an average review score of only 1.71, less than half the score of on-time deliveries.
  
## Recommendations
- **Investigate potential seasonal demand patterns by analyzing additional years of order data to determine whether the November demand spike represents a recurring trend.** Understanding seasonal peaks will help operations teams forecast demand and proactively allocate fulfillment and logistics resources.
- **Strengthen logistics capacity planning during peak-demand periods and prioritize carrier performance improvements, as shipping was identified as the primary contributor to delivery delays.** Establishing performance monitoring for logistics partners and preparing for demand surges can help mitigate delivery disruptions.
- **Reduce delivery delays as a core operational objective, as customer satisfaction declines significantly with increasing delay duration.** Particular focus should be placed on preventing delays exceeding four days, where customer ratings drop sharply and customer experience is most negatively affected.

---

## Clarifying Questions, Assumptions, and Caveats

### Questions for Stakeholders prior to analysis

##### Clarifying Questions

- How does the business define a delivery delay: delivery after the estimated delivery date or delivery beyond a specific service-level target?
- Are all logistics partners expected to meet the same delivery standards across regions?
- Should customer satisfaction be evaluated solely through review scores, or should review comments also be considered?
- Are seasonal demand patterns already known by the business, or is identifying seasonality part of the analysis objective?

##### Assumptions
- Only orders with a delivered status were included in delivery performance analyses.
- Customer review scores are assumed to be a reasonable proxy for overall customer satisfaction.
- Delivery delays were measured as deliveries occurring after the estimated delivery date provided to customers.
- Timestamps recorded in the dataset are assumed to be accurate and consistently captured across all orders.
- September and October 2018 were excluded from demand trend interpretation due to incomplete data.

##### Caveats & Limitations
- The dataset covers approximately two years of activity, limiting the ability to confirm long-term seasonal patterns.
- Review scores may be influenced by factors beyond delivery performance, such as product quality, pricing, packaging, or seller communication.
- The analysis identifies relationships between delivery performance and customer satisfaction but does not establish direct causation.
- Shipping was identified as the largest contributor to delivery time; however, the dataset does not provide detailed carrier-level information to determine the root causes of shipping delays.
- Geographic factors such as customer location, distance, and regional infrastructure were not included in this analysis and may influence delivery performance.

---

- View the source data [here](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and the table details [here](https://github.com/raytiasha/Olist-operational-performance-analysis/blob/main/Dataset.md).
- See my SQL queries [here](https://github.com/raytiasha/Olist-operational-performance-analysis/tree/main/sql).

---

- For more of my projects and data journey, visit my [Portfolio](https://github.com/raytiasha/My-Portfolio).
- Reach out to me on [LinkedIn](https://www.linkedin.com/in/raytiasha).
