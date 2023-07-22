# Write a SQL query to find the net balance of each customer on the basis of txndate but the details of id=2 must be displayed in seperate columns as shown below.

| id | status |  txndate  | value | net_balance | id1 | status1 |  txdate1  | value1 | net_balance1 |
|----|--------|-----------|-------|-------------|-----|---------|-----------|--------|--------------|
| 1  | Credit | 7/10/2023 |  400  |     400     |  2  | Credit  | 7/10/2023 |  500   |     500      |
| 1  | Credit | 7/11/2023 |  900  |    1300     |  2  |  Debit  | 7/11/2023 |  100   |     400      |
| 1  |  Debit | 7/14/2023 |  200  |    1100     |  2  |  Debit  | 7/14/2023 |  100   |     300      |
| 1  | Credit | 7/17/2023 |  600  |    1700     |  -  |    -    |     -     |   -    |     300      |
| 1  |  Debit | 7/20/2023 |  300  |    1400     |  -  |    -    |     -     |   -    |     300      |
| 1  | Credit | 7/21/2023 |  800  |    2200     |  -  |    -    |     -     |   -    |     300      |
