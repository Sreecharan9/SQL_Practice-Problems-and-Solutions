-------------------
WITH users
AS
(
SELECT *
  	,CASE WHEN COUNT(username) OVER(PARTITION By username) =1 THEN rank_check
          ELSE MAX(rank_check) OVER(PARTITION By username)-1 END as second_recent
FROM 
(
SELECT *
  	,ROW_NUMBER() OVER(PARTITION BY username ORDER BY starttime) as rank_check
  	,COUNT(*) OVER(PARTITION BY username,starttime) AS count_activity
FROM 
  	events
) A 
)

SELECT 
	username
    ,activity
    ,starttime
    ,enddate
FROM 
	users
WHERE 
	rank_check=second_recent 
    AND count_activity = 1


-----------------
Output
----------------

| username | activity |  starttime  |   enddate   |
|----------|----------|-------------|-------------|
|   Amy    | Dancing  | 2020-02-21  | 2020-02-23  |
|   Joe    |  Travel  | 2020-02-11  | 2020-02-18  |
