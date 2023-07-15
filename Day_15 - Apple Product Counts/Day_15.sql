-------------------
Query
-------------------

WITH Apple_Products AS
(
SELECT 
    B.language
    ,COUNT(DISTINCT B.user_id) as n_apple_users
FROM 
    playbook_events A
    INNER JOIN  playbook_users B ON (A.user_id = B.user_id)
WHERE 
    device IN ('macbook pro','iphone 5s', 'ipad air')
GROUP BY 1
ORDER BY 1
),

Total_Products AS
(
SELECT 
    B.language
    ,COUNT(DISTINCT b.user_id) as n_total_users
FROM 
    playbook_events A
    INNER JOIN  playbook_users B ON (A.user_id = B.user_id)
GROUP BY 1
)

SELECT 
    Total_Products.language
    ,COAlESCE(n_apple_users,0)
    ,n_total_users
FROM
    Apple_Products
RIGHT JOIN 
    Total_Products USING(language)
ORDER BY 3 DESC



------------------
Output
------------------
|  language  | n_apple_users | n_total_users |
|------------|---------------|---------------|
|   english  |      11       |       45      |
|   spanish  |      3        |       9       |
|  japanese  |      2        |       6       |
|   french   |      0        |       5       |
|   russian  |      0        |       5       |
|   chinese  |      1        |       4       |
|   german   |      1        |       3       |
| portugese  |      1        |       3       |
|   indian   |      0        |       2       |
|   arabic   |      0        |       2       |
|   italian  |      1        |       1       |
