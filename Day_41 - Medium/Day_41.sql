----------------
Query
----------------
SELECT 
    EXTRACT('year' FROM inspection_date) as year,COUNT(violation_id) as no_of_violations
FROM 
    sf_restaurant_health_violations
WHERE 
    business_name = 'Roxanne Cafe' 
GROUP BY 1
ORDER BY 2

-----------------
Output
------------------

|  year  | no_of_violations |
|--------|------------------|
|  2016  |        2         |
|  2018  |        3         |
|  2015  |        5         |
