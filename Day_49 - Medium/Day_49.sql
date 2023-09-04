-------------------
Query
-------------------
WITH salaries AS
(
SELECT *,
DENSE_RANK() OVER(PARTITION BY domain ORDER BY salary DESC) as rank_no
FROM employee_salary
ORDER BY domain
)

SELECT domain,MIN(salary) as salary
FROM salaries
WHERE rank_no <= 3
GROUP BY 1

--------------------
Output
-------------------
|    domain    |  salary  |
|--------------|----------|
|   Finance    |  57120   |
| Health Care  |  80798   |
|      HR      |  39498   |
|     Sales    |  85241   |
