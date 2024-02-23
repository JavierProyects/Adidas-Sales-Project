
-- TOTAL SALES IN MILLIONS (TOTAL SALES BY ADIDAS)
SELECT SUM(Total_Sales) AS Total_Sales_Revenue
FROM Invoice; 
 
-- TOTAL SALES GROUP BY RETAILER NAME (QUESTION): WHICH RETAILER GAVE ADIDAS MORE PROFIT WHEN SELLING THEIR SHOES? 
SELECT Retailer, SUM(`Total Sales`) AS Total_Sales
FROM `Adidas Sales`
GROUP BY Retailer;

-- TOTAL UNITS SOLD GROUP BY STATE (QUESTION): DOES COLD OR HOT WEATHERS INFLUENCE ON SELLING SHOES? DOES ADIDAS SELL MORE IN FANCY/CONDENSE STATES OR TRADITIONAL AREAS? AND WHY?
SELECT State, SUM(`Units Sold`) AS Total_Units_Sold
FROM `Adidas Sales`
GROUP BY State
ORDER BY Total_Units_Sold DESC;

-- TOTAL SALES BY SALES METHOD (QUESTIONS): WHICH SALES METHOD IS MORE EFFECTIVE? AND WHY IS THAT? PEOPLE PREFER TO BUY SHOES IN STORE SO THEY CAN TRY THEM?
SELECT `Sales Method`, SUM(`Total Sales`) AS Total_Sales
FROM `Adidas Sales`
GROUP BY `Sales Method`;

-- TOTAL PROFIT BY SALES METHOD
SELECT `Sales Method`, SUM(`Operating Profit`) AS Total_Profit
FROM `Adidas Sales`
GROUP BY `Sales Method`;
-- we calculated the profit margin for each sales method by summing up the operating profit and total sales for each sales method group and then calculating the profit margin as a percentage of total sales. This calculation gave us the profit margin for each sales method based on the total profit and total sales within each group.
SELECT 
    `Sales Method`,
    SUM(`Total Sales`) AS Total_Sales,
    SUM(`Operating Profit`) AS Total_Profit,
    (SUM(`Operating Profit`) / SUM(`Total Sales`)) * 100 AS Profit_Margin
FROM `Adidas Sales`
GROUP BY `Sales Method`;

-- Average Calculation: In the average calculation, we calculated the profit margin for each individual record within each sales method group and then averaged these profit margins across all records within each group. This calculation gives us the average profit margin for each sales method based on the profit margin of each individual transaction within each group.
SELECT 
    `Sales Method`,
    AVG((`Operating Profit` / `Total Sales`) * 100) AS Average_Profit_Margin
FROM `Adidas Sales`
GROUP BY `Sales Method`;

-- TOTAL SALES BY MONTH (QUESTIONS): DOES THE MONTH OF THE YEAR INFLUENCE THE QUNATITY OF SHOES SOLD BY ADIDAS? THEY SELL MORE OR LESS DEPENDING THE SEASON?
SELECT MONTH(Invoice_Date) AS Month, 
       SUM(Total_Sales) AS Total_Sales
FROM Invoice
GROUP BY MONTH(Invoice_Date)
ORDER BY Total_Sales DESC;

-- TOTAL SALES BY SEASON
SELECT 
    Season,
    SUM(Total_Sales) AS Total_Sales
FROM Season_Sales
GROUP BY Season
ORDER BY Total_Sales DESC;

-- Top Selling Products by Total Units Sold
SELECT Product, SUM(`Units Sold`) AS Total_Units_Sold
FROM `Adidas Sales`
GROUP BY Product
ORDER BY Total_Units_Sold DESC;

-- Top Selling Products by Total Sales Amount
SELECT Product, SUM(`Total Sales`) AS Total_Sales_Amount
FROM `Adidas Sales`
GROUP BY Product
ORDER BY Total_Sales_Amount DESC;

-- Month-over-Month Sales Growth
SELECT 
    YEAR(`Invoice Date`) AS Year, 
    MONTH(`Invoice Date`) AS Month, 
    SUM(`Total Sales`) AS Total_Sales
FROM `Adidas Sales`
GROUP BY YEAR(`Invoice Date`), MONTH(`Invoice Date`)
ORDER BY Year, Month;

-- Year-over-Year Sales Growth
SELECT 
    YEAR(`Invoice Date`) AS Year, 
    SUM(`Total Sales`) AS Total_Sales
FROM `Adidas Sales`
GROUP BY YEAR(`Invoice Date`)
ORDER BY Year;


SELECT * FROM `Adidas Sales`;
SELECT * FROM Season_Sales;