# Q. Write a SQL query to display the unique domain name in a single row in descending order.

Please try to solve without using CTE/Sub Query.

Table Script:
create table contact_details(firsname varchar(50),lastname varchar(50),emailid varchar(50)),
values ('John','Tom','John.tom@gmail.com'),
values ('Abdul','Khan','Abdul.khan@yahoo.com'),
values ('Raj','Kumar','Raj.kumar@outlook.com'),
values ('Michael','Scofield','Michael.Scofield@outlook.com');

Output:
Unique_Domain
yahoo-outlook-gmail
