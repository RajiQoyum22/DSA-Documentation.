# DSA-Project_Documentation
KMS Sales SQL Analysis Project

Final Project – Data Analyst SQL Class

DSA _ Incubator Hub

👨‍💻 By: Raji Qoyum Oladimeji
###  📂 Project Overview

This project involves analyzing KMS Sql Case Study using SQL Server. It includes complex SQL operations such as joins, aggregations, data cleaning, and business insights to help KMS make better decisions.

### 🗃️ Datasets Used

- KMS Sql Case Study — Main dataset including orders, customers, products, and shipping.
- Order_Status — Additional dataset showing returned orders.

### 🔍 Business Questions Answered

1.1. Which product category had the highest sales?

2.2. What are the top 3 and bottom 3 regions in terms of sales?

3.3. What were the total sales of appliances in Ontario?

4.4. Advice for KMS on bottom 10 customers

5.5. Which shipping method incurred the most cost?

6.6. Who are the most valuable customers and what do they buy?

7.7. Which small business customer had the highest sales?

8.8. Which corporate customer placed the most orders (2009–2012)?

9.9. Who is the most profitable consumer?

10.10. Which customers returned items and their segments?

11.11. Was the shipping method appropriate for the order priority?

### 🧾 Key SQL Concepts Used

- GROUP BY, SUM, COUNT, AVG

- JOIN (handling duplicates with subqueries)

- STRING_AGG, FOR XML PATH for text aggregation

- CASE, ORDER BY, DISTINCT, WHERE

- Data Cleaning & De-duplication

### 🧩 Sample Query: TOP 10 CUSTOMERS THAT RETURNED ITEMS

```
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

```

### ✅ Result Highlights

- Top product category: Technology
  
- Most valuable customer: Barry French
  
- Most used shipping method: Regular Air
  
- Returned orders linked to Consumer segment

### 📈 Tools & Tech Stack

- SQL Server 2022
  
- SSMS (SQL Server Management Studio)
  
- Excel (for initial data view)
  
- GitHub (for version control)

### 🎓 Final Notes

This project showcases my ability to:

- Clean and join multiple datasets
  
- Write performant SQL queries
  
- Extract business insights from raw data

### 🔗 Connect with Me

📧 Email: rajiqoyum09@gmail.com

📍 LinkedIn: https://www.linkedin.com/in/raji-qoyum-oladimeji
