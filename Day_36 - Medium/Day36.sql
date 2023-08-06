------------------
Query
------------------

SELECT 
    post_date
    ,COUNT(CASE WHEN post_keywords LIKE '%spam%' THEN 1 ELSE NULL END)*100.0/COUNT(*) as total_perc
FROM
    facebook_posts 
INNER JOIN facebook_post_views 
USING(post_id) 
GROUP BY 
    post_date

--------------------
Output
-------------------
|  post_date  | total_perc |
|------------|------------|
|  1/1/2019   |    100     |
|  1/2/2019   |    50      |
