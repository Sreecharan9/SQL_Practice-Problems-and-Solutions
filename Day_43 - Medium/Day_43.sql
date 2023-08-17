------------------
Query
------------------
SELECT 
	LEFT(SUBSTRING(name FROM generate_series(1, length('snowflake'))),1) AS "Name"
FROM 
	tool

------------------
Output
------------------

| name |
|------|
|  S   |
|  n   |
|  o   |
|  w   |
|  f   |
|  l   |
|  a   |
|  k   |
|  e   |
