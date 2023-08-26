-----------------
Query
-----------------

WITH a1 AS
(
SELECT 
    A.*,
    ROW_NUMBER() OVER(PARTITION BY A.col1,A.col2) AS rn
FROM 
    input A 
INNER JOIN 
    input B ON (A.col1 = B.col1 AND A.col2 <= B.col2)
)
SELECT 
    col1
  ,STRING_AGG(col2::text,',') as num
FROM a1
GROUP BY 1,rn
ORDER BY 1,2

-------------------
Output
-------------------

| col1 |  num  |
|------|-------|
|   A  |   1   |
|   A  | 1,2   |
|   A  | 1,2,3 |
|   B  |   2   |
|   B  | 2,3   |
|   B  | 2,3,4 |
