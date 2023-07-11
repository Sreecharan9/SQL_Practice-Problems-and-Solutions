-----------------
Query
----------------

WITH CTE1 as
(
SELECT
    hire_date
    ,LEAD(hire_date,1,hire_date) OVER(ORDER BY hire_date)
    ,LEAD(hire_date,1,hire_date) OVER(ORDER BY hire_date) - hire_date as Not_Hiring_longest_Period
FROM 
    uber_employees
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1
),

CTE2 AS
(
SELECT 
    termination_date
    ,LEAD(termination_date,1,termination_date) OVER(ORDER BY termination_date)
    ,LEAD(termination_date,1,termination_date) OVER(ORDER BY termination_date)-termination_date AS Not_Firing_Longest_Period
FROM uber_employees
WHERE termination_date IS NOT NULL
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1
)

SELECT 
    Not_Hiring_longest_Period
    ,Not_Firing_Longest_Period
FROM
    CTE1,CTE2


----------------
Outout
----------------
| not_hiring_longest_period | not_firing_longest_period |
|--------------------------|--------------------------|
|           269            |           337            |
