# SELECT * FROM data_cleaning_project.flight;

# alter TABLE flight 
# add COLUMN stops_name VARCHAR(255) after Route;
# # route

# SELECT * from flight;

# update flight t1
# set stops_name = t1.Route
# ;

# update flight t1
# set stops_name = (
# select replace(stops_name,substring_index(stops_name,' → ',1),'')  from (select * from flight) t2 where t1.index = t2.index);

# update flight t1
# set stops_name = (
# select replace(stops_name,substring_index(stops_name,' → ' ,-1),'')  from (select * from flight) t2 where t1.index = t2.index);

# select Route,substring_index(Route,' → ' ,-1),replace(Route,substring_index(Route,' → ' ,-1),'') from flight; #' → IXR → BBI → BLR'

# update flight t1
# set stops_name = (
# select  
# case 
# 	when nws != ','  then REGEXP_SUBSTR(nws,'[A-Z,]+')
# end as regexs
#  from (select stops_name,replace(stops_name,'→','') as 'nw',replace(replace(stops_name,'→',''),'  ',',') as 'nws' from 
#  (select * from flight) t2 where t1.index= t2.index) t3);
#  ;
#  
# update flight t1
# set stops_name=(
# select TRIM(BOTH ',' FROM stops_name) from (select * from flight) t2 where t1.index=t2.index);

# Alter table flight
# drop COLUMN Route;
# select * from flight; 

# ### FOrmating the date time column

# update flight t1
# set Date_of_Journey = (
# select str_to_date(date_of_journey,'%d/%m/%Y') from (select * from flight) t2 where t1.index = t2.index);













## CASE Study
# 1. Find the month with number of flights

select * from flight;
select monthname(Date_of_journey),count(*)
from flight
group by monthname(date_of_journey) 
order by count(*) desc
;


# 2. which week day has most costly flight

select * from flight;

select dayname(Date_of_Journey),avg(Price)
from flight
group by dayname(Date_of_Journey)
ORDER BY avg(price) desc
;



# 3. find number of indigo flight every month? 

select * from flight;

select monthname(Date_of_Journey),count(*)
from flight
where airline = 'indigo'
group by monthname(Date_of_Journey)
order by count(*) desc
;

# 4. find list of all flights departing between
# 10Am and 2Pm from  banglore to delhi? 

select * from flight;

select * from flight 
where source = 'Banglore' and destination = 'delhi'
and dep_time BETWEEN '10:00:00' and '14:00:00';

# 5. find the number of flights departing 
# on weekends from banglore?

select * from flight;

select *,dayname(Date_of_Journey) from flight
where source = 'banglore'
and dayname(Date_of_Journey) in ('Saturday','Sunday')
;


# 6. calculate the arrival time for all flight
# by adding the duration to the departure time?

select * from flight;
# Creating a column for departure in a standard format

alter table flight
add column departure DATETIME after Date_of_journey; 

update flight t1
set departure = str_to_date(concat(date_of_journey,' ',dep_time),'%Y-%m-%d %H:%i');

## Creating 2 new column for duration in minute and arrival time

Alter table flight
add column duration_mins integer,
add column arrival DATETIME;

# convertiing hour into min 
select duration,replace(substring_index(duration,' ',1),'h','') *60 + 
 case 
	when substring_index(duration,' ',-1) = substring_index(duration,' ',1) then 0
    else replace(substring_index(duration,' ',-1),'m','')
 end as min
 from flight;

select * from flight;


update flight t1
set duration_min = replace(substring_index(duration,' ',1),'h','') *60 + 
 case 
	when substring_index(duration,' ',-1) = substring_index(duration,' ',1) then 0
    else replace(substring_index(duration,' ',-1),'m','')
 end;

update flight t1
set arrival = (date_add(departure, interval duration_min minute));

select departure,duration_min, date_add(departure, interval duration_min minute) from flight;

# case studey 6

select time(arrival) as Arrival_time from flight;

# case studey 8
select count(*) as 'Flight_on_different_Dates' from flight where date(departure) != date(arrival);

# Case study 9  Calculate the average duration of flights between two cities.

select Source,Destination,avg(duration_min) from flight
group by Source,Destination;

## Extrac hard question Calculate the average duration of flights between two cities and avg duration time format 
# should be in (xh ym).

# There is a function called Sec_to_time it convert second into hour : min: sec
select source,Destination,avg(duration_min),
time_format(sec_to_time(avg(duration_min)*60),'%kh %im')
from flight 
group by Source,Destination
;

#10. Find all flights which departed before midnight but arrived at 
# there destination after midnight having only 0 stops that arrive at their destination after midnight.
select * from flight 
where time(departure) < '12:00:00' 
and time(arrival) > '12:00:00'
and Total_Stops = 'non-stop'
;

## 11. Find quarter wise number of flight for each airline


select airline,quarter(departure),count(*)
from flight
group by airline,quarter(departure)
;

# 12. Find the longest flight distance (between cities in terms of time) in India.
select Source,Destination,time_format(sec_to_time(max(Duration_min)*60),'%kh %im') 
from flight
group by Source,Destination
;

# 13. Average time duration for flights that have 1 stop vs more than 1 stop.

select Total_Stops,time_format(sec_to_time(avg(duration_min)*60),'%kh %im') as avg_duration_1_vs_many,
avg(price)
from flight
group by total_stops order by avg(price) desc;

 #14. Find all Air India flights in a given date range originating from Delhi.
select * from flight;

select * from flight
where Source = 'Delhi' and
DATE(departure) BETWEEN ('2019-03-01') AND ('2019-03-10');

# 15. Find the longest flight of each airline.

select Airline,source,Destination,
time_Format(sec_to_time(max(duration_min)*60),'%kh %im')
as 'longest_flight'
from flight
group by Airline,source,Destination
having (airline,longest_flight) in (select airline,time_Format(sec_to_time(max(duration_min)*60),'%kh %im') from flight GROUP BY airline)
;

# 16. Find all the pairs of cities having an average time duration of > 3 hours.

select source,destination,avg(duration_min)
 from flight
 group by source,Destination
 HAVING avg(duration_min) > 180
 ;

# 17.make a weekday vs time grid showing frequently of flight from banglore and delhi

select dayname(departure),
 sum(case when hour(departure) between '00:00:00' and '05:00:00' then 1 else 0 end) as '12am - 6am',
 sum(case when hour(departure) between '06:00:00' and '11:00:00' then 1 else 0 end) as '6am - 12pm',
 sum(case when hour(departure) between '12:00:00' and '17:00:00' then 1 else 0 end) as '12pm - 6pm',
 sum(case when hour(departure) between '18:00:00' and '23:00:00' then 1 else 0 end) as '6pm - 12am'
 from flight where Source = 'banglore' and Destination = 'delhi' 
 group by dayname(departure);

# 18.make a weekday vs time grid showing avg flight price from banglore and delhi

select dayname(departure),
 avg(case when hour(departure) between '00:00:00' and '05:00:00' then price else NULL end) as '12am - 6am',
 avg(case when hour(departure) between '06:00:00' and '11:00:00' then price else NULL end) as '6am - 12pm',
 avg(case when hour(departure) between '12:00:00' and '17:00:00' then price else NULL end) as '12pm - 6pm',
 avg(case when hour(departure) between '18:00:00' and '23:00:00' then price else NUll end) as '6pm - 12am'
 from flight where Source = 'banglore' and Destination = 'delhi' 
 group by dayname(departure);











