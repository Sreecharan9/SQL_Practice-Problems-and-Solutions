--------------------
  Query
--------------------
    
SELECT
    survived
    ,COUNT(CASE WHEN pclass = 1 THEN 1 ELSE null END) AS FirstClass
    ,COUNT(CASE WHEN pclass = 2 THEN 1 ELSE null END) AS FirstClass
    ,COUNT(CASE WHEN pclass = 3 THEN 1 ELSE null END) AS FirstClass
FROM
    titanic
GROUP BY 1
ORDER BY 1

--------------------
Output
--------------------
Survived	FirstClass	SecondClass	ThirdClass
0	            11	         6	        42
1	            10	         12	        19

