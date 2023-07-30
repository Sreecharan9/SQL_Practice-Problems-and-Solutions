-----------------
Query
-----------------

SELECT
    from_user
    ,COUNT(from_user) as total_emails_sent
    ,ROW_NUMBER() OVER(ORDER BY COUNT(from_user) DESC,from_user) AS row_number
FROM
    google_gmail_emails
GROUP BY 1
ORDER BY 3


-----------------
Output
-----------------

| from_user       | total_emails_sent | row_number |
|-----------------|-------------------|------------|
| 32ded68d89443e808 |       19        |     1      |
| ef5fe98c6b9f313075 |       19        |     2      |
| 5b8754928306a18b68 |       18        |     3      |
| 55e60cfcc9dc49c17e |       16        |     4      |
| 91f59516cb9dee1e88 |       16        |     5      |
| 6edf0be4b2267df1fa |       15        |     6      |
| 7cfe354d9a64bf8173 |       15        |     7      |
| cbc4bd40cd1687754  |       15        |     8      |
| e0e0defbb9ec47f6f7 |       15        |     9      |
| 8bba390b53976da0cd |       14        |    10      |
| a84065b7933ad01019 |       14        |    11      |
| e22d2eabc2d4c19688 |       13        |    12      |
| 850badf89ed8f06854 |       12        |    13      |
| aa0bd72b729fab6e9e |       12        |    14      |
| 2813e59cf6c1ff698e |       11        |    15      |
| 5dc768b2f067c56f77 |       11        |    16      |
| 5eff3a5bfc0687351e |       11        |    17      |
| 75d295377a46f83236 |       11        |    18      |
| 157e3e9278e32aba3e |       10        |    19      |
| d63386c884aeb9f71d |       10        |    20      |
| 406539987dd9b679c0 |        9        |    21      |
| 6b503743a13d778200 |        9        |    22      |
| 114bafadff2d882864 |        8        |    23      |
| 47be2887786891367e |        6        |    24      |
| e6088004caf0c8cc51 |        6        |    25      |
