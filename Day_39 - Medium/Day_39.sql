----------------
Query
----------------


WITH a1
as
(
SELECT user_id,
LEAD(created_at,1) OVER(PARTITION BY user_id ORDER BY user_id,created_at) as next_purchase_date,
LEAD(created_at,1) OVER(PARTITION BY user_id ORDER BY user_id,created_at) - created_at as diff
from amazon_transactions
)

SELECT DISTINCT user_id
FROM a1
WHERE diff <= 7
ORDER BY 1

-----------------
Output
----------------

user_id
------
100
103
105
109
110
111
112
114
117
120
122
128
129
130
131
133
141
143
150
