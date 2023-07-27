# Google Interview Question

# Events Table

| username | activity |  starttime  |   enddate   |
|----------|----------|-------------|-------------|
|   Amy    |  Travel  | 2020-02-12  | 2020-02-20  |
|   Amy    | Dancing  | 2020-02-21  | 2020-02-23  |
|   Amy    |  Travel  | 2020-02-24  | 2020-02-28  |
|   Joe    |  Travel  | 2020-02-11  | 2020-02-18  |

The above table doesn't contain any primary key.
The above table contains the information about the activity performed by each user in a period of time.
A person with username performed an activity from startdate to enddate.
Write an SQL Query to show the second most recent activity of each user.z


If the user has only one activity, return that one .

A User can't perform morethan one activity at the same time. Return the result tabel in any order.

# Result Table

| username | activity |  starttime  |   enddate   |
|----------|----------|-------------|-------------|
|   Amy    | Dancing  | 2020-02-21  | 2020-02-23  |
|   Joe    |  Travel  | 2020-02-11  | 2020-02-18  |

