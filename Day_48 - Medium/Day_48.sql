--------------------
Query
--------------------

SELECT 
    MIN(number) AS minimum,
    MAX(number) AS maximum,
    (
        SELECT SUM(number)
        FROM transportation_numbers
        WHERE number <> (SELECT MIN(number) FROM transportation_numbers)
        AND number <> (SELECT MAX(number) FROM transportation_numbers)
    ) AS sum_except_min_max
FROM transportation_numbers;


----------------------
Output
---------------------

| minimum | maximum | summation |
|---------|---------|-----------|
|    0    |    8    |     24    |
