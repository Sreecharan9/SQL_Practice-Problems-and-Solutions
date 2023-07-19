-----------------
Query
-----------------

SELECT *
FROM
(SELECT 
	UNNEST(STRING_TO_ARRAY(col1||','||col2||','||col3||','||col4||','||col5||','||col6,',')) as newstring
    ,COUNT(*)
FROM 
	alphabets
GROUP BY 1
) as words
WHERE newstring = 'G'



-------------------
Output
-------------------

| word | count |
|------|-------|
|   G  |   8   |
