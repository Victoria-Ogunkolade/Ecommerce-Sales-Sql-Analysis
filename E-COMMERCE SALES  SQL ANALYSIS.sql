/*
  E-COMMERCE SALES ANALYSIS - WEEK 1
  Author: Victoria Ogunkolade
  Role: Data Analyst (2 YOE)
  Description: This SQL script answers key business questions using
  e-commerce sales and returns data. All queries use optimized JOINs,
  filters, and aggregations for actionable insights.
  License: MIT License (see README)
*/

select *
From products

select *
From orders

select *
From customers 


SELECT DISTINCT YEAR(Order_date) AS ORDER_YEAR
FROM ORDERS

---Total revenue over the past year

SELECT SUM(total_amount) AS Total_Revenue
FROM ORDERS
WHERE order_date >= DATEADD(YEAR, -1,GETDATE()) 

---Top Performing Products and Categories
---solving all togeter (i.e. with products and category)
SELECT TOP 10 p.product_id, p.product_name, p.category, SUM(total_amount) AS Sales
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY  p.product_id, p.product_name, p.category
ORDER BY Sales DESC

---solving seperately(i.e. product seperate and category seperate)
---product
SELECT TOP 10 p.product_id, p.product_name, sum(total_amount) as Total_Sales
FROM orders o
JOIN products p
ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY Total_Sales DESC

---category
SELECT TOP 10 p.category, sum(total_amount) as Sales
FROM orders o
JOIN products p on o.product_id =p.product_id
GROUP BY p.category
ORDER BY Sales DESC

---Return Rate Per Product/Category
---solving togeter (i.e. with products and category)
SELECT
      p.product_id,
      p.product_name,
      p.category,
      COUNT(*) AS Total_Orders,
      SUM(CASE WHEN o.returned =1 THEN 1 ELSE 0 END) AS Total_Returned,
      ROUND(100.0 *SUM(CASE WHEN o.returned =1 THEN 1 ELSE 0 END)/COUNT(*),1
         ) AS Return_Rate_Percent
FROM ORDERS o
JOIN PRODUCTS p
ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY Return_Rate_Percent DESC

---Solving seperately(i.e. product seperate and category seperate)
---Return Rate per Product
SELECT p.product_id,
       p.product_name,
       COUNT(*) AS Total_Orders,
       SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END) AS Total_Returns,
       ROUND(100.0 * SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END)/COUNT(*),1
             ) AS Return_Rate_Percent
FROM orders o
JOIN products p
ON o.product_id = p.product_id
GROUP BY p.product_id, P.product_name
ORDER BY Return_Rate_Percent DESC 

---Return Rate per Category
SELECT
      p.category,
      COUNT(*) AS Total_Orders,
      SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END) AS Total_Returned,
      ROUND(100.0 * SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END)/COUNT(*),1
          ) AS Return_Rate_Percent
FROM ORDERS o
JOIN PRODUCTS p
ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY Return_Rate_Percent DESC

---Top Customers by Revenue

SELECT TOP 10 c.customer_id, c.customer_name, sum(total_amount) AS Total_Sales
FROM orders o
JOIN customers c
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY Total_Sales DESC

---Return Behaviour by Region 
SELECT
      c.region,
      COUNT(*) AS Total_Orders,
      SUM( CASE WHEN o.returned =1 THEN 1 ELSE 0 END) AS Total_Returned,
      ROUND(100.0*SUM(CASE WHEN o.returned =1 THEN 1 ELSE 0 END)/COUNT(*),1
          ) AS Returned_Rate_Percent
FROM ORDERS o
JOIN CUSTOMERS c
ON o.customer_id =c.customer_id
GROUP BY c.region
ORDER BY Returned_Rate_Percent DESC

---Return Behaviour by Price Range (Bucketed)
SELECT
    CASE 
       WHEN p.price < 100 THEN 'Under $100'
       WHEN p.price BETWEEN  100 AND 299.99 THEN '$100 - $299'
       WHEN p.price BETWEEN  300 AND 499.99 THEN '$300 - $399'
       ELSE '$500 and above'
    END AS Price_range,
    COUNT(*) AS Total_Orders,
    SUM( CASE WHEN o.returned = 1 THEN 1 ELSE 0 END) AS Return_Rate,
    ROUND(100.0*SUM( CASE WHEN o.returned = 1 THEN 1 ELSE 0 END)/COUNT(*),1
        ) AS Return_Rate_Percent
FROM ORDERS o
JOIN PRODUCTS p
ON o.product_id = p.product_id
GROUP BY 
    CASE 
       WHEN p.price < 100 THEN 'Under $100'
       WHEN p.price BETWEEN  100 AND 299.99 THEN '$100 - $299'
       WHEN p.price BETWEEN  300 AND 499.99 THEN '$300 - $399'
       ELSE '$500 and above'
    END
ORDER BY Return_Rate_Percent DESC 

---Returns Pattern(First-Time Customers vs Repeated Customers)
WITH First_Order AS (
   SELECT
         customer_id,
         MIN(order_date) AS First_Order_Date
   FROM ORDERS
   GROUP BY customer_id
)

SELECT
   CASE
      WHEN o.order_date = f.First_Order_Date THEN 'First-Time Buyer'
      ELSE 'Repaet Buyer'
   END AS Buyer_Type,
   COUNT(*) AS Total_Orders,
   SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END) AS Total_Returns,
   ROUND(100.0*SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END)/COUNT(*),1 
   ) AS Returned_Rate_Percent
FROM ORDERS o
JOIN First_Order f
ON o.customer_id = f.customer_id
GROUP BY 
   CASE
      WHEN o.order_date = f.First_Order_Date THEN 'First-Time Buyer'
      ELSE 'Repaet Buyer'
   END
ORDER BY Returned_Rate_Percent

---Return Patterns By Month of Order 
SELECT 
    FORMAT(order_date, 'yyy-MM') AS Month,
    COUNT(*) AS Total_Orders,
    SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END) AS Total_Returned,
    ROUND(100.0* SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END)/COUNT(*),2
    ) AS Returned_Rate_Percentage
FROM ORDERS o
GROUP BY FORMAT(order_date, 'yyy-MM')
ORDER BY Month

---Customer Behaviour(Returns by customer purchase fequency)
WITH Purchase_counts AS (
    SELECT 
         customer_id,
         COUNT(*) AS Total_Orders
    FROM ORDERS
    GROUP BY customer_id
)

SELECT 
   CASE 
       WHEN pc.Total_orders = 1 THEN '1 Purchase'
       WHEN pc.Total_orders BETWEEN 2 AND 4 THEN '2-4 Purchases'
       ELSE '5+ Purchases'
       END AS Loyalt_band,
       COUNT(o.order_id) AS Total_Orders,
       SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END) AS Total_Returns,
       ROUND(100.0*SUM(CASE WHEN o.returned = 1 THEN 1 ELSE 0 END)/COUNT(o.order_id),1
       ) AS Return_Rate_Percent
FROM ORDERS o
JOIN Purchase_counts pc
ON o.customer_id = pc.customer_id
GROUP BY 
    CASE 
       WHEN pc.Total_orders = 1 THEN '1 Purchase'
       WHEN pc.Total_orders BETWEEN 2 AND 4 THEN '2-4 Purchases'
       ELSE '5+ Purchases'
       END
ORDER BY Return_Rate_Percent DESC
