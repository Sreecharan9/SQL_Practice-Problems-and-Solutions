-------------------
Query
-------------------

WITH retention AS
(SELECT 
    to_char(order_date,'MM') as Month_Num
    ,CASE WHEN EXTRACT('month' FROM order_date)-EXTRACT('month' FROM LAG(order_date,1,order_date) OVER(PARTITION BY cust_id ORDER BY order_id)) = 0 THEN NULL 
	  ELSE cust_id END as earlier_order_Cust
FROM transactions
)

SELECT 
	month_num
	,COUNT(earlier_order_cust)
 FROM retention
 GROUP BY 1

-------------------
Output
-------------------

| Month | retention_count |
|-------|-----------------|
|   01  |       0         |
|   02  |       3         |

