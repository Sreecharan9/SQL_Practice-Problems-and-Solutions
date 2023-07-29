# Solving A Hard SQL Problem | SQL ON OFF Problem | Magic of SQL -- Ankit Bansal YT Channel

Input Table:
-------------------
| event_time | status |
|------------|--------|
|   10:01    |   on   |
|   10:02    |   on   |
|   10:03    |   on   |
|   10:04    |   off  |
|   10:07    |   on   |
|   10:08    |   on   |
|   10:09    |   off  |
|   10:11    |   on   |
|   10:12    |   off  |


Output Table:

_____________________________

| start_time | end_time | time_diff |
|------------|----------|-----------|
|   10:01    |  10:04   |     3     |
|   10:07    |  10:09   |     2     |
|   10:11    |  10:12   |     1     |
