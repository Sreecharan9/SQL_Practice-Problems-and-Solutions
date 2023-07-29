-------------------
Query
-------------------

WITH a1 AS
(
SELECT *
FROM 
  	event_status
WHERE 
  	status = 'off'
),
a2 AS
(
SELECT 
  	A.event_time
  	,MIN(a1.event_time) AS end_time
FROM 
  	event_status a 
INNER JOIN a1 ON (A.event_time < a1.event_time)
WHERE 
  	A.status <> a1.status
GROUP BY 
  	1,A.status,a1.status
ORDER BY 1
),

a3 AS
(
SELECT 
  	DISTINCT FIRST_VALUE(event_time) OVER(PARTITION BY end_time ORDER BY end_time) as start_time
  	,end_time
FROM 
  	a2
)

SELECT 
	start_time as login
	,end_time as log_out
	,EXTRACT('MINUTES' FROM end_time::time - start_time::time) as "count"
FROM 
	a3

------------------
Outout
-------------------
| login | log_out | count |
|-------|---------|-------|
| 10:01 |  10:04  |   3   |
| 10:07 |  10:09  |   2   |
| 10:11 |  10:12  |   1   |
