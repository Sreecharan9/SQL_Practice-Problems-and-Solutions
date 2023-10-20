------------------
Query
------------------

1) 

SELECT
  CASE WHEN src < dest THEN src ELSE dest END AS src,
  CASE WHEN dest > src THEN dest ELSE src END AS dest,
  ROUND(AVG(distance), 2) AS avg_distance
FROM src_dest_distance_2
GROUP BY 1, 2
ORDER BY 1;


2)

SELECT
  DISTINCT A.src,
  A.dest,
  ROUND(AVG(B.distance), 2) AS avg_distance
FROM src_dest_distance_2 A
INNER JOIN src_dest_distance_2 B
  ON (A.src = B.src AND A.dest = B.dest)
  OR (A.src = B.dest AND A.dest = B.src)
WHERE A.src < A.dest
GROUP BY 1, 2;


------------------
Output
------------------

| src | dest | avg_distance |
|-----|------|-------------|
|  A  |  B   |    22.67    |
|  C  |  D   |    16.63    |

