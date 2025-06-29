--Use blinkit database for this query 
Use blinkit
--Use this table from this dataset
select * from BlinkIT_Grocery_Data

---KPI 
--Calculate the Total sales
SELECT 
ROUND(SUM(Sales),3) AS Total_Sales 
From BlinkIT_Grocery_Data

--Calculate the Average Sales
SELECT 
ROUND(Avg(Sales),1) AS Average_Sales 
From BlinkIT_Grocery_Data

--Calculate the Number of Item
SELECT 
ROUND(COUNT(*),1) AS Number_Of_Item
From BlinkIT_Grocery_Data

--Calculate the Average Rating
SELECT 
ROUND(Avg(Rating),1) AS Average_Rating
From BlinkIT_Grocery_Data


--Calculating item type by KPI
SELECT 
Item_Type,
ROUND(COUNT(*),1) AS Number_Of_Items ,
ROUND(Avg(Sales),1) AS Average_Sales ,
ROUND(avg(rating),1) as Average_Rating,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

--Calculating Fat Content by KPI
Update BlinkIT_Grocery_Data
SET Item_Fat_Content = REPLACE(REPLACE(Item_Fat_Content, 'reg', 'Regular'),'LF', 'Low Fat');

SELECT 
item_fat_content,
ROUND(COUNT(*),1) AS Number_Of_Items ,
ROUND(Avg(Sales),1) AS Average_Sales ,
ROUND(avg(rating),1) as Average_Rating,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Item_fat_content
ORDER BY Total_Sales DESC;

--Calculating Fat Content by Outlet location Type
SELECT 
Outlet_Location_Type,
item_fat_content,
ROUND(COUNT(*),1) AS Number_Of_Items ,
ROUND(Avg(Sales),1) AS Average_Sales ,
ROUND(avg(rating),1) as Average_Rating,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Location_Type, Item_Fat_Content
ORDER BY Total_Sales DESC;

--Calculating total sales based on Outlet Establishment Year
SELECT 
Outlet_Establishment_Year,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC;

--Calculate Total Sales based on Outlet Size

SELECT 
Outlet_Size,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Size
ORDER BY Total_Sales ASC;

--Calculate Total Sales based on Outlet Location

SELECT 
Outlet_Location_Type,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales ASC;

--Calculating Total Sales, Average Sales, Average Rating, Item Visibility,No of Items by Outlet Location Type
SELECT 
OUTLET_TYPE,
ROUND(Avg(Item_Visibility),2) AS Item_Visibility,
ROUND(COUNT(*),1) AS Number_Of_Items ,
ROUND(Avg(Sales),1) AS Average_Sales ,
ROUND(avg(rating),1) as Average_Rating,
ROUND(SUM(Sales),3) AS Total_Sales 
FROM BlinkIT_Grocery_Data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

