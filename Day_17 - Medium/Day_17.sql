-------------------
  Query
-------------------

SELECT
    A.person,
    B.Person
FROM
    (
        SELECT
            *,
            ROW_NUMBER() OVER() AS rn1
        FROM
            family
        WHERE
            type = 'Adult'
    ) A
LEFT JOIN
    (
        SELECT
            *,
            ROW_NUMBER() OVER() AS rn2
        FROM
            family
        WHERE
            type = 'Child'
    ) B
ON A.rn1 = B.rn2;


--------------------
Output
--------------------

| person | person |
|--------|--------|
|   A1   |   C1   |
|   A2   |   C2   |
|   A3   |   C3   |
|   A4   |   C4   |
|   A5   |  null  |

