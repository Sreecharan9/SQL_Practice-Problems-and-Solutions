# PayPal Data Engineer SQL Interview Question ( Ankit Bansal YT Channel)
--------------------------------------------------------------------------------------------
*Employee Checkin Details*:

| employeeid | entry_details |     timestamp_details     |
|------------|---------------|---------------------------|
|    1000    |     login     | 2023-06-16 01:00:15.34   |
|    1000    |     login     | 2023-06-16 02:00:15.34   |
|    1000    |     login     | 2023-06-16 03:00:15.34   |
|    1000    |    logout     | 2023-06-16 12:00:15.34   |
|    1001    |     login     | 2023-06-16 01:00:15.34   |
|    1001    |     login     | 2023-06-16 02:00:15.34   |
|    1001    |     login     | 2023-06-16 03:00:15.34   |
|    1001    |    logout     | 2023-06-16 12:00:15.34   |
-------------------------------------------------------------------------------------------------
*Employee details*:

| employeeid | phone_number | isdefault |
|------------|--------------|-----------|
|    1001    |     9999     |   FALSE   |
|    1001    |     1111     |   FALSE   |
|    1001    |     2222     |    TRUE   |
|    1003    |     3333     |   FALSE   |

--------------------------------------------------------------------------------------------------
Write an SQL query to find output table as below

Employee_id,Employee_default_phone_number,Total_entry, Total_login, Total_logout, Latest_login, Latest_logout

 
