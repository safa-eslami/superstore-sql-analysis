/*====================================================

Project: Superstore Sales Analysis
Author: Safa
Database: SQL Server

Description:
This project analyzes the Superstore dataset through
10 business scenarios using SQL Server. It covers
aggregation, grouping, date functions, CTEs, and
window functions to extract business insights.

====================================================*/
/*====================================================
Scenario 1: Business KPIs
Question:
What is the overall business performance?

Metrics:
- Total Sales
- Total Profit
- Total Orders
====================================================*/

SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    COUNT(DISTINCT [Order_ID]) AS Total_Orders
FROM Superstore;

/*
Results:
- Total Sales: 2,297,200.86
- Total Profit: 286,817.02
- Total Orders: 5,009

Insights:
- The store generated approximately $2.3M in sales.
- Total profit reached $286.8K.
- Profit margin was approximately 12.5%.
- Average order value was approximately $459.
*/
/*====================================================
Scenario 2: Category Performance Analysis

Business Question:
Which product category generates the highest sales and profit?

Objectives:
- Calculate total sales for each category.
- Calculate total profit for each category.
- Compare category performance.

====================================================*/

SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Category
ORDER BY Total_Sales DESC;

/*
Results:

Technology
Sales: 836,154.03
Profit: 145,454.95

Furniture
Sales: 741,999.79
Profit: 18,871.27

Office Supplies
Sales: 719,047.03
Profit: 122,490.80

Insights:

1. Technology is the best-performing category,
   generating both the highest sales and highest profit.

2. Furniture has relatively high sales but very low profit,
   indicating a weak profit margin.

3. Office Supplies generates strong profit despite lower sales,
   making it one of the most efficient categories.

4. Furniture should be investigated further to identify
   which products are reducing profitability.
*/
/*====================================================
Scenario 3: Sub-Category Performance Analysis

Business Question:
Which product sub-categories generate the highest profit?

Objective:
Analyze product sub-categories to identify the most
profitable and least profitable areas of the business.

====================================================*/

SELECT
    Sub_Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Sub_Category
ORDER BY SUM(Profit) DESC;

/*
Results Summary:

Top Profitable Sub-Categories:

- Copiers:
  Sales = 149,528.03
  Profit = 55,617.82

- Phones:
  Sales = 330,007.05
  Profit = 44,515.73

- Accessories:
  Sales = 167,380.32
  Profit = 41,936.64

Lowest Performing Sub-Categories:

- Tables:
  Sales = 206,965.53
  Profit = -17,725.48

- Bookcases:
  Sales = 114,879.00
  Profit = -3,472.56

- Supplies:
  Sales = 46,673.54
  Profit = -1,189.10

Insights:

1. Copiers generated the highest profit among all
   sub-categories despite not having the highest sales.

2. Phones achieved both high sales and high profit,
   making them one of the strongest-performing products.

3. Tables generated significant sales volume but
   produced a substantial loss, indicating poor
   profitability.

4. Bookcases and Supplies also generated negative
   profit and contributed to overall business losses.

5. The low profitability of the Furniture category
   can largely be explained by losses from Tables
   and Bookcases.

6. This analysis demonstrates that high sales do
   not necessarily lead to high profit. Profitability
   should be evaluated alongside revenue when making
   business decisions.
*/
/*====================================================
Scenario 4: Regional Performance Analysis

Business Question:
Which region generates the highest sales and profit?

Objective:
Evaluate regional performance and identify the most
profitable geographic market.

====================================================*/

SELECT
    Region,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Region
ORDER BY SUM(Profit) DESC;

/*
Results:

West
- Sales: 725,457.82
- Profit: 108,418.45

East
- Sales: 678,781.24
- Profit: 91,522.78

South
- Sales: 391,721.91
- Profit: 47,169.43

Central
- Sales: 501,239.89
- Profit: 39,706.36

Insights:

1. West generated the highest sales and profit,
making it the strongest-performing region.

2. East also delivered strong sales and profitability,
ranking second overall.

3. Central produced higher sales than South but
generated lower profit, indicating weaker profit margins.

4. Regional profitability varies significantly,
suggesting that pricing, discounts, or product mix
may differ across regions.

5. Profit provides a more accurate measure of regional
performance than sales alone.
*/
/*====================================================
Scenario 5: Top Customers by Sales

Business Question:
Who are the top 10 customers based on total sales?

Objective:
Identify the most valuable customers in terms of
revenue generation.

====================================================*/

SELECT TOP (10)
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;

/*
Results:

1. Sean Miller         -> 25,043.05
2. Tamara Chand        -> 19,052.22
3. Raymond Buch        -> 15,117.34
4. Tom Ashbrook        -> 14,595.62
5. Adrian Barton       -> 14,473.57
6. Ken Lonsdale        -> 14,175.23
7. Sanjit Chand        -> 14,142.33
8. Hunter Lopez        -> 12,873.30
9. Sanjit Engle        -> 12,209.44
10. Christopher Conant -> 12,129.07

Insights:

1. Sean Miller generated the highest sales among all customers.

2. A small group of customers contributes a significant
portion of total revenue.

3. Identifying and retaining top customers can have a
major impact on overall business performance.

4. High-sales customers should be further analyzed to
determine whether they are also highly profitable.

5. Revenue alone does not guarantee profitability,
therefore customer profit analysis is required.
*/
/*====================================================
Scenario 6: Top Customers by Profit

Business Question:
Which customers generate the highest profit?

Objective:
Identify the most profitable customers and compare
profitability against revenue performance.

====================================================*/

SELECT TOP (10)
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;

/*
Results:

Top Profitable Customers:

1. Tamara Chand
   Sales: 19,052.22
   Profit: 8,981.32

2. Raymond Buch
   Sales: 15,117.34
   Profit: 6,976.10

3. Sanjit Chand
   Sales: 14,142.33
   Profit: 5,757.41

4. Hunter Lopez
   Sales: 12,873.30
   Profit: 5,622.43

5. Adrian Barton
   Sales: 14,473.57
   Profit: 5,444.81

Insights:

1. Tamara Chand generated the highest profit among all customers.

2. The most profitable customers are not necessarily the customers with the highest sales volume.

3. Sean Miller was the top customer by sales but did not appear among the top profitable customers.

4. Customer profitability should be analyzed alongside revenue to identify truly valuable customers.

5. High-revenue customers may contribute less profit due to discounts, product mix, or low-margin purchases.
*/
 /*====================================================
Scenario 7: Monthly Sales Trend Analysis

Business Question:
How have sales changed over time?

Objective:
Analyze monthly sales performance and identify
trends and seasonality patterns.

====================================================*/

SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Sales) AS Total_Sales
FROM Superstore
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;

/*
Insights:

1. Sales fluctuate considerably from month to month,
indicating that demand is not consistent.

2. Sales increased significantly during the last
months of 2014, especially in September, November,
and December.

3. Sales dropped sharply at the beginning of 2015,
suggesting a possible seasonal effect after the
holiday period.

4. The business appears to experience periods of
high and low demand throughout the year, which may
be influenced by promotions, holidays, or customer
buying behavior.

5. Time-series analysis helps identify seasonal
patterns and supports better forecasting and
business planning.
*/

/*====================================================
Scenario 8: Monthly Profit Trend Analysis

Business Question:
How has profit changed over time?

Objective:
Analyze monthly profit trends and identify periods
of high and low profitability.

====================================================*/

SELECT
    YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Profit) AS Total_Profit
FROM Superstore
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Order_Year,
    Order_Month;

/*
Insights:

1. Profit fluctuates considerably from month to month,
indicating inconsistent profitability.

2. Some months generated negative profit, including
July 2014 and January 2015.

3. Negative-profit months show that strong sales do
not necessarily result in positive business outcomes.

4. Profit increased significantly during the last
months of 2014, suggesting strong year-end performance.

5. Time-based profit analysis can help identify
seasonality, business risks, and opportunities for
improving profitability.
*/
/*====================================================
Scenario 9: Top 3 Most Profitable Products in Each Category

Business Question:
Which three products generate the highest profit within each product category?

Objective:
Rank products by total profit within each category
and identify the top three most profitable products.

Skills Used:
- CTE (Common Table Expression)
- ROW_NUMBER()
- PARTITION BY
- GROUP BY
- Window Functions

====================================================*/

WITH RankedProduct AS
(
    SELECT
        Category,
        Product_Name,
        SUM(Profit) AS Total_Profit,
        ROW_NUMBER() OVER
        (
            PARTITION BY Category
            ORDER BY SUM(Profit) DESC
        ) AS Rank
    FROM Superstore
    GROUP BY
        Category,
        Product_Name
)

SELECT
    Category,
    Product_Name,
    Total_Profit,
    Rank
FROM RankedProduct
WHERE Rank <= 3
ORDER BY
    Category,
    Rank;

/*
Results Summary:

This query returns the three most profitable products
within each product category.

Unlike previous scenarios that summarized data,
this analysis ranks individual products separately
inside each category.

Insights:

1. Products are ranked independently within each
   category using the ROW_NUMBER() window function.

2. PARTITION BY Category creates a separate ranking
   for each product category instead of ranking all
   products together.

3. The CTE (RankedProduct) stores the intermediate
   result, making the query easier to read and maintain.

4. Using WHERE Rank <= 3 filters the result to show
   only the top three products in each category.

5. This type of ranking analysis helps businesses
   identify their best-performing products and can
   support decisions related to inventory management,
   promotions, and product strategy.

6. This scenario introduces Window Functions, which
   are essential for advanced SQL data analysis and
   are commonly used in real-world business reporting.
*/
/*====================================================
Scenario 10: Customer Sales Ranking

Business Question:
How are customers ranked based on their total sales?

Objective:
Calculate total sales for each customer and assign
a ranking based on sales performance.

Skills Used:
- SUM()
- GROUP BY
- RANK()
- Window Functions

====================================================*/

SELECT
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    RANK() OVER
    (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank
FROM Superstore
GROUP BY Customer_Name
ORDER BY Customer_Rank;

/*
Results Summary:

This query ranks customers according to their total
sales, allowing the business to identify its highest
value customers.

Insights:

1. Customers are ranked based on their total sales,
   with the highest-selling customer receiving Rank 1.

2. Unlike ROW_NUMBER(), the RANK() function assigns
   the same rank to customers with equal sales values,
   making the ranking fair in the presence of ties.

3. This analysis helps identify VIP customers and
   supports customer segmentation, loyalty programs,
   and targeted marketing campaigns.

4. Window Functions provide ranking information
   without reducing the level of detail in the result.

5. Customer ranking is a common business analysis
   technique used in sales reporting and customer
   relationship management (CRM).
*/
