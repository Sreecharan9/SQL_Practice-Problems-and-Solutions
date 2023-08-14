--------------------
Query
-------------------

WITH CTE AS
(
SELECT 
    customer_id
    ,COUNT(*) as number_of_events
    ,DENSE_RANK() OVER(order by COUNT(*)) as rnk
FROM 
    fact_events
WHERE
    client_id LIKE '%mobile%'
GROUP BY 1
)
SELECT 
    customer_id
    ,number_of_events 
FROM 
    CTE 
WHERE 
    rnk<=2
