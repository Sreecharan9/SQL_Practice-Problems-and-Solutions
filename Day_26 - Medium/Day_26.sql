--------------------
Query
-------------------
SELECT 
    company_id,
    COUNT(DISTINCT user_id) AS users
FROM
(
    SELECT 
        company_id,
        user_id,
        COUNT(DISTINCT language) AS languages_count
    FROM 
        company_users
    WHERE 
        language IN ('English', 'German')
    GROUP BY company_id, user_id
) AS A 
WHERE languages_count = 2
GROUP BY company_id
HAVING COUNT(DISTINCT user_id) >= 2;

--------------------
Output
--------------------
| company_id | users |
|------------|-------|
|     1      |   2   |



