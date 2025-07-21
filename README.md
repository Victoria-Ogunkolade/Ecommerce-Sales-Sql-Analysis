# 🛒 E-Commerce Sales Analytics Project – SQL Case Study

## Project Overview  

This project represents a full-scale analysis of an e-commerce company's sales data, approached through the lens of a **business analyst**.  

Instead of just showcasing SQL skills, this case study focuses on solving **real business problems**. Every query written was aimed at answering critical questions stakeholders care about like revenue growth, return rates, and customer segmentation.

The analysis dives into **sales trends**, **customer behavior**, **product performance**, and **return patterns**, all powered by raw SQL.  


---

## Objective  

The goal was to evaluate business performance and identify red flags using SQL queries on transactional data. This included:  
- Understanding which products and categories generate the most sales  
- Detecting where returns are hurting profit margins  
- Identifying top customers and revenue drivers  
- Exploring patterns in return behavior across regions and pricing  

This was about thinking like a strategist, diagnosing problems like an operator, and delivering insights like a decision-maker.  

---

## The Dataset  

The dataset reflects a typical e-commerce environment and consists of three core tables:  

- **Orders**: One row per purchase. Includes `order_date`, `total_amount`, `product_id`, `customer_id`, and a `returned` flag.  
- **Products**: Product metadata — including name, category, and price point.  
- **Customers**: Contains customer details like name, region, and ID.  

---

## Key Business Questions Answered  

1. **What’s our total revenue over the past year?**  
   → Used to benchmark performance and uncover seasonality.  

2. **Which products and categories are driving the most sales?**  
   → Informs inventory planning, pricing, and marketing.  

3. **Where are returns eating into our profits?**  
   → Pinpoints problem products/categories for optimization.  

4. **Who are our top customers?**  
   → Supports loyalty programs and targeted engagement.  

5. **Do returns vary by region, product type, or price point?**  
   → Helps surface geographic and pricing-based fulfillment challenges.  

---

## Key Insights & Recommendations  

### Revenue  
- The business generated **steady revenue**, with strong contributions from top-performing products and categories. However, the data reveals a **concentration risk**: a large chunk of income is reliant on just a handful of SKUs.  
- **Recommendation**:  
  - Conduct A/B testing campaigns to spotlight **emerging products** in marketing materials.  
  - Create **bundled offers** that pair high-performing products with lower-selling ones to increase product visibility and overall cart value.  
  - Allocate part of the ad budget to promote underperforming categories with high profit margins as they may simply be **under-discovered, not under-demanded**.  

### Product Returns  
- Return rates spiked in specific product categories, reaching **40–60%**, which is significantly above the industry benchmark. The SQL findings pointed to patterns in certain high-priced or niche products being returned more frequently.  
- **Possible Issues**: misleading product visuals, unclear specifications, or quality inconsistencies.  
- **Recommendation**:  
  - Run **qualitative reviews** of returned product listings to check for clarity, quality of images, and expectation-setting.  
  - Add **360° product views, comparison charts, and sizing guides** where applicable.  
  - Implement a **feedback loop** that collects specific return reasons to detect and fix product-level issues early.  
  - Engage customer service agents to proactively reach out to return-prone product purchasers.  

### Top Customers  
- A small segment of customers contributed the lion’s share of total revenue. These **power users** made multiple high-value purchases, indicating strong brand affinity.  
- **Recommendation**:  
  - Develop a **tiered loyalty program** offering perks like early access, free returns, or exclusive discounts.  
  - Personalize communication through **email campaigns** that reflect customer buying behavior.  
  - Launch **referral programs** to encourage repeat buyers to bring in new high-value customers.  
  - Identify mid-tier customers with potential (frequency but not volume) and target them with **upsell campaigns**.  

### Regional Patterns  
- Regions with abnormally high return rates stood out — not due to product issues, but possibly due to **logistics bottlenecks or expectation mismatches**.  
- **Recommendation**:  
  - Perform a **delivery experience audit**: assess delivery time, packaging condition, and customer satisfaction by region.  
  - Offer **region-specific messaging** at checkout to set clearer expectations (e.g., delivery ETA, return process).  
  - Partner with **local couriers** known for reliability in these flagged regions.  
  - Consider launching **regional micro-fulfillment centers** to reduce delivery lag and damages.  
---

## Tools Used  
- Microsoft SQL Server  
- SQL (Intermediate–Advanced)  
- Strategic business analysis & storytelling  

---

## Simulated Business Impact  

If implemented in a real-world company, this analysis would lead to:  
- Fewer losses from returns  
- Smarter inventory planning  
- Improved customer retention & CLV  
- Better localized fulfillment strategies  

---

## Skills Demonstrated  
- SQL querying (joins, subqueries, aggregations, CTEs, filtering)  
- End-to-end business analysis  
- Insight translation → Actionable recommendations  
- Cross-domain problem-solving (Marketing, Ops, CX)

---
