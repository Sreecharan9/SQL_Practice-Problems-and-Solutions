-------------------
Query
------------------

SELECT 
    COUNT(CASE WHEN address IS NOT NULL THEN 1 ELSE NULL END)*1.0/COUNT(*)*100 AS Orders_Percentage
FROM 
    orders a 
LEFT JOIN 
    customers b ON (a.cust_id = b.id)

--------------------
Output
--------------------

| orders_percentage |
|-------------------|
|        28         |


