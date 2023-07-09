--------------------
Query
--------------------
WITH cte1 AS
  (SELECT business_name
          ,EXTRACT('year' FROM inspection_date) AS "year",
          ,inspection_score
          ,DENSE_RANK() OVER(PARTITION BY EXTRACT('year'FROM inspection_date) ORDER BY inspection_score DESC) AS "rank"
   FROM sf_restaurant_health_violations
   WHERE inspection_score IS NOT NULL
   ORDER BY 2,3 DESC)
  
SELECT business_name,
       YEAR,
       inspection_score
FROM cte1
WHERE "rank" = 1
--------------------
Output:
--------------------

Business_name	                                                    Year	         Inspection_score
Castro Street Chevron	                                            2015	              100
MARTIN L. KING MIDDLE SCHOOL	                                    2015	              100
Taco Bell Cantina #31685	                                        2016	              100
MV Taurus	                                                        2016	              100
Hilton Financial District- Restaurant Seven Fifty	                2016	              100
Crepe and Brioche, Inc.	                                          2016	              100
Yerba Buena Tea Co (formerly Tea Smiths of SF)	                  2016	              100
Project Juice	                                                    2016	              100
Bebebar Juice & Sandwich	                                        2016	              100
Jersey	                                                          2017	              100
North Point Market	                                              2018	              100
