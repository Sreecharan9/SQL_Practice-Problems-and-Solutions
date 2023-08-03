-------------------
Query
-------------------

WITH projects as
(
SELECT  
    a.id as project_id
    ,a.title as Title
    ,budget
    ,SUM(c.salary) as total_salary
    ,end_date-start_date as Duration
    ,ROUND((end_date-start_date)*1.0/365,2) as project_tenure
    ,CEILING(SUM(c.salary)*(end_date-start_date)*1.0/365) as prorated_emp_expense
FROM 
    linkedin_projects a
INNER JOIN 
    linkedin_emp_projects b 
    ON a.id = b.project_id
INNER JOIN 
    linkedin_employees c 
    ON b.emp_id = c.id
GROUP BY 1,2,3,5,6
ORDER BY a.id
)

SELECT 
    Title
    ,budget
    ,prorated_emp_expense
FROM 
    projects
WHERE 
    prorated_emp_expense > budget


------------------
Output
------------------

|    title   | budget | prorated_emp_expense |
|------------|--------|----------------------|
|  Project1  |  29498 |        36293         |
|  Project2  |  32487 |        52870         |
|  Project4  |  15776 |        30656         |
|  Project6  |  41611 |        63230         |
|  Project9  |  32341 |        44691         |
| Project11  |  11705 |        31606         |
| Project12  |  10468 |        62843         |
| Project14  |  30014 |        36774         |
| Project16  |  19922 |        21875         |
| Project18  |  10302 |        46381         |
| Project20  |  19497 |        55962         |
| Project21  |  24330 |        57310         |
| Project22  |  18590 |        20090         |
| Project24  |  11918 |        74665         |
| Project25  |  38909 |        57975         |
| Project26  |  36190 |        79368         |
| Project29  |  10935 |        48371         |
| Project30  |  24011 |        53106         |
| Project32  |  12356 |        66523         |
| Project33  |  30110 |        50034         |
| Project34  |  16344 |        23102         |
| Project35  |  23931 |        28652         |
| Project36  |   4676 |        25253         |
| Project37  |   8806 |        61949         |
| Project42  |  24934 |        28301         |
| Project44  |  22885 |        49271         |
| Project46  |   9824 |        42314         |
| Project50  |  18915 |        23608         |
