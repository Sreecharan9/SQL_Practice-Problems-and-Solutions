------------------
Query
------------------

SELECT
  date_sold,
  ABS(MIN(CASE WHEN product = 'Cake' THEN COALESCE(amount_sold, 0) END) - MIN(CASE WHEN product = 'Pie' THEN COALESCE(amount_sold, 0) END)) AS diff,
  CASE
    WHEN MIN(CASE WHEN product = 'Cake' THEN COALESCE(amount_sold, 0) END) > MIN(CASE WHEN product = 'Pie' THEN COALESCE(amount_sold, 0) END) THEN 'Cake'
    ELSE 'Pie'
  END AS sold_more
FROM desserts
GROUP BY date_sold
ORDER BY date_sold;


-----------------
Output
-----------------

|  date_sold  |  diff  | sold_more |
|------------|-------|-----------|
| 2022-06-01 |   12  |   Pie     |
| 2022-06-02 |    1  |   Pie     |
| 2022-06-03 |    1  |   Cake    |
| 2022-06-04 |    9  |   Pie     |
| 2022-06-05 |   16  |   Cake    |
