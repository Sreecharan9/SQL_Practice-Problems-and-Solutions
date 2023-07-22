------------------
Query
-----------------

SELECT 
	customer_id
    ,STRING_AGG(product_id,',') as products
FROM
(
SELECT 
  	*
  	,SUM(cost) OVER(PARTITION BY customer_id ORDER BY cost) as running_sum
FROM 
  	customer_budget A 
INNER JOIN 
  	products B 
  	ON A.budget >= B.cost 
)AS A
WHERE 
	budget > running_sum
GROUP BY 1


------------------
Output
-----------------

| customer_id |   products   |
|------------|--------------|
|    100     |      P1      |
|    200     |   P1, P2     |
|    300     | P1, P2, P3   |

