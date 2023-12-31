------------------
Query
------------------

SELECT 
	id1||' '||person1||','||' '||id2||' '||person2 as names
FROM
(
SELECT 
  A.id as id1
  ,A.person as Person1
  ,B.id as id2
  ,B.person as Person2
  ,ROW_NUMBER() OVER() as rn
FROM 
  persons A 
INNER JOIN persons B 
ON B.id -A.id = 1
) C 
WHERE MOD(rn,2) <> 0

-------------------
Output
-------------------

|        names         |
|----------------------|
| 1 Person1, 2 Person2 |
| 3 Person3, 4 Person4 |
| 5 Person5, 6 Person6 |
| 7 Person7, 8 Person8 |
| 9 Person9, 10 Person10|

