# SQL_2024_Datetime_Operator Along with SQL DateTime Case Study in Flight Dataset


for practicing the DateTime operator, try to create DateTime database:
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

example 1: Adding Days to a Date
To add 10 days to a specific date:
```SQL
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

TIMESTAMP and DATETIME are two data types in MySQL that store date and time values. While they may seem similar, they have key differences that affect how they are used.

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
    DATETIME: No, it must be explicitly set
    Conclusion
    Use TIMESTAMP: When you need to track changes automatically and you're working within the UTC range. used in social media where posts created and updated or edited frequently
    Use DATETIME: When you require a wider range or need to store the date and time as is without automatic conversions. when we store birthday date


### 7.2 Usefulness of `CURRENT_TIMESTAMP` in MySQL

The `CURRENT_TIMESTAMP` function in MySQL is useful for automatically setting and updating date and time fields when rows are inserted or modified. In this example, I will demonstrate how `CURRENT_TIMESTAMP` can be used in the context of tracking when a post is created and last updated in a `posts` table.

#### Creating a table 

```SQL
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
    8. FInd the number of flights which travel on multiple dates;
    9. Calculate the average duration of flights between two cities.
    10. Find all flights that arrive at their destination after midnight.
    11. Find the quarter-wise number of flights for each airline.
    12. Find the longest flight distance (between cities in terms of time) in India.
    13. Average time duration for flights that have 1 stop vs more than 1 stop.
    14. Find all Air India flights in a given date range originating from Delhi.
    15. Find the longest flight of each airline.
    16. Find all the pairs of cities having an average time duration of > 3 hours.


![flight_dataset](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/flight_dataset.png)

#### My first challenge is to clean the ROute column, extract the stop route this way
![clened_route_image](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/cleaned_Router_column.png)

    Breakdown of Data Cleaning Steps:
    BLR → AMD → DEL: Extracted the intermediate stop "AMD".
    BLR → BOM → AMD → DEL: Extracted both "BOM" and "AMD".
    BLR → BOM → BHO → DEL: Extracted both "BOM" and "BHO".

### Route column data cleaned Steps Performed.

1. Add a New Column stops_name
First, a new column stops_name was added to the flight table to store the cleaned version of the Route data.
```SQL
ALTER TABLE flight 
ADD COLUMN stops_name VARCHAR(255) AFTER Route;
```

2. Copy Route Data to stops_name
The existing Route data was copied to the stops_name column for further manipulation.

```SQL
UPDATE flight t1
SET stops_name = t1.Route;
```

3. Remove First Stop from the Route
The first stop (i.e., the first part of the route) was removed by using the substring_index() function, which extracts the portion of the route before the first occurrence of `→`.

```SQL
UPDATE flight t1
SET stops_name = (
  SELECT REPLACE(stops_name, SUBSTRING_INDEX(stops_name, ' → ', 1), '') 
  FROM (SELECT * FROM flight) t2 
  WHERE t1.index = t2.index
);
```

4. Remove Last Stop from the Route
Similarly, the last stop (i.e., the last part of the route) was removed by using substring_index() to extract the portion of the route after the last `→`.

```SQL
UPDATE flight t1
SET stops_name = (
  SELECT REPLACE(stops_name, SUBSTRING_INDEX(stops_name, ' → ' ,-1), '') 
  FROM (SELECT * FROM flight) t2 
  WHERE t1.index = t2.index
);
```

5. Extract and Clean Stop Names Using Regex
Using `REGEXP_SUBSTR`, I extracted and cleaned the `stops_name` to remove unwanted characters like extra spaces and commas.

```SQL
UPDATE flight t1
SET stops_name = (
  SELECT  
  CASE 
    WHEN nws != ',' THEN REGEXP_SUBSTR(nws, '[A-Z,]+')
  END AS regexs
  FROM (
    SELECT stops_name, 
           REPLACE(stops_name, '→', '') AS 'nw', 
           REPLACE(REPLACE(stops_name, '→', ''), '  ', ',') AS 'nws' 
    FROM (SELECT * FROM flight) t2 
    WHERE t1.index = t2.index
  ) t3
);

```

6. Trim Leading and Trailing Commas
Finally, I removed any leading and trailing commas from the `stops_name` column to ensure a clean, properly formatted result.

```SQL
UPDATE flight t1
SET stops_name = (
  SELECT TRIM(BOTH ',' FROM stops_name) 
  FROM (SELECT * FROM flight) t2 
  WHERE t1.index = t2.index
);

```
#### Now the data looks like this after cleaning the Router COlumn

![clened_route_image](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/cleaned_Router_column.png)

### Date Column Formatting 
![](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/date_formating.png)

#### Steps performed for formatting the date Column

```SQL
update flight t1
set Date_of_Journey = (
select str_to_date(date_of_journey,'%d/%m/%Y') from (select * from flight) t2 where t1.index = t2.index);

```

## 1. Case study Find the month with the number of flights.

```SQL
SELECT 
    MONTHNAME(Date_of_journey) AS Month_Name,
    COUNT(*) AS Journey_Count
FROM 
    journeys_table
GROUP BY 
    MONTH(Date_of_journey)
ORDER BY 
    MONTH(Date_of_journey);

```

![month wise flight departure](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/In%202019%20Month%20wise%20flight%20departure%20count.png)

    observation: The data reflects a clear seasonal pattern in travel behavior. High travel counts in June, March, and May are likely driven by school holidays. 
    favorable weather, and special events, while low counts in January, December, and April may result from financial considerations, winter conditions, and routine family commitments.

## 2. Case study Finds which weekday has the most costly flight.

```SQL
SELECT 
    DAYNAME(Date_of_Journey) AS Weekday,
    AVG(Price) AS Average_Price
FROM 
    flight
GROUP BY 
    DAYNAME(Date_of_Journey)
ORDER BY 
    AVG(Price) DESC;

```

![Avg_price vs Weekdays](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/avg_Price%20vs%20Weekdays.png)

#### Analysis of Flight Price Variations:
   > Thursday (9805.09): <br> >. Business Travel: Many business travelers prefer flying on Thursdays to reach their destinations before weekend meetings, driving up demand and prices.
> Weekend Preparation: Travelers may begin their journeys on Thursdays for weekend getaways, increasing demand for flights.

> Monday (9721.10):<br> >.Return of Business Travelers: Many return from weekend trips or business trips, leading to higher prices due to increased demand.
> Sunday (9556.83)<br> >.End of Weekend Travel: People returning home from weekend trips may drive up prices, especially for popular destinations.

#### Lower-Priced Weekdays
> Tuesday (8960.45) and Saturday (8894.38): These days typically have lower demand, as fewer people travel for business or leisure compared to Thursdays and Mondays.
> Friday (8556.50) and Wednesday (7996.29): Midweek flights generally see lower demand, particularly Wednesdays, as many travelers prefer weekends.

## 3. Case study Finds the number of indigo flights every month?

```SQL
SELECT 
    MONTHNAME(Date_of_Journey) AS Month_Name,
    COUNT(*) AS Flight_Count
FROM 
    flight
WHERE 
    airline = 'indigo'
GROUP BY 
    MONTHNAME(Date_of_Journey)
ORDER BY 
    COUNT(*) DESC;

```

![Indigo month wise flight count](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/IndiGO%20Flights%20Counts%20monthwise.png)


## 4. Case study Finds a list of all flights departing between 10 Am and 2 Pm from  Banglore to delhi? 

```SQL
SELECT * 
FROM flight 
WHERE source = 'Banglore' 
  AND destination = 'Delhi'
  AND dep_time BETWEEN '10:00:00' AND '14:00:00';


```

![Banglore to Delhi Flight](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/banglor_to_delhi.png)



## 5. Case study Finds the number of flights departing on weekends from Banglore.

```SQL
select *,dayname(Date_of_Journey) from flight
where source = 'Bangalore'
and dayname(Date_of_Journey) in ('Saturday', 'Sunday')
;

```

![Banglore flight during weekdays](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/flight_departing_on_weekdays.png)

## 6. Case study Calculate the arrival time for all flights by adding the duration to the departure time.

### Another challenge arises because of the duration column i have to convert it into a minute

```SQL
update flight t1
set duration_min = replace(substring_index(duration,' ',1),'h','') *60 + 
 case 
	when substring_index(duration,' ',-1) = substring_index(duration,' ',1) then 0
    else replace(substring_index(duration,' ',-1),'m','')
 end;

```

![duration_Time_converting_into_time](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/total_time_for_flight.png)

```I have combined the dep_time and date of the journey to create the new departure column.```

``` Now I have created two more columns in order to add the minute to get the departure time and arrival time ```

```SQL
alter table flight
add column departure DATETIME after Date_of_journey; 

update flight t1
set departure = str_to_date(concat(date_of_journey,' ',dep_time),'%Y-%m-%d %H:%i');
```

![Combining dep_time_and_Date_of_journey](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/combining_dep_time_and_date.png)


Now I have added the duration minute to the departure column in order to get the Arrival date

```SQL
	update flight t1
set arrival = (date_add(departure, interval duration_min minute));

select departure,duration_min, date_add(departure, interval duration_min minute) from flight;
```

![adding Duration to departure to get the arrival time](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/adding_dep_to_duration_min.png)


#### Case study 6 question answer
```SQL
select time(arrival) from flight;

```
![Calculate_Arrival_time](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/Arrival_time_calculated.png)


## 7. Case study Calculate the arrival date for all the flights.

```SQL

select date(arrival) as Arrival_Date from flight;
```
![Calculate_Arrival_date](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/Arrival_date.png)


## 8. Case study FInd the number of flights which travel on multiple dates;
```SQL

	select * from flight where date(departure) != date(arrival);
```
![Flight_on_different_dates](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/flight_on_different_dates.png)


## 9. Case study Calculate the average duration of flights between two cities;
```SQL

	select Source, Destination,avg(duration_min)
        from flight
	group by Source, Destination;
```
![Average_flight_duration_between_2_cities](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/Avg_time_flight_between_2_cities.png)

### 9.1. Case study Extra hard question Calculate the average duration of flights between two cities and the duration time format should be in (xh ym).
```SQL

	# There is a function called Sec_to_time that converts seconds into hours: min: sec

	select source,Destination,avg(duration_min),time_format(sec_to_time(avg(duration_min)*60),'%kh %im') from flight 
	group by Source, Destination
;

```
![AVG_Duration_time_in_time_format](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/9.1_extra_hard_question.png)


## 10. Case study Find all flights that departed before midnight but arrived at their destination after midnight having only 0 stops that arrive at their destination after midnight.
```SQL

	select * from flight 
	where time(departure) < '12:00:00' 
	and time(arrival) > '12:00:00'
	and Total_Stops = 'non-stop';

```
![10_Flight_Arrived_After_midnight](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/10_flight_arrived_after_midnight.png)



## 11. Case study  Find quarter wise number of flights for each airline
```SQL

	select airline,quarter(departure),count(*)
	from flight
	group by airline, quarter(departure)
	;

```
![11_Flight_count_quarter_wise](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/11.png)



## 12. Case study Find the longest flight distance (between cities in terms of time) in India.
```SQL

	select Source,Destination,time_format(sec_to_time(max(Duration_min)*60),'%kh %im') 
	from flight
	group by Source, Destination;

```
![12_Longest_Flight_distancec_in_terms_of_times](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/12.png)


## 13. Case study Average time duration for flights that have 1 stop vs more than 1 stop.
```SQL

	select Total_Stops,avg(duration_min) from flight
	group by total_stops;

```
![13_comparizon_between_1_stop_vs_more_than_1_stop.](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/13.png)

### 13.1 Case study Average time and average price duration for flights that have 1 stop vs more than 1 stop.
```SQL

	select Total_Stops,time_format(sec_to_time(avg(duration_min)*60),'%kh %im') as avg_duration_1_vs_many,
	avg(price)
	from flight
	group by total_stops order by avg(price) desc;

```
![13_comparizon_between_price_and_1_stop_vs_more_than_1_stop](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/13.1.png)

    
## 14 Case study  Find all Air India flights in a given date range originating from Delhi.

```SQL

	select * from flight
	where Source = 'Delhi' and
	DATE(departure) BETWEEN ('2019-03-01') AND ('2019-03-10');

```
![14_ Air India flights in a given date range originating from Delhi](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/14.png)



## 15 Case study Find the longest flight of each airline.

```SQL

	select Airline,
	time_format(sec_to_time(max(duration_min)*60),'%kh %im')
	as 'longest flight'
	from flight
	group by Airline;

```
![15_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/15.png)


### 15.1 Case study Find the longest flight of each airline along with there source and destination.

```SQL

	select Airline, Source, Destination,
	time_Format(sec_to_time(max(duration_min)*60),'%kh %im')
	as 'longest_flight'
	from flight
	group by Airline, source, Destination
	having (airline,longest_flight) in (select airline,time_Format(sec_to_time(max(duration_min)*60),'%kh %im') from flight GROUP BY airline);

```
![15.1_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/15.1.png)


## 16 Case study Find all the pairs of cities having an average time duration of > 3 hours.

```SQL

	select source, destination,avg(duration_min)
	 from flight
	 group by source, Destination
	 HAVING avg(duration_min) > 180;

```
![15.1_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/16.png)


## 17 Case study Make a weekday vs time grid showing the frequency of flights from Bangalore to Delhi

```SQL

	select dayname(departure),
	 sum(case when hour(departure) between '00:00:00' and '05:00:00' then 1 else 0 end) as '12am - 6am',
	 sum(case when hour(departure) between '06:00:00' and '11:00:00' then 1 else 0 end) as '6am - 12pm',
	 sum(case when hour(departure) between '12:00:00' and '17:00:00' then 1 else 0 end) as '12pm - 6pm',
	 sum(case when hour(departure) between '18:00:00' and '23:00:00' then 1 else 0 end) as '6pm - 12am'
	 from flight where Source = 'Bangalore' and Destination = 'Delhi' 
	 group by dayname(departure);

```
![17_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/17.png)

![17_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/12am%20-%206am%2C%206am%20-%2012pm%2C%2012pm%20-%206pm%20and%206pm%20-%2012am.png)

conclusion:
This chart clearly indicates the busiest flight departure periods across the week, with a clear preference for early morning flights on weekdays, particularly around Wednesday. The data suggests a business-driven pattern, with leisure travel peaking toward the end of the week, particularly on Fridays and Sundays.


## 18 Case study Make a weekday vs time grid showing average flight price from Banglore and Delhi

```SQL

	 select dayname(departure),
	 avg(case when hour(departure) between '00:00:00' and '05:00:00' then price else NULL end) as '12am - 6am',
	 avg(case when hour(departure) between '06:00:00' and '11:00:00' then price else NULL end) as '6am - 12pm',
	 avg(case when hour(departure) between '12:00:00' and '17:00:00' then price else NULL end) as '12pm - 6pm',
	 avg(case when hour(departure) between '18:00:00' and '23:00:00' then price else NUll end) as '6pm - 12am'
	 from flight where Source = 'Bangalore' and Destination = 'Delhi' 
	 group by dayname(departure);

```
![17_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/18.png)

![17_ Longest flight for each airline](https://github.com/shanto173/SQL_2024_Datetime/blob/main/images/12am%20-%206am%2C%206am%20-%2012pm%2C%2012pm%20-%206pm%20and%206pm%20-%2012am%20(1).png)

conclusion:
The data suggests that flight prices are heavily influenced by business travel patterns. Flights between 6 AM - 12 PM tend to be the most expensive, particularly on weekdays, driven by business demand. In contrast, flights from 12 AM - 6 AM are consistently the cheapest due to lower demand. Prices on weekends tend to be lower overall, reflecting a shift from business to leisure travel. This report provides key insights into the optimal times for booking flights based on travel needs and budget preferences.






    
