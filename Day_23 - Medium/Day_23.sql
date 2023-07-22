-----------------
Query
-----------------

WITH a1 AS
(
SELECT id
  	,status
  	,txndate
  	,value
  	,SUM(CASE WHEN status = 'Credit' THEN value ELSE -1*value END) OVER(ORDER BY txndate) as net_balance
FROM 
  	bankdetails
WHERE 
  	id <> 2
ORDER BY 
  	id,txndate
),

a2 AS
(
SELECT 
  	*
from 
  	bankdetails
WHERE 
  	id = 2
)

SELECT 
	a1.*,
    a2.id as id1
    ,a2.status as status1
    ,a2.txndate as txdate1
    ,a2.value as value1
    ,SUM(CASE WHEN a2.status = 'Credit' THEN a2.value 
         	    WHEN a2.status = 'Debit' THEN a2.value*-1 END) OVER(ORDER BY a2.txndate) AS net_balance1
FROM 
	a1
LEFT JOIN 
	a2
USING(txndate)


---------------
Output
----------------

| id | status |  txndate  | value | net_balance | id1 | status1 |  txdate1  | value1 | net_balance1 |
|----|--------|-----------|-------|-------------|-----|---------|-----------|--------|--------------|
| 1  | Credit | 7/10/2023 |  400  |     400     |  2  | Credit  | 7/10/2023 |  500   |     500      |
| 1  | Credit | 7/11/2023 |  900  |    1300     |  2  |  Debit  | 7/11/2023 |  100   |     400      |
| 1  |  Debit | 7/14/2023 |  200  |    1100     |  2  |  Debit  | 7/14/2023 |  100   |     300      |
| 1  | Credit | 7/17/2023 |  600  |    1700     | null|   null  |    null   |  null  |     300      |
| 1  |  Debit | 7/20/2023 |  300  |    1400     | null|   null  |    null   |  null  |     300      |
| 1  | Credit | 7/21/2023 |  800  |    2200     | null|   null  |    null   |  null  |     300      |
