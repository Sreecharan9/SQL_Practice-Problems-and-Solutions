-----------------
Query
-----------------

WITH a1 AS 
(
SELECT UNNEST(STRING_TO_ARRAY(chips,',')) AS Chips,UNNEST(STRING_TO_ARRAY(amt,',')) as price
FROM chips_table
)
SELECT *
FROM a1
WHERE chips IS NOT NULL

--------------------
Output
--------------------

|       Chips      |  Price  |
|------------------|---------|
|     lays1        |   10    |
|  uncle_chips1    |   20    |
|     kurkure1     |   30    |
|    wafferrs2     |   40    |
|  potatochips3    |   60    |
|   hotchips3      |   70    |
|     balaji3      |   80    |
