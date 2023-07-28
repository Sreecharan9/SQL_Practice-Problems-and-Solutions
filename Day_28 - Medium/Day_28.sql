--------------------
Query
-------------------
WITH data as
(
SELECT 
    video_id
    ,COUNT(user_id) as no_of_users
    ,DENSE_RANK() OVER(ORDER BY COUNT(user_id) DESC) as rank_check
FROM
(
SELECT *
    ,ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY user_id,watched_at) as videos
FROM 
    videos_watched
ORDER BY 
    user_id
    ,watched_at
) A
WHERE 
    videos <=3
GROUP BY 1
ORDER BY 2 DESC
)

SELECT 
    video_id
    ,no_of_users
FROM 
    data
WHERE 
    rank_check <=3

------------------
Output
------------------


| video_id | no_of_users |
|----------|-------------|
|  vid004  |      8      |
|  vid002  |      7      |
|  vid003  |      7      |
|  vid005  |      4      |
