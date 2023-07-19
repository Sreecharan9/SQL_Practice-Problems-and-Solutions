-----------------
Query
-----------------
SELECT *
FROM (
    SELECT 
        UNNEST(STRING_TO_ARRAY(col1 || ',' || col2 || ',' || col3 || ',' || col4 || ',' || col5 || ',' || col6, ',')) AS newstring,
        COUNT(*) AS count
    FROM 
        alphabets
    GROUP BY 1
) AS words
WHERE 
    newstring = 'G';

-------------------
Output
-------------------

| word | count |
|------|-------|
|   G  |   8   |
