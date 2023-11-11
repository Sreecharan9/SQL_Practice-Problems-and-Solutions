--------------------
Query
-------------------

WITH overs_filter AS (
  SELECT *
    ,COUNT(CASE WHEN delivery_type = 'legal' THEN ball_no ELSE NULL END) OVER (ORDER BY ball_no) AS balls_count
    ,CEILING((COUNT(CASE WHEN delivery_type = 'legal' THEN ball_no ELSE NULL END) OVER (ORDER BY ball_no) * 1.0 / 6)::FLOAT) AS over_num
  FROM cricket_runs
  ORDER BY ball_no
),

wides AS (
  SELECT *
    ,LAST_VALUE(balls_count) OVER (PARTITION BY over_num ORDER BY ball_no ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS wide_check
  FROM overs_filter
)

SELECT
    CASE
      WHEN delivery_type = 'wd' AND balls_count = wide_check THEN over_num + 1
      ELSE over_num
    END AS over
  ,SUM(
    CASE
      WHEN delivery_type IN ('nb', 'wd') THEN runs + 1
      ELSE runs
    END
  ) AS score
FROM wides
GROUP BY 1
ORDER BY 1;




------------------
Output
------------------
| overs | scores |
|-------|--------|
|   1   |   20   |
|   2   |   17   |
|   3   |   21   |
|   4   |   20   |
|   5   |   12   |
|   6   |   14   |
|   7   |   12   |
|   8   |    8   |
|   9   |   15   |
|  10   |    6   |
|  11   |    6   |
|  12   |   20   |
|  13   |   13   |
|  14   |   17   |
|  15   |   16   |
|  16   |   13   |
|  17   |   13   |
|  18   |   15   |
|  19   |   17   |
|  20   |   15   |
|  21   |   13   |
|  22   |   16   |
|  23   |   11   |
|  24   |   13   |
|  25   |    8   |
|  26   |   10   |
|  27   |   11   |
|  28   |   13   |
|  29   |   13   |
|  30   |    4   |
|  31   |   10   |
|  32   |    7   |
|  33   |   10   |
|  34   |    9   |
|  35   |    7   |
|  36   |   11   |
|  37   |   16   |
|  38   |   11   |
|  39   |   16   |
|  40   |   14   |
|  41   |   17   |
|  42   |   13   |
|  43   |   11   |
|  44   |   15   |
|  45   |   12   |
|  46   |    9   |
|  47   |   14   |
|  48   |   16   |
|  49   |   12   |
|  50   |    9   |

