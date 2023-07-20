------------------
Intitial Query of mine
------------------
WITH a1 AS 
(
    SELECT 
        DISTINCT quarter AS q1
    FROM
        stores
),
a2 AS 
(
    SELECT
        DISTINCT store AS s1
    FROM
        stores
),
a3 AS
(
    SELECT *
    FROM a1 
    CROSS JOIN a2
    ORDER BY s1, q1
),
a4 AS
(
    SELECT 
        store
        ,quarter
    FROM stores
)
SELECT 
    s1 AS store
    ,q1 AS quarter
FROM 
    a3
LEFT JOIN 
    a4 ON a3.q1 = a4.quarter AND a3.s1 = a4.store
WHERE store IS NULL;



------------------
Output
-----------------
| Store | Quarter |
|-------|---------|
|   S1  |   Q3    |
|   S2  |   Q2    |
|   S3  |   Q4    |
