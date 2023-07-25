-------------------
Query
-------------------

WITH retention AS
(SELECT 
	cust_id
    ,to_char(order_date,'MM') as Month_Num
    ,EXTRACT('month' FROM order_date)-EXTRACT('month' FROM LAG(order_date,1,order_date) OVER(PARTITION BY cust_id ORDER BY order_id)) as earlier_order
FROM transactions
)

SELECT 
	TO_CHAR(to_date(Month_Num::Text,'MM'),'Month') AS Month_Name
    ,SUM(earlier_order) as retention_count
FROM 
	retention
GROUP BY 
	1,Month_Num
ORDER BY Month_Num


-------------------
Output
-------------------

| month_name | retention_count |
|------------|-----------------|
|  January   |       0         |
|  February  |       3         |
