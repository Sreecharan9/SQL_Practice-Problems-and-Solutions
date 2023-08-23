
Table Script:
create table contact_details(firsname varchar(50),lastname varchar(50),emailid varchar(50)),
values ('John','Tom','John.tom@gmail.com'),
values ('Abdul','Khan','Abdul.khan@yahoo.com'),
values ('Raj','Kumar','Raj.kumar@outlook.com'),
values ('Michael','Scofield','Michael.Scofield@outlook.com');

Output:
Unique_Domain
yahoo-outlook-gmail

-------------------
Query
-------------------

WITH domain AS
(
SELECT 
  	DISTINCT SUBSTRING(SUBSTRING(emailid FROM POSITION('@' IN emailid)+1 FOR LENGTH(emailid)) FROM 1 FOR POSITION('.' IN SUBSTRING(emailid FROM POSITION('@' IN emailid)+1 FOR LENGTH(emailid)))-1) AS account
FROM contact_details
ORDER BY 1 DESC
)

SELECT string_agg(account,'-') as Unique_domain
FROM domain


------------------
Output
-----------------
| unique_domain            |
|--------------------------|
| yahoo-outlook-gmail      |





