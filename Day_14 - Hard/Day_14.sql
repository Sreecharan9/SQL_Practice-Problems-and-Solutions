----------------
Query
----------------

WITH CTE1 as
(
SELECT 
    description
    ,to_char(invoicedate,'Month') as Month_name
    ,EXTRACT('month' FROM invoicedate) as Month_num
    ,quantity
    ,unitprice
    ,quantity*unitprice as Amount_Paid
    ,ROW_NUMBER() OVER(PARTITION BY EXTRACT('month' FROM invoicedate) ORDER BY quantity*unitprice DESC ) AS rankcheck
from online_retail
ORDER BY EXTRACT('month' FROM invoicedate)
)

SELECT 
    description
    ,Month_name
    ,Amount_Paid
FROM CTE1
WHERE rankcheck=1

------------------
Ouptut
------------------


|           description           | month_name | amount_paid |
|-------------------------------|------------|-------------|
| LUNCH BAG SPACEBOY DESIGN       |  January   |     66      |
| REGENCY CAKESTAND 3 TIER       |  February  |    38.25    |
| PAPER BUNTING WHITE LACE       |   March    |    102      |
|      SPACEBOY LUNCH BOX         |   April    |    23.4     |
| PAPER BUNTING WHITE LACE       |    May     |     51      |
| Dotcomgiftshop Gift Voucher £50.00 |   June     |    41.67    |
| PAPER BUNTING WHITE LACE       |    July    |    30.6     |
| LUNCH BAG PINK POLKADOT        |   August   |    16.5     |
| RED RETROSPOT PEG BAG        | September |    34.72    |
| CHOCOLATE HOT WATER BOTTLE     |  October   |    102      |
| RED WOOLLY HOTTIE WHITE HEART. | November  |   228.25    |
| PAPER BUNTING RETROSPOT       |  December  |    35.4     |
