------------------
Query
------------------

With details AS
(
SELECT 
    DISTINCT employee_id
    ,COUNT(*) OVER(PARTITION BY employeeid) as total_entry
    ,COUNT(CASE WHEN entry_details = 'login' THEN 1 ELSE NULL END) OVER(PARTITION BY employeeid) AS total_login
    ,COUNT(CASE WHEN entry_details = 'logout' THEN 1 ELSE NULL END) OVER(PARTITION BY employeeid) AS total_logout
    ,MAX(CASE WHEN entry_details = 'login' THEN timestamp_details ELSE NULL END) OVER(PARTITION BY employeeid) AS latest_login
    ,MAX(CASE WHEN entry_details = 'logout' THEN timestamp_details ELSE NULL END) OVER(PARTITION BY employeeid) AS latest_logout
FROM 
    employee_checkin_details
),

phone_default AS
(
SELECT 
    employeeid
    ,phone_number
  	,isdefault
FROM 
    employee_details
WHERE 
    isdefault = 'true'
)


SELECT 
    A.*
    ,B.phone_number
    ,isdefault
FROM 
    details A 
LEFT JOIN 
    phone_default B 
USING(employeeid)



-----------------
Output
-----------------
| employee_id | total_entry | total_login | total_logout |      latest_login       |      latest_logout      | phone_number | isdefault |
|-------------|-------------|-------------|--------------|-------------------------|-------------------------|--------------|-----------|
|    1000     |      4      |      3      |      1      | 2023-06-16 03:00:15.34  | 2023-06-16 12:00:15.34  |     null     |    null   |
|    1001     |      4      |      3      |      1      | 2023-06-16 03:00:15.34  | 2023-06-16 12:00:15.34  |     2222     |   TRUE    |

