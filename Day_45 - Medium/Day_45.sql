------------------
Query
------------------

SELECT  DISTINCT city
FROM zillow_transactions
WHERE mkt_price > (SELECT AVG(mkt_price) FROM zillow_transactions)
