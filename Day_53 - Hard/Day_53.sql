-------------------
Query
-------------------
WITH a1 AS
(
sELECT *
  ,COUNT(customer_id) OVER(PARTITION BY customer_id ORDER BY order_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as running_count
  ,CASE WHEN COUNT(customer_id) OVER(PARTITION BY customer_id ORDER BY order_id ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) = 1 tHEN 'NC' ELSE 'OC' END as sts 
from customer_orders1
ORDER By order_id
)

SELECT 
	order_date
	,COUNT(CASE WHEN sts = 'NC' THEN 1 END) AS New_Customers
        ,COUNT(CASE WHEN sts = 'OC' THEN 1 END) AS Old_Customers
FROM a1
GROUP BY 1
ORDER BY 1

--------------------
Output
--------------------

| Order_Date | New_Customers | Old_Customers |
|------------|---------------|---------------|
| 2022-01-01 |      3        |       0       |
| 2022-01-02 |      2        |       1       |
| 2022-01-03 |      1        |       2       |
