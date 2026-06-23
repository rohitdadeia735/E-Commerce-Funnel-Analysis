E-Commerce Sales Funnel Analysis
Project Overview
Freelance analytics project analyzing sales performance across Amazon and Flipkart for an e-commerce seller in the appliance spare parts category. The goal was to identify revenue leakage across the sales funnel and surface actionable insights across 4 months of transaction data spanning both B2C and B2B segments.
📂 Dataset Information

12 source files across Amazon (B2C + B2B) and Flipkart — 14,253 rows total
4 months of transaction data (January to April 2026)
Raw source files not included due to client confidentiality
Cleaned and unified output available as unified_sales.csv

Unified Table: unified_sales
Key Columns:

platform: Amazon or Flipkart
segment: B2C or B2B
month: Transaction month
transaction_type: Shipped, Cancelled, or Returned
invoice_amount: Transaction value
item_description: Product name
ship_to_state: Delivery state
fulfillment_type: Fulfillment method
payment_method: Payment method used

🔍 Data Cleaning and Preparation

Loaded 8 Amazon CSV files and 4 Flipkart Excel files with completely different schemas
Standardized column names across both platforms into a unified structure
Handled missing values, null payment methods, and inconsistent transaction type labels
Merged all 12 files into a single clean table using Python and Pandas

📊 SQL Queries and Insights
🔹 Funnel and Trend Analysis

Built a full sales funnel showing gross orders, shipped, cancelled, and returned by platform
Tracked monthly order volume, cancellation rate, and refund rate across 4 months
Calculated month-over-month revenue growth and refund trends

🔸 Revenue Analysis

Broke down gross revenue, refund amount, and net revenue by platform and month
Identified top 10 products by gross and net revenue
Quantified total revenue leakage of 1.86M INR across the funnel

🔺 Geographic and Operational Analysis

Ranked top 10 states by net revenue
Identified top 10 states by cancellation rate (minimum 20 orders threshold)
Compared cancellation and return rates by fulfillment type and platform
Analyzed refund rates by payment method

🛠️ Tools and Technologies

Language: Python, SQL
Libraries: Pandas
Database: PostgreSQL
Visualization: Power BI (DAX, slicers, drill-through)
IDE: Jupyter Notebook, pgAdmin

SQL Techniques Used
1️⃣ Aggregation and Filtering

Used COUNT(), SUM(), and ROUND() to calculate order volumes and revenue figures
Applied FILTER (WHERE ...) to conditionally aggregate shipped, cancelled, and returned orders in a single query

2️⃣ Conditional Logic

Used NULLIF() to avoid division by zero in rate calculations
Applied CASE WHEN logic for transaction type classification

3️⃣ Multi-Dimensional Grouping

Grouped by platform, month, state, product, fulfillment type, and payment method
Combined multiple metrics in single queries for efficiency

4️⃣ Query Design

Used HAVING to filter states with minimum order thresholds before ranking
Applied ORDER BY with LIMIT to surface top products and geographies

📁 Files
FileDescriptiondata_cleaning.ipynbData loading, cleaning, schema standardization, and mergingunified_sales.csvCleaned and unified output table used for all SQL analysisquery1_funnel_overview.sqlFull funnel overview by platformquery2_monthly_trends.sqlMonthly order and cancellation trends by platformquery3_revenue_analysis.sqlGross and net revenue by platform and monthquery4_top_products.sqlTop 10 products by gross revenuequery5_return_rate.sqlReturn rate by productquery6_state_revenue.sqlTop 10 states by net revenuequery7_state_cancellations_sq.sqlTop 10 states by cancellation ratequery8_fulfillment.sqlCancellation and return rates by fulfillment typequery9_payment_method.sqlOrders and refund rate by payment methodquery10_monthly_growth.sqlMonth-over-month revenue and refund trends
📌 Key Learnings

Handling real-world schema inconsistencies across two platforms with different data structures
Building a complete sales funnel from raw transaction data using SQL
Translating operational data into business insights around revenue leakage and performance

🚀 Future Enhancements

Build a live Power BI dashboard connected directly to PostgreSQL
Add product category classification for deeper segmentation
Expand analysis to include seasonal trends across a full year

