--------------------
Query
--------------------
  
SELECT 
    words
    ,COUNT(*) AS Occurences
FROM
(
SELECT 
    UNNEST(STRING_TO_ARRAY(contents,' ')) AS words
FROM
    google_file_store
) AS separation
WHERE 
    words = 'bull' 
    OR words = 'bear'
GROUP BY 1

--------------------
Output
-------------------
words	occurences
bear	2
bull	3
