-------------------
Script:
-------------------
create table movie(
seat varchar(50),occupancy int
);
insert into movie values('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),
('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),
('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);


-------------------
Query:
-------------------

WITH sort_data AS
  (SELECT seat
          ,occupancy
          ,SUM(occupancy) OVER(ORDER BY row_no) AS running_sum
          ,row_no
   FROM
     (SELECT *
             ,ROW_NUMBER() OVER() AS row_no
      FROM movie) AS rank_check),
     choosing_seats AS
  (SELECT seat
          ,occupancy
          ,running_sum
          ,COUNT(*) OVER(PARTITION BY occupancy, running_sum
                        ORDER BY row_no ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS consecutive_seats
   FROM sort_data
   ORDER BY row_no)
SELECT seat AS seat_number
FROM choosing_seats
WHERE consecutive_seats >=4



------------------
Output
------------------
seat_no
a3
a4
a5
a6
a9
a10
b1
b2
b3
b8
b9
b10
c1
