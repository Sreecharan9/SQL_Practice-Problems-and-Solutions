----Create and Insert Statements

create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emp
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp
values (3, 'Vikas', 100, 10000,4,37);
insert into emp
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emp
values (5, 'Mudit', 200, 12000, 6,55);
insert into emp
values (6, 'Agam', 200, 12000,2, 14);
insert into emp
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp
values (8, 'Ashish', 200,5000,2,12);
insert into emp
values (9, 'Mukesh',300,6000,6,51);
insert into emp
values (10, 'Rakesh',300,7000,6,50);


----Query:

WITH average_salary AS
  (SELECT department_id,
          salary,
          AVG(salary) OVER(PARTITION BY department_id
                           ORDER BY department_id)::int AS dept_avg_salary
   FROM emp),
     salary AS
  (SELECT DISTINCT department_id,
                   SUM(salary)OVER(PARTITION BY department_id
                                   ORDER BY department_id) AS total_salary,
                   COUNT(*) OVER(PARTITION BY department_id
                                 ORDER BY department_id) AS "count"
   FROM emp
   ORDER BY 1)
SELECT DISTINCT a1.department_id,
                dept_avg_salary,
                ROUND(SUM(total_salary)*1.0/sum("count")) AS company_avg
FROM average_salary
INNER JOIN salary ON a1.department_id <> a2.department_id
GROUP BY 1,2
HAVING dept_avg_salary < ROUND(SUM(total_salary)*1.0/sum("count"))
ORDER BY 1


Output:
300
