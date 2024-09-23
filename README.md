# SQL_2024_Datetime_Operator Along with SQL DateTime Case Study in Flight Dataset


for practicing the DateTime operator, trying to DateTime database:
plan:
1. I want to create a table for Uber.
2. want to store Ride details (Ride_id,user_id,cab_id,start_time,end_time).
## 1. Creating a Table

The following SQL code creates a table named `uber_rides` with fields for ride ID, user ID, cab ID, start time, and end time:

```SQL
CREATE TABLE uber_rides (
    ride_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER,
    cab_id INTEGER,
    start_time DATETIME,
    end_time DATETIME
);
```

Inserting Data SQL code

```SQL
INSERT INTO uber_rides (ride_id, user_id, cab_id, start_time, end_time)
VALUES
    (1, 1, 1, '2023-03-09 08:00:00', '2023-03-09 09:00:00'),
    (2, 1, 1, '2023-03-09 23:00:00', '2023-03-10 00:30:00'),
    (3, 2, 3, '2023-03-10 15:00:00', '2023-03-10 15:30:00'),
    (4, 6, 31, '2023-03-11 19:00:00', '2023-03-11 20:30:00'),
    (6, 22, 33, '2023-03-11 22:00:00', '2023-03-11 22:30:00');
```
    That's how to create a Datatime database and insert value into the database


## 2. Date and Time Functions in SQL

This section demonstrates how to retrieve the current date, time, and Datetime using SQL functions.

#### 2.1 SQL Queries for Date and Time

#### 2.2 Get Today's Date

To get the current date, use the `CURRENT_DATE()` function:

```SQL
SELECT CURRENT_DATE();   # current_date() -> 2024-09-22
```

#### 2.3 Get Current Time
To get the current time, use the `CURRENT_TIME()` function:

```SQL
SELECT CURRENT_TIME(); # current_time() -> 12:03:14
```

#### 2.4 Get the Current Date and Time

```SQL
SELECT NOW();   # now() -> 2024-09-22 12:04:21
```
    ### Explanation:
    1. **`CURRENT_DATE()`**: Returns today's date.
    2. **`CURRENT_TIME()`**: Returns the current time.
    3. **`NOW()`**: Returns the current date and time combined.
    

## 3. Date and Time Extraction Functions

This section explains how to use various SQL functions to extract specific parts of a date and time, along with their sample outputs.

### 1. `DATE()` and `TIME()`
- **` DATE()`**: Extracts the date part from a `DATETIME` or `TIMESTAMP`.
  ```SQL
  SELECT DATE(NOW());
  ```
  **Result**: `2024-09-22`

- **`TIME()`**: Extracts the time part from a `DATETIME` or `TIMESTAMP`.
  ```SQL
  SELECT TIME(NOW());
  ```
  **Result**: `10:30:00`

### 2. `YEAR()`
- **` YEAR()`**: Extracts the year from a `DATETIME` or `DATE`.
  ```SQL
  SELECT YEAR(NOW());
  ```
  **Result**: `2024`

### 3. `DAY()` or `DAYOFMONTH()`
- **`DAY()`** or **`DAYOFMONTH()`**: Extracts the day of the month.
  ```SQL
  SELECT DAY(NOW());
  SELECT DAYOFMONTH(NOW());
  ```
  **Result**: `22`

### 4. `DAYOFWEEK()`
- **`DAYOFWEEK()`**: Returns the weekday index (1 = Sunday, 7 = Saturday).
  ```SQL
  SELECT DAYOFWEEK(NOW());
  ```
  **Result**: `1` (Sunday)

### 5. `DAYOFYEAR()`
- **`DAYOFYEAR()`**: Returns the day of the year (from 1 to 365/366).
  ```SQL
  SELECT DAYOFYEAR(NOW());
  ```
  **Result**: `266`

### 6. `MONTH()` and `MONTHNAME()`
- **`MONTH()`**: Extracts the month as a number (1-12).
  ```SQL
  SELECT MONTH(NOW());
  ```
  **Result**: `9`

- **`MONTHNAME()`**: Returns the name of the month (e.g., January, February).
  ```SQL
  SELECT MONTHNAME(NOW());
  ```
  **Result**: `September`

### 7. `QUARTER()`
- **`QUARTER()`**: Returns the quarter of the year (1-4).
  ```SQL
  SELECT QUARTER(NOW());
  ```
  **Result**: `3`

### 8. `WEEK()` or `WEEKOFYEAR()`
- **`WEEK()`** or **`WEEKOFYEAR()`**: Returns the week of the year (1-52).
  ```SQL
  SELECT WEEK(NOW());
  SELECT WEEKOFYEAR(NOW());
  ```
  **Result**: `38`

### 9. `HOUR()`, `MINUTE()`, and `SECOND()`
- **`HOUR()`**: Extracts the hour from a `DATETIME` or `TIME`.
  ```SQL
  SELECT HOUR(NOW());
  ```
  **Result**: `10`

- **`MINUTE()`**: Extracts the minute from a `DATETIME` or `TIME`.
  ```SQL
  SELECT MINUTE(NOW());
  ```
  **Result**: `30`

- **`SECOND()`**: Extracts the second from a `DATETIME` or `TIME`.
  ```SQL
  SELECT SECOND(NOW());
  ```
  **Result**: `00`

### 10. `LAST_DAY()`
- **`LAST_DAY()`**: Returns the last day of the month for a given date.
  ```SQL
  SELECT LAST_DAY(NOW());
  ```
  **Result**: `2024-09-30`


## 4. Date_Time format

In MySQL, the `DATE_FORMAT()` function allows you to format date values according to a specified format string. This is particularly useful for displaying dates in a user-friendly manner or when preparing data for reports.

```sql
DATE_FORMAT(date, format)
```

### 4.1 Common Format Specifiers

![Format_Specifiers](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/date_Time_format.png)

```
Example 1: Basic Date Formatting
To format a date to the YYYY-MM-DD format:

```SQL
SELECT DATE_FORMAT('2024-09-22', '%Y-%m-%d') AS formatted_date;
Example Output: 2024-09-22
```
```
Example 2: Formatting with Month Name
To include the full month name:

SELECT DATE_FORMAT('2024-09-22', '%d %M %Y') AS formatted_date;
Example Output: 22 September 2024
```
```
Example 3: Formatting with Time
To format a date with time:
SELECT DATE_FORMAT('2024-09-22 14:30:15', '%Y-%m-%d %H:%i:%s') AS formatted_datetime;
Example Output: 2024-09-22 14:30:15
```
```
Example 4: Custom Formatting
To format a date as September 22, 2024:
SELECT DATE_FORMAT('2024-09-22', '%M %d, %Y') AS formatted_date;
Example Output: September 22, 2024
```

## 5. Date Time Type conversion

#### 5.1 Implicit conversion

It internally understands what data type the string should be 
for example

```SQL
select '2023-03-11' > '2023-03-09'
```
The answer it will give is True(1), it internally understands the string should be in DateTime format

#### 5.2 Explicit Conversion

```SQL
select '2023-03-11' > '9 mar 2023'
```
here the implicit conversion will fail. in order to get the desired result we have to convert manually this string '9 Mar 2023' this is an Explicit conversion

```SQL
select str_to_date('9 mar 2023','%e %b %Y')
```
now it will convert into date time format i just have to give it way so that it can understand what the string means

another example

```SQL
  select str_to_date('9 h mar hello 2023', '%e h %b hello %Y' ) 
```
Now it will be converted into date time format.


## 6 Common Functions of DATETIME Arithmetic

1. **DATE_ADD()**: Adds a specified time interval to a date.
2. **DATE_SUB()**: Subtracts a specified time interval from a date.
3. **DATEDIFF()**: Returns the difference in days between two dates.
4. **TIMEDIFF()**: Returns the difference between two DateTime values in a specified unit.



### 6.1 DATE_ADD()

xample 1: Adding Days to a Date
To add 10 days to a specific date:
```sql
SELECT DATE_ADD('2024-09-22', INTERVAL 10 DAY) AS new_date;
Example Output: 2024-10-02
```

### 6.2 DATE_SUB()
Example 2: Subtracting Days from a Date
To subtract 5 days from a specific date:

```SQL
SELECT DATE_SUB('2024-09-22', INTERVAL 5 DAY) AS new_date;
Example Output: 2024-09-17
```

### 6.3 DATEDIFF()
Example 3: Calculating the Difference in Days
To calculate the difference in days between two dates:

```SQL
SELECT DATEDIFF('2024-10-01', '2024-09-22') AS date_difference;
Example Output: 9
```
### 6.4 TIMESTAMPDIFF()
Example 4: Calculating Time Difference in Hours
To calculate the difference in hours between two DateTime values:

```SQL
SELECT TIMESTAMPDIFF(HOUR, '2024-09-22 14:30:00', '2024-09-23 16:45:00') AS hours_difference;
Example Output: 26
```

## 7 TIMESTAMP vs DATETIME in MySQL

TIMESTAMP and DATETIME are two data types in MySQL used to store date and time values. While they may seem similar, they have key differences that affect how they are used.

### 7.1 Comparison:

    Range:
    
    TIMESTAMP: '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC
    DATETIME: '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
    Storage:
    
    TIMESTAMP: 4 bytes
    DATETIME: 8 bytes
    Behavior on Insertion:
    
    TIMESTAMP: Automatically converts to UTC, stores as UTC
    DATETIME: Stores the date and time as is, no conversion
    Behavior on Update:
    
    TIMESTAMP: Automatically updates to the current timestamp when the row is modified (if defined with DEFAULT CURRENT_TIMESTAMP or ON UPDATE CURRENT_TIMESTAMP)
    DATETIME: Does not automatically update on row modification
    Precision:
    
    TIMESTAMP: Seconds (no fractional seconds by default)
    DATETIME: Can support fractional seconds (up to 6 digits)
    Auto Update:
    
    TIMESTAMP: Yes, it can auto-update to the current timestamp
    DATETIME: No, must be explicitly set
    Conclusion
    Use TIMESTAMP: When you need to track changes automatically and you're working within the UTC range. used in social media where posts created and updated or edited frequently
    Use DATETIME: When you require a wider range or need to store the date and time as is without automatic conversions. when we store birthday date


### 7.2 Usefulness of `CURRENT_TIMESTAMP` in MySQL

The `CURRENT_TIMESTAMP` function in MySQL is useful for automatically setting and updating date and time fields when rows are inserted or modified. In this example, I will demonstrate how `CURRENT_TIMESTAMP` can be used in the context of tracking when a post is created and last updated in a `posts` table.

#### Creating a table 

```sql
CREATE TABLE posts (
    post_id INTEGER AUTO_INCREMENT PRIMARY KEY,
    user_id INTEGER,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```
#### Inserting a Post

```SQL
INSERT INTO posts(user_id, content) VALUES (1, 'Hello World');
```

This command inserts a new post for user ID 1 with the content 'Hello World'. The created_at and updated_at columns will automatically be set to the current timestamp at the time of insertion.

#### Output after Insertion:

![Output After insertion](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/time_stamp1.png)

    The created_at and updated_at fields have the same timestamp because the post was just created.

#### Updating a Post

```SQL
UPDATE posts 
SET content = 'No more Hello World'
WHERE post_id = 1;
```
This updates the content of the post with post_id = 1. Since the updated_at column is defined with ON UPDATE CURRENT_TIMESTAMP, it will automatically update to the current timestamp when the row is modified.

#### Output after Update:

![Output after Update](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/time_stamp2.png)

    created_at: Remains unchanged as this timestamp tracks when the post was first created.
    updated_at: Changes to reflect the time when the post was modified.




## FLow of the Case Study 

    Case Study - Flights
    
    1. Find the month with the most number of flights.
    2. Which weekday has the most costly flights?
    3. Find the number of Indigo flights every month.
    4. Find a list of all flights that depart between 10 AM and 2 PM from Delhi to Bangalore.
    5. Find the number of flights departing on weekends from Bangalore.
    6. Calculate the arrival time for all flights by adding the duration to the departure time.
    7. Calculate the arrival date for all the flights.
    8. Calculate the average duration of flights between two cities.
    9. Find all flights that arrive at their destination after midnight.
    10. Find the quarter-wise number of flights for each airline.
    11. Find the longest flight distance (between cities in terms of time) in India.
    12. Average time duration for flights that have 1 stop vs more than 1 stop.
    13. Find all Air India flights in a given date range originating from Delhi.
    14. Find the longest flight of each airline.
    15. Find all the pairs of cities having an average time duration of > 3 hours.






































    
