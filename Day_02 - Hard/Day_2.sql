----------------------------------
Script
----------------------------------
create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),(2,'Junior',15000),(3,'Junior',40000),(4,'Senior',16000),(5,'Senior',20000),(6,'Senior',50000);



-----------------------------------
Query:
------------------------------------
WITH Senior_data AS
  (SELECT emp_id
          ,experience
          ,salary
   FROM
     (SELECT *,
             SUM(salary) OVER(
                              ORDER BY salary) AS running_sum,
             70000 AS budget,
             70000 - SUM(salary) OVER(
                                      ORDER BY salary) AS running_budget_difference
      FROM candidates
      WHERE experience = 'Senior'
      ORDER BY salary) Senior
   WHERE running_sum<budget ),

     Junior_data AS
  (SELECT emp_id,
          experience,
          salary
   FROM
     (SELECT e.*,
             SUM(salary) OVER(
                              ORDER BY salary) AS running_sum_2,

        (SELECT 70000-sum(salary)
         FROM Senior_data) AS left_amount
      FROM candidates e
      WHERE experience = 'Junior' ) Junior
   WHERE running_sum_2<left_amount )
SELECT *
FROM Senior_data
UNION
SELECT *
FROM Junior_data


----------------------------------
Output
----------------------------------
emp_id	experience	salary
1	Junior	10000
2	Junior	15000
4	Senior	16000
5	Senior	20000



