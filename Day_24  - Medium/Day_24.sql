--------------------
My Initial Query
-------------------

WITH CTE1 as
(
SELECT 
  	A.id
  	,A.name as name1
  	,A.group_name as group_name1
  	,b.name as name2
  	,CASE WHEN A.name =  B.name AND (COUNT(*) OVER(PARTITION BY A.group_name) > 1) THEN 0 ELSE 1 END AS sts
FROM 
  	peoples A 
INNER JOIN 
  	peoples B ON (A.group_name =  B.group_name)
)

SELECT 
	a1.id
    ,name1
    ,group_name1
    ,STRING_AGG(CASE WHEN nm1 = nm2 THEN NULL ELSE nm2 END,',') as name2
from 
	A1
WHERE 
	sts = 1
GROUP BY 1,2,3
ORDER BY 1



-------------------
Output
-------------------
  
| id |  name1  | group_name1 | associated_people |
|----|---------|-------------|-------------------|
| 1  |  john   |   Group-A   |    jack, gery     |
| 2  |  smith  |   Group-B   |   rayan, andy     |
| 3  |  kevin  |   Group-C   |   isac, emman     |
| 4  |  rose   |   Group-D   |      null         |
| 5  |  jack   |   Group-A   |    john, gery     |
| 6  |  andy   |   Group-B   |   rayan, smith    |
| 7  |  rayan  |   Group-B   |   smith, andy     |
| 8  |  gery   |   Group-A   |    john, jack     |
| 9  |  emman  |   Group-C   |   isac, kevin     |
| 10 |  isac   |   Group-C   |   emman, kevin    |


-------------------
Optimized Query
-------------------

select
	id
	,name
	,group_name
	,string_agg(name,',') over
	    (
            partition by group_name
            rows between unbounded preceding and unbounded following exclude current row
	    ) as assoicated_people
from
    peoples 
order by id ;
