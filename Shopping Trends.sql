# Using CASE statement to get the Age group
SELECT AGE,
    CASE 
        WHEN (AGE) BETWEEN 18 AND 25 THEN 'Youth (18-25)'
        WHEN (AGE) BETWEEN 26 AND 35 THEN 'Young adults (26-35)'
        WHEN (AGE) BETWEEN 36 AND 50 THEN 'Adults (36-50)'
        ELSE 'Elderly'
    END AS Age_Group
FROM CLEMY.SHOPPING_TRENDS
WHERE AGE IS NOT NULL
ORDER BY AGE,Age_Group;

# Total Sales by Category
SELECT Category, 
    SUM("Purchase Amount (USD)") AS TotalSales
FROM CLEMY.SHOPPING_TRENDS
GROUP BY Category
ORDER BY Totalsales DESC;

# Average Rating by Gender
SELECT Gender, 
AVG("REVIEW_RATING") AS AvgRating
FROM clemy.shopping_trends
GROUP BY Gender;

# Top 5 Most Purchased Items
SELECT ITEM_PURCHASED, 
SUM("Purchase Amount (USD)") AS Sales
FROM CLEMY.SHOPPING_TRENDS
GROUP BY ITEM_PURCHASED
ORDER BY Sales DESC
LIMIT 5;

# Subscription Conversion by Age Group
SELECT 
    CASE 
        WHEN (AGE) BETWEEN 18 AND 25 THEN 'Youth (18-25)'
        WHEN (AGE) BETWEEN 26 AND 35 THEN 'Young adults (26-35)'
        WHEN (AGE) BETWEEN 36 AND 50 THEN 'Adults (36-50)'
        ELSE 'Elderly'
    END AS Age_Group,
COUNT(CASE WHEN SUBSCRIPTION_STATUS= TRUE THEN 1 END) * 100.0/ COUNT(*) AS Conversion_Rate
FROM CLEMY.SHOPPING_TRENDS
GROUP BY Age_Group;

# Average Discount per Season
SELECT 
  Season,
  AVG(CASE WHEN Discount_applied = TRUE THEN 1 ELSE 0 END) * 100 AS Discount_Rate
FROM CLEMY.SHOPPING_TRENDS
GROUP BY Season
ORDER BY DISCOUNT_RATE DESC;

# Compare Shipping Type VS Avg purchase amount
SELECT (shipping_type),
    COUNT(*) AS Orders,
    AVG("Purchase Amount (USD)") AS Avg_Spend
FROM CLEMY.SHOPPING_TRENDS
GROUP BY SHIPPING_TYPE
ORDER BY AVG_SPEND DESC;

# Customer Return Rate based on previous purchases
SELECT 
  CASE 
    WHEN PREVIOUS_PURCHASES <= 5 THEN 'New'
    WHEN PREVIOUS_PURCHASES >= 15 THEN 'Returning'
    ELSE 'Loyal'
  END AS CustomerType,
  COUNT(*) AS Customer_Rate
FROM CLEMY.SHOPPING_TRENDS
GROUP BY CustomerType
ORDER BY Customer_Rate DESC;

# Payment Method Popularity
SELECT payment_method,
    COUNT(*) AS Usage_Count
FROM CLEMY.SHOPPING_TRENDS
GROUP BY payment_method;

# Promo Code Usage Rate by Gender
SELECT GENDER,
    COUNT(CASE WHEN PROMO_CODE_USED = TRUE THEN 1 END) * 100 / COUNT(*) AS Promo_Usage_Rate
FROM CLEMY.SHOPPING_TRENDS
GROUP BY GENDER;

# Sales Trend by Season and Category
SELECT 
    Season, 
    Category, 
    SUM("Purchase Amount (USD)") AS TotalSales
FROM CLEMY.SHOPPING_TRENDS
GROUP BY Season, Category
ORDER BY TOTALSALES DESC
LIMIT 10;

# Frequency purchase based on customer count and type
SELECT 
   CASE 
    WHEN PREVIOUS_PURCHASES <= 5 THEN 'New'
    WHEN PREVIOUS_PURCHASES >= 15 THEN 'Returning'
    ELSE 'Loyal'
  END AS CustomerType,
  FREQUENCY_OF_PURCHASES,
  COUNT(DISTINCT CUSTOMER_ID) AS CustomerCount
FROM CLEMY.SHOPPING_TRENDS
GROUP BY 
  CustomerType, FREQUENCY_OF_PURCHASES
ORDER BY 
  CustomerType, FREQUENCY_OF_PURCHASES;


































