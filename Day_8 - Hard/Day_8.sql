-------------------
Query
-------------------
WITH CTE1 as
(SELECT 
    user_id
   ,client_id
   ,event_type
   ,CASE WHEN event_type = 'video call received'
    OR event_type = 'video call sent'
    OR event_type = 'voice call received'
    OR event_type = 'voice call sent' THEN 1 ELSE null END AS EventsType
   ,COUNT(*) OVER(PARTITION BY user_id,client_id ORDER BY user_id) as EventsCount
FROM
    fact_events
ORDER BY user_id,client_id
),

CTE2 as
(SELECT user_id
    ,client_id
    ,SUM(EventsType)
    ,EventsCount
    ,SUM(EventsType)*1.0/EventsCount*100 as PercentageOfEvents
FROM 
    CTE1
WHERE 
    EventsType = 1
GROUP BY 1,2,4
),


CTE3 AS
(
SELECT 
    client_id
    ,COUNT(client_id) as FinalCount
FROM 
    CTE2
WHERE 
    PercentageOfEvents >= 50
GROUP BY 1
ORDER BY 2 DESC
)

SELECT 
    client_id
FROM 
    CTE3
WHERE 
    FinalCount = (SELECT MAX(FinalCount) FROM CTE3)


-------------------
Output
------------------
client_id
desktop
