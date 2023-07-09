-------------------
Query
------------------

WITH CTE1 as
(SELECT 
    entry_date
    ,CAST(entry_date+Interval '7 days' AS DATE) as "7d"
    ,account_id
    ,COUNT(account_id) OVER(PARTITION BY entry_date) as premium_paid_accounts
FROM
    premium_accounts_by_day
WHERE
    final_price <> 0 
    AND entry_date BETWEEN '2022-02-07' AND '2022-02-13'
ORDER BY 1
)

SELECT 
    CTE1.entry_date
    ,premium_paid_accounts
    ,COUNT(b.account_id) AS premium_paid_accounts_after_7d
FROM CTE1
    LEFT JOIN premium_accounts_by_day b
    ON          
    (
        CTE1."7d" = b.entry_date 
    AND CTE1.account_id = b.account_id
    )
WHERE   
    b.final_price <> 0 
    AND b.entry_date IS NOT NULL
GROUP BY 1,2
ORDER BY CTE1.entry_date
LIMIT 7

-----------------
Output
-----------------
| entry_date | premium_paid_accounts | premium_paid_accounts_after_7d |
|------------|----------------------|-------------------------------|
| 2022-02-07 |          2           |              2                |
| 2022-02-08 |          3           |              2                |
| 2022-02-09 |          3           |              2                |
| 2022-02-10 |          4           |              3                |
| 2022-02-11 |          4           |              1                |
| 2022-02-12 |          4           |              2                |
| 2022-02-13 |          4           |              1                |
