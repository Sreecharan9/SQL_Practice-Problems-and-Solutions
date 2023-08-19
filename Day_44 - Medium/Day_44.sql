-----------------
Query
----------------

WITH scores as
(
SELECT 
    student
    ,assignment1+assignment2+assignment3 as total_score
FROM 
    box_scores
ORDER BY 2 DESC
)

SELECT MAX(total_score)-MIN(total_score) as total_diff
FROM scores


------------------
Output
------------------

| total_diff |
|------------|
|     94     |
