-------------------
Query
--------------------
WITH a1 as
(
SELECT 
    first_name
    ,order_date
    ,SUM(total_order_cost) as total
FROM 
    orders a 
INNER JOIN customers b ON (a.cust_id = b.id)
WHERE 
    order_date BETWEEN '2019-02-01' AND '2019-05-01'
GROUP BY 1,2
ORDER BY 3 DESC
)

SELECT 
    first_name
    ,total as total_order_cost
    ,order_date
FROM 
    a1
WHERE 
    total = (SELECT max(total) from a1)

-------------------
Output
-------------------
| first_name | total_order_cost | order_date |
|------------|------------------|------------|
|    Jill    |       275        | 4/19/2019  |
