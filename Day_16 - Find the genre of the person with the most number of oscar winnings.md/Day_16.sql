----------------
Query
----------------

WITH most_oscar_wins AS
(
SELECT
    nominee
    ,COUNT(winner)
    ,ROW_NUMBER() OVER(ORDER BY COUNT(winner) DESC) AS RN
FROM 
    oscar_nominees
WHERE 
    winner = 'True'
GROUP BY 1
ORDER BY 2 DESC,1
)

SELECT 
    A.nominee
    ,top_genre
FROM 
    most_oscar_wins as A
    INNER JOIN nominee_information as B ON (A.nominee = B.name)
WHERE rn = 1



---------------
Ouput
---------------

|     nominee      | top_genre |
|-----------------|-----------|
| Christoph Waltz |   Drama   |
