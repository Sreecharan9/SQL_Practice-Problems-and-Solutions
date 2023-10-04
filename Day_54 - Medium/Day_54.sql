-------------------
Query
-------------------

SELECT 
    id
    ,CASE WHEN MOD(id,2)<> 0 THEN LEAD(student,1,student) OVER() 
          WHEN MOD(id,2) = 0 THEN LAG(student,1) OVER() END AS student
FROM 
    seats_table

--------------------
Output
--------------------

|  ID  | Student |
|------|---------|
|  1   |    D    |
|  2   |    A    |
|  3   |    G    |
|  4   |    E    |
|  5   |    J    |
