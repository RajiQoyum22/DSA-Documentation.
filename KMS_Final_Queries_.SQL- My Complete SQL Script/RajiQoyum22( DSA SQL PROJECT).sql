CREATE DATABASE MY_DSA_PROJECT_KMS
GO

USE MY_DSA_PROJECT_KMS;

/*
CREATE TABLE SalesData(
		Row_ID INT,
		Order_ID INT,
		Order_Date DATE,
		Order_Priority VARCHAR(50),
		Order_Quantity INT,
		Sales FLOAT,
		Discount FLOAT,
		Ship_Mode VARCHAR(50),
		Profit FLOAT,
		Unit_Price FLOAT,
		Shipping_Cost FLOAT,
		Customer_Name VARCHAR(100),
		Province VARCHAR(50),
		Region VARCHAR(50),
		Customer_Segment VARCHAR(50),
		Product_Category VARCHAR(50),
		Product_Sub_Category VARCHAR(100),
		Product_Name VARCHAR(255),
		Product_Container VARCHAR(50),
		Product_Base_Margin FLOAT,
		Ship_Date DATE
);
*/

SELECT *
FROM [dbo].[KMS Sql Case Study]



--Q1:- WHICH PRODUCT CATEGORY HAD THE HIGHEST SALES?

SELECT Product_Category, SUM(Sales) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Product_Category
ORDER BY Total_Sales DESC;


--Q2:- TOP 3 AND BOTTOM 3 REGIONS BY SALES
-- TOP 3

SELECT TOP 3 Region, SUM(Sales) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales DESC;

-- BOTTOM 3

SELECT TOP 3 Region, SUM(Sales) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Region
ORDER BY Total_Sales ASC;


--Q3:- TOTAL SALES OF APPLIANCES IN ONTARIO

SELECT SUM(Sales) AS Total_Appliances_Sales_Ontario
FROM [dbo].[KMS Sql Case Study]
WHERE Province = 'Ontario' AND Product_Sub_Category = 'Appliances';


--Q4:- ADVICE FOR BOTTOM 10 CUSTOMERS BY SALES

-- The bottom 10 customers contribute the least to revenue but may offer untapped growth potential.
-- 1-Through Loyalty programs i.e :- Reward every purchase with points that can be redeemed on future orders- especially for inactive or low_value buyers.
-- 2-Through Personalized engagement i.e :- Send tailored discount codes or product bundles to these customers based on their industry or past purchases.
-- 3- Offer Time-Limited Flash Sales or Exclusive Early Access
--- i.e:-  Let them feel special by giving early access to new products or limited-time offers available only to selected users.
-- 4- Perform Customer Segmentation i.e :- Segment these customers based on business type, geography, or frequency. A local approach may work better for small clusters.
-- 5- Assign a Dedicated Sales Representative i.e :- Personalized service can make small clients feel more valued and increase their engagement over time.


SELECT TOP 10 Customer_Name, SUM(Sales) AS Total_Sales
FROM [dbo].[KMS Sql Case Study]
GROUP BY Customer_Name
ORDER BY Total_Sales ASC;


--Q5:- SHIPPING METHOD WITH THE HIGHEST SHIPPING COST

SELECT Ship_Mode, SUM(Shipping_Cost) AS Total_Shipping_Cost
FROM[dbo].[KMS Sql Case Study]
GROUP BY Ship_Mode
ORDER BY Total_Shipping_Cost DESC;



--Q6:- MOST VALUABLE CUSTOMERS AND WHAT THEY BUY

SELECT
	Customer_Name,
	SUM(Sales) AS Total_Sales, 
	STRING_AGG(Product_Category, ', ') AS Products
	FROM ( SELECT DISTINCT Customer_Name, Product_Category, Sales
	FROM [dbo].[KMS Sql Case Study]) AS Distinct_Data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;


--Q7:- HIGHEST SALES FROM SMALL BUSINESS SEGMENT

SELECT Customer_Name, SUM(Sales) AS Total_Sales
FROM[dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Small Business'
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;


--Q8:- CORPORATE CUSTOMER WITH MOST ORDERS (2009 - 2012)

SELECT Customer_Name, COUNT(*) AS Total_Orders
FROM[dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Corporate' AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Name
ORDER BY Total_Orders DESC;


--Q9:- MOST PROFITABLE CONSUMER

SELECT Customer_Name, SUM(Profit) AS Total_Profit
FROM [dbo].[KMS Sql Case Study]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Name
ORDER BY Total_Profit DESC;


--Q10:- WHICH CUSTOMERS RETURNED ITEMS
-- HERE ORDER_ID ON THE MAIN TABLE CONTAIN DUPLICATE
-- FIRST CHECK THE CONTENT AFTER IMPORTING THE FILE

SELECT *
FROM [dbo].[Order_Status]

-- TOP 10 CUSTOMERS THAT RETURNED ITEMS


SELECT TOP 10
	sd.Customer_Name,
	sd.Customer_Segment,
	COUNT(*) AS Return_Count
FROM[dbo].[KMS Sql Case Study] sd
JOIN [dbo].[Order_Status] os
	ON sd.Order_ID = os.Order_ID
WHERE os.Status = 'Returned'
GROUP BY sd.Customer_Name, sd.Customer_Segment
ORDER BY Return_Count DESC;

--Q11:- ORDER PRIORITY VS SHIPPING METHOD ANALYSIS

SELECT Order_Priority, Ship_Mode, COUNT(*) AS Order_Count,
								  AVG(Shipping_Cost) AS Avg_Shipping_Cost
FROM [dbo].[KMS Sql Case Study]
GROUP BY Order_Priority, Ship_Mode
ORDER BY Order_Priority, Avg_Shipping_Cost DESC;

