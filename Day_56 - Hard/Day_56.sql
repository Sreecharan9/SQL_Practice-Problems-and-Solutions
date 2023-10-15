-------------------
Query
------------------
WITH a1 AS (
  SELECT *,
         COUNT(CASE WHEN is_empty = 'Y' THEN NULL ELSE seat_no END) OVER (ORDER BY seat_no) AS sts
  FROM seats
),

a2 AS (
  SELECT sts,
         COUNT(*) AS cnt
  FROM a1
  WHERE is_empty = 'Y'
  GROUP BY 1
)

SELECT seat_no,
       is_empty
FROM a1
INNER JOIN a2 ON a1.sts = a2.sts
WHERE cnt >= 3 AND is_empty = 'Y';

-------------------
Output
------------------

| Seat_No | Is_Empty |
|---------|----------|
|    4    |    Y     |
|    5    |    Y     |
|    6    |    Y     |
|    8    |    Y     |
|    9    |    Y     |
|   10    |    Y     |
|   11    |    Y     |

