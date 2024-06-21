# 1. Total Reserveations in the DAtaset
select count(Booking_ID) as Total_Reservations 
from esd_practice;

# 2. which meal plan is the most popular among the guests
select type_of_meal_plan as Meal_Plan, 
count(type_of_meal_plan) as Total from esd_practice
group by type_of_meal_plan order by total desc;

# 3. What is the average price per room for reservations involving children?
select avg(avg_price_per_room) as Avg_Price 
from esd_practice where no_of_children >=1;

# 4. How many reservations were made for the year 20XX (replace XX with the desired year)?
select year(str_to_date(arrival_date, "%d-%m-%y")) as Year,
count(*) as Total from esd_practice group by year;

# 5. What is the most commonly booked room type? 
select room_type_reserved as Room_Type, 
count(room_type_reserved) as Total from esd_practice
group by Room_Type order by Total desc;

# 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? 
select count(*) Total_Reservations_on_Weekend 
from esd_practice where no_of_weekend_nights>0;


# 7. What is the highest and lowest lead time for reservations?
select max(lead_time) as Highest_Lead_Time, 
min(lead_time) as Lowest_Lead_Time from esd_practice;

# 8. What is the most common market segment type for reservations? 
select market_segment_type, count(market_segment_type) as With_Total 
from esd_practice group by market_segment_type 
order by With_Total desc limit 1;

# 9. How many reservations have a booking status of "Confirmed"? 
select count(booking_status) as Total_Booking_Status_Confirmed 
from esd_practice where booking_status = "Not_Canceled";

# 10. What is the total number of adults and children across all reservations?
select sum(no_of_adults) as Total_adults, 
sum(no_of_children) as Total_children from esd_practice;

 
# 11. What is the average number of weekend nights for reservations involving children? 
select avg(no_of_weekend_nights) Avg_Weekend_night 
from esd_practice where no_of_weekend_nights > 0 and no_of_children > 0;

# 12. How many reservations were made in each month of the year?
select monthname(str_to_date(arrival_date, "%d-%m-%y")) as Months, 
count(*) as Total from esd_practice group by Months order by Months;

# 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
select room_type_reserved as Room_Type, 
avg(no_of_week_nights + no_of_weekend_nights) as Avg_Nights 
from esd_practice group by Room_Type;

# 14. For reservations involving children, what is the most common room type, and what is the average price for that room type? 
select room_type_reserved as Room_Type, 
avg(avg_price_per_room) as average_price from esd_practice 
where no_of_children >= 1 group by room_type_reserved 
order by average_price desc limit 1;

# 15. Find the market segment type that generates the highest average price per room.
select market_segment_type, sum(avg_price_per_room) as Total_price 
from esd_practice group by market_segment_type 
order by Total_price desc limit 1;

