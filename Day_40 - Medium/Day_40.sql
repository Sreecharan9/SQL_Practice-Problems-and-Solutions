-----------------
Query
-----------------

WITH a1 as
(SELECT 
    first_name
    ,department
    ,salary
    ,ROW_NUMBER() OVER(Partition by department ORDER BY salary DESC) as rn
FROM 
    employee
)

SELECT 
    department
    ,salary
    ,first_name as employee_name
FROM 
    a1
WHERE 
    rn = 1
ORDER BY 2 DESC


------------------
Output
------------------

|  department  | salary | employee_name |
|--------------|--------|---------------|
| Management   | 250000 |    Richerd    |
| Sales        |   2200 |     Mick      |
| Audit        |   1100 |   Shandler    |

