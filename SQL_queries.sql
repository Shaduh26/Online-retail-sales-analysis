-- Check the first 10 rows of the dataset
SELECT *
FROM Online_retail_dataset
LIMIT 10;


-- Create a cleaned table by removing rows with missing Customer ID and Description
CREATE TABLE retail_clean AS
SELECT *
FROM Online_retail_dataset
WHERE "Customer ID" IS NOT NULL
  AND Description IS NOT NULL;


-- Identify the top 10 customers based on total spending
SELECT 
    "Customer ID",
    ROUND(SUM(Quantity * Price), 2) AS total_spent
FROM retail_clean
GROUP BY "Customer ID"
ORDER BY total_spent DESC
LIMIT 10;

-- Insight:
-- The top customer spent approximately $279,489.


-- Calculate the total revenue generated
SELECT
    ROUND(SUM(Quantity * Price), 2) AS total_revenue
FROM retail_clean;


-- Calculate total revenue by country
SELECT 
    Country,
    ROUND(SUM(Quantity * Price), 2) AS revenue
FROM retail_clean
GROUP BY Country
ORDER BY revenue DESC;

-- Insights:
-- An analysis of revenue per country showed that the United Kingdom is the main source of revenue, earning above $6.7 million. 
--There is a substantial reduction in revenues from other countries, where the Netherlands accounts for below $300,000. 
--In other words, the firm heavily depends on the UK market due to its lack of diversity.

-- Analyze daily sales trends over time
SELECT 
    substr(InvoiceDate, 1, 7) AS month,
    ROUND(SUM(Quantity * Price), 2) AS monthly_revenue
FROM retail_clean
GROUP BY month
ORDER BY month;

-- Insights:
-- The analysis of daily trends shows that there is significant  inconstancy in revenue from day to day with some days having much higher sales than others.
-- This suggests instability in customer purchasing behaviour and possible demand periods.





