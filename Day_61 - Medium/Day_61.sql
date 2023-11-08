--------------------
Query
--------------------

WITH a1 as
(
SELECT *,
  	ROW_NUMBER() OVER() as rn
FROM 
  	Teams
)

SELECT 
	A.Team || ' VS ' || B.Team as Matches
FROM 
	a1 A
INNER JOIN 
	a1 B 
ON A.rn < B.rn

-------------------
Output
-------------------

+-----------------------+
|       Matches       |
+-----------------------+
|  India VS Pakistan  |
| India VS Sri Lanka  |
| India VS Australia  |
| Pakistan VS Sri Lanka|
| Pakistan VS Australia |
| Sri Lanka VS Australia|
+-----------------------+

