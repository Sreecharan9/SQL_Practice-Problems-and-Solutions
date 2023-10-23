------------------
Query
------------------

1)
WITH customers AS
(
SELECT
    order_date
    ,CASE
      WHEN COUNT(customer_id) OVER (PARTITION BY customer_id ORDER BY order_id) > 1 THEN NULL
      ELSE customer_id
    END AS new_c
    ,CASE
      WHEN COUNT(customer_id) OVER (PARTITION BY customer_id ORDER BY order_id) <> 1 THEN 1
      ELSE 0
    END AS repetitive_c
FROM customer_orders
ORDER BY order_id
)

SELECT
  order_date
  ,COUNT(new_c) AS new_customers
  ,SUM(repetitive_c) AS repeated_customers
FROM customers
GROUP BY 1
ORDER BY 1;

2)

WITH a1 as 
(
SELECT *
  	,COUNT(customer_id) OVER(PARTITION BY customer_id ORDER BY order_id) as cnt
  	,COUNT(*) OVER(PARTITION BY order_date) as overall_cnt
FROM customer_orders
ORDER By order_id
)

SELECT 
	order_date
	,COUNT(*) as new_customers
  ,overall_cnt-COUNT(*) as repeated_customers
FROM a1
WHERE cnt = 1
group by 1,overall_cnt


-------------------
Output
-------------------

| order_date  | new_customers | repeated_customers |
|------------|---------------|--------------------|
| 2022-01-01 |      3        |         0          |
| 2022-01-02 |      2        |         1          |
| 2022-01-03 |      1        |         2          |

