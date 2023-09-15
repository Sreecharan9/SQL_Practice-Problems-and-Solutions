--------------------
Query
--------------------

WITH companies as 
(
SELECT company
FROM
(
SELECT *,
  	LEAD(revenue,1,NULL) OVER(PARTITION BY company ORDER By company,year) as next
FROM 
  	company_revenue
) A 
WHERE 
  	revenue > next 
)

SELECT 
	DISTINCT company
FROM 
	company_revenue
WHERE 
	company NOT IN ( SELECT company FROM companies)

--------------------
Output
--------------------

| Company |
| ------- |
|   ABC1  |
