--------------------
Query
--------------------
WITH users AS
(
SELECT 
    user_firstname
    ,user_lastname
    ,COUNT(DISTINCT uf.video_id) as Flagged_Videos
     ,DENSE_RANK() OVER(ORDER BY COUNT(DISTINCT uf.video_id) DESC) as RankNo
    
FROM
    user_flags uf
    INNER JOIN flag_review fr 
    USING(flag_id)
WHERE
    reviewed_outcome = 'APPROVED'
GROUP BY 1,2
)

SELECT 
    user_firstname||' '||user_lastname as FullName
FROM
    users
WHERE
    rankno = 1

--------------------
Output
--------------------
fullname
Mark May
Richard Hasson
