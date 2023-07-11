Input:

+----+----+
|col1|col2|
+----+----+
| 1| 2|
| 2| 5|
+----+----+

Expected Output:

+----+--------+
|col1|col2_exp|
+----+--------+
| 1| 1|
| 1| 2|
| 2| 1|
| 2| 2|
| 2| 3|
| 2| 4|
| 2| 5|
+----+--------+

----------------
Create Script
----------------


SELECT 
    a.col1
   ,b.list as col2_exp
FROM 
	test10 A
INNER JOIN (SELECT GENERATE_SERIES(MIN(col1),MAX(col2)) as list FROM test10) b 
ON a.col1 = b.list OR A.col2 >= b.list


-------------------
Output
-------------------

+----+--------+
|col1|col2_exp|
+----+--------+
| 1| 1|
| 1| 2|
| 2| 1|
| 2| 2|
| 2| 3|
| 2| 4|
| 2| 5|
+----+--------+
