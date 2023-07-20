--------------------
Query
--------------------

WITH rooms as
(
SELECT 
    DISTINCT id_user
    ,ds
    ,UNNEST(STRING_TO_ARRAY(REGEXP_REPLACE(filter_room_types,'^,','','g'),',')) AS room_type
    ,ROW_NUMBER() OVER(PARTITION BY REGEXP_REPLACE(filter_room_types,'^,','','g') ORDER BY REGEXP_REPLACE(filter_room_types,'^,','','g')) as rn
    ,n_searches
FROM airbnb_searches
ORDER BY 1,rn
)

SELECT 
     room_type
    ,SUM(n_searches) as search_count
FROM 
    rooms
GROUP BY 1


--------------------
Output
--------------------
|     room_type     | search_count |
|-------------------|--------------|
| Entire home/apt   |     1988     |
|   Private room    |     1691     |
|    Shared room    |     114      |

