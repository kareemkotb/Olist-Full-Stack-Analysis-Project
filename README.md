# Olist-Full-Stack-Analysis-Project

## 📌 Project Overview

This project is a full-stack, end-to-end data analytics case study using the Brazilian Olist e-commerce dataset.
It simulates a real-world analytics workflow where a data analyst supports executive, product, marketing, logistics, and operations teams.
**The project covers:**
- Raw data ingestion and cleaning
- Analytical data modeling (Bronze → Silver → Gold)
- Exploratory Data Analysis (EDA)
- KPI design and funnel analysis
- Interactive Tableau dashboards
- Business insights and recommendations

The objective is to transform a messy, multi-table dataset into decision-ready insights.

**📊 Dataset Summary**
- Orders: ~99,400
- Customers: ~96,100
- Products: ~32,900
- Sellers: ~3,100
- Order Items: ~112,600
- Payments: ~103,800
- Reviews: ~99,400
- Time Period: 2016 – 2018
```
🧱 Project Architecture (Bronze → Silver → Gold)
                ┌────────────────────┐
                │   Raw CSV Files    │
                │  (Kaggle Dataset)  │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │    Bronze Layer     │
                │  • Raw ingestion   │
                │  • No transforms   │
                └─────────┬──────────┘
                          │
                          ▼
                ┌────────────────────┐
                │    Silver Layer     │
                │  • Data cleaning   │
                │  • Type casting    │
                │  • De-duplication  │
                │  • Standardization │
                └─────────┬──────────┘
                          │
          ┌───────────────┼────────────────┐
          ▼               ▼                ▼
┌────────────────┐ ┌────────────────┐ ┌────────────────┐
│ Gold: Sales    │ │ Gold: Funnel   │ │ Gold: Customers│
│ KPIs           │ │ KPIs           │ │ KPIs           │
└────────────────┘ └────────────────┘ └────────────────┘
          │               │                │
          └───────────────┼────────────────┘
                          ▼
                ┌────────────────────┐
                │ Tableau Dashboards │
                │  • Executive View  │
                │  • Funnel          │
                │  • Logistics       │
                │  • Products        │
                └────────────────────┘

```

**Design choice:**
Instead of one massive join, separate Gold tables were created per KPI category, improving performance, clarity, and scalability.

### 🔍 Exploratory Data Analysis (EDA) Highlights
- ~2.9% of orders were canceled
- ~6.7% of delivered orders arrived late
- Median delivery time: 10 days
- Average basket size: 1.13 items per order
- Credit cards represent ~76% of all payments
- Strong seasonality with revenue spikes in Q4 (Nov–Dec)

### 💰 Sales & Revenue KPIs
- Gold Table: Orders + Order Items + Products + Payments
- Total Revenue (GMV): ~$16.2M
- Total Orders: ~99.4K
- Average Order Value (AOV): ~$163
- Average Items per Order: 1.13
- Revenue per Customer: ~$168
- Top Revenue Category: Bed, Bath & Table (~14%)

### 🔄 Funnel Analysis KPIs
- Gold Table: Orders + Payments + Order Status Timestamps
- Funnel Conversion
- Order Created: 99,400 (100%)
- Payment Approved: 97,300 (97.9%)
- Shipped: 96,200 (96.8%)
- Delivered: 94,500 (95.1%)
- Funnel Timing
- Purchase → Payment: 0.8 days
- Payment → Shipping: 2.6 days
- Shipping → Delivery: 6.7 days

### 👥 Customer Analytics KPIs
- Gold Table: Orders + Customers
- Repeat Purchase Rate: ~3.1%
- Average Orders per Customer: 1.03
- Average Customer LTV: ~$172
- Avg. Purchase Interval (repeat customers): 89 days
- Insight: Growth is driven by acquisition, not retention.

### 📦 Product Performance KPIs
- Gold Table: Order Items + Products + Reviews
- Top 10 products: ~8.4% of total revenue
- Average product price: ~$120
- Average freight ratio: ~18%
- Average review score: 4.1 / 5

### 🚚 Logistics & Delivery KPIs
- Gold Table: Orders + Sellers + Customers
- Avg. delivery time: 10.1 days
- Late delivery rate: 6.7%
- Avg. delay (late orders): 4.3 days
- 📍 Northern regions show consistently higher delays.

### 🧑‍💼 Seller Performance KPIs
- Gold Table: Order Items + Sellers + Reviews
- Avg. orders per seller: ~32
- Top 5% of sellers generate: ~41% of revenue
- On-time delivery (top sellers): 96%

### 📈 Tableau Dashboards

All dashboards include filters, KPIs, trends, and drill-downs.

## 🔑 Key Insights
1. Delivery delays strongly correlate with lower review scores
2. Revenue is highly concentrated among a small % of sellers
3. Customer retention is extremely low despite high satisfaction
4. Logistics performance varies significantly by geography
5. Q4 seasonality drives a disproportionate share of revenue

## 💡 Business Recommendations

1. Invest in post-purchase engagement to improve retention
2. Prioritize logistics optimization in high-delay regions
3. Introduce seller incentive programs based on delivery SLAs
4. Use delivery delay as an early warning KPI for reviews
5. Focus marketing spend on high-LTV product categories

## 🧠 Tools & Skills Used

- SQL (data modeling, KPI marts)
- Python (EDA & validation)
- Tableau (analytics & storytelling)
- Funnel analysis & cohort logic
- Real-world data cleaning
- Databricks

## 🏁 Conclusion (Summary)

The marketplace shows strong operational performance, with 95.1% of orders successfully delivered and a 97.9% payment approval rate, indicating a reliable checkout and fulfillment process. However, growth is heavily acquisition-driven, as only ~3.1% of customers return, with an average of 1.03 orders per customer.

Logistics remains a key risk factor: 6.7% of orders are delivered late, adding an average delay of 4.3 days, which directly correlates with lower review scores despite an overall strong 4.1/5 average rating. Revenue is also highly concentrated, with the top 5% of sellers generating ~41% of total GMV, and demand peaking sharply in Q4.

Overall, the data highlights a marketplace that converts well but underperforms in customer retention, logistics consistency, and revenue diversification.
