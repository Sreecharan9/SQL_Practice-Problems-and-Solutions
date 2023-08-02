-------------------
Query
-------------------
WITH a1 as
(
SELECT 
    state
    ,COUNT(stars) as n_businesses
    ,RANK() OVER (ORDER BY COUNT(stars) DESC) as rn
FROM 
    yelp_business
WHERE 
    stars=5
GROUP BY 1
)

SELECT 
    state
    ,n_businesses
FROM 
    a1
WHERE 
    rn<=5
ORDER BY 2 DESC
