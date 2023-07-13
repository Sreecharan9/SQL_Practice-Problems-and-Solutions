-----------------
Query
----------------

SELECT
    A.col1,
    B.col2
FROM
    test A
LEFT JOIN
    (
        SELECT
            col2,
            ROW_NUMBER() OVER() AS rn
        FROM
            test
        WHERE
            col1 IS NULL
    ) B ON A.col1 = B.rn
WHERE
    A.col1 IS NOT NULL


-------------------
Output
-------------------

| col1 | col2 |
|------|------|
|   1  |   a  |
|   2  |   b  |
|   3  | null |
