-----------------
Query
-----------------
SELECT 
      date
      ,SUM(total) OVER (ORDER BY date) AS running_total
FROM 
(
SELECT 
      transaction_at AS date
      ,SUM(amount) AS total
FROM 
      transactions
GROUP BY transaction_at
ORDER BY transaction_at
) A;

--------------------
Output
------------------

|        DATE         | RUNNING_TOTAL |
|---------------------|---------------|
| 2022-01-01T00:00:00.000Z |    300.00    |
| 2022-01-02T00:00:00.000Z |    350.00    |
| 2022-01-03T00:00:00.000Z |    700.00    |
| 2022-01-04T00:00:00.000Z |    800.00    |
| 2022-01-05T00:00:00.000Z |    925.00    |
| 2022-01-06T00:00:00.000Z |   1125.00    |


