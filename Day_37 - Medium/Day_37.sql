-----------------
Query
-----------------

SELECT 
    DISTINCT jobtitle
    ,COUNT(CASE WHEN benefits IS NULL OR benefits = 0 THEN 1 ELSE NULL END) OVER(PARTITION BY jobtitle) as without_benefits
    ,COUNT(id) OVER(PARTITION BY jobtitle) as Total_employees
    ,COUNT(CASE WHEN benefits IS NULL OR benefits = 0 THEN 1 ELSE NULL END) OVER(PARTITION BY jobtitle)*1.0/COUNT(id) OVER(PARTITION BY jobtitle) as Ratio
FROM 
    sf_public_salaries
ORDER BY 4

----------------
Output
----------------

|                     jobtitle                     | without_benefits | total_employees |  ratio   |
|--------------------------------------------------|------------------|----------------|----------|
|         Eligibility Worker                      |        0         |      11        |    0     |
| EMT/Paramedic/Firefighter                      |        0         |      16        |    0     |
|      Estate Investigator                       |        0         |       4        |    0     |
|     IS Programmer Analyst                      |        0         |       1        |    0     |
| IS Programmer Analyst-Senior                   |        0         |       1        |    0     |
| Junior Administrative Analyst                  |        0         |       3        |    0     |
| PS Aide Health Services                        |        0         |       1        |    0     |
| Public Service Trainee                         |        0         |       8        |    0     |
| Public Svc Aide-Public Works                   |        0         |      23        |    0     |
|         Registered Nurse                       |        0         |      21        |    0     |
|   Senior Eligibility Worker                    |        0         |       1        |    0     |
|           Sergeant 3                            |        0         |       8        |    0     |
|         Special Nurse                          |        0         |      23        |    0     |
|        Transit Operator                        |        1         |      47        | 0.021    |
|       Deputy Sheriff                           |        1         |      18        | 0.056    |
|            Firefighter                        |        1         |       5        |  0.2     |
|   CAPTAIN III (POLICE DEPARTMENT)               |        5         |       5        |    1     |
| GENERAL MANAGER-METROPOLITAN TRANSIT AUTHORITY  |        2         |       2        |    1     |
|            LIBRARY PAGE                        |        1         |       1        |    1     |
| SENIOR PHYSICIAN SPECIALIST                     |        1         |       1        |    1     |
