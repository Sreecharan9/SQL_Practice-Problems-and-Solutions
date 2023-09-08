--------------------
Query
--------------------

WITH details as 
(
SELECT *,
CASE WHEN A.designation <> B.designation THEN 'promoted'
     WHEN A.designation = B.designation THEN NULL
     WHEN B.designation IS NULL THEN 'Resigned'
     WHEN A.designation IS NULL AND B.designation IS NOT NULL THEN 'New' END as status
FROM emp_2020 A 
FULL OUTER JOIN emp_2021 B 
USING(emp_id)
)

SELECT emp_id,status
FROM details
WHERE status IS NOT NULL

---------------------
Output
---------------------

| emp_id |   status   |
|--------|------------|
|   1    |  promoted  |
|   3    |  promoted  |
|   4    |  Resigned  |
|   5    |     New    |

