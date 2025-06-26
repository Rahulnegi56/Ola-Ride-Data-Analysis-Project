
-- 1. Retrieve all successful bookings:--

select*from booking where Booking_Status = 'success';

CREATE VIEW successful_booking AS
    SELECT 
        *
    FROM
        booking
    WHERE
        Booking_Status = 'success';
        
-- final_answer --
select*from successful_booking;

-- Find the average ride distance for each vehicle type: --

CREATE VIEW avg_distance AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS avg_distance
    FROM
        booking
    GROUP BY Vehicle_Type;
 
 -- final_ans --
 select*from avg_distance;
 
 --  Get the total number of cancelled rides by customers: --

CREATE VIEW cancelled_rides_by_customer AS
    SELECT 
        COUNT(Booking_Status)
    FROM
        booking
    WHERE Booking_Status = 'Canceled by Customer';


select*from cancelled_rides_by_customer;

-- List the top 5 customers who booked the highest number of rides: --


CREATE VIEW highest_no_of_rides AS
    SELECT 
        Customer_ID, COUNT(Customer_ID) AS TOTAL_RIDES
    FROM
        booking
    GROUP BY Customer_ID
    ORDER BY total_rides DESC
    LIMIT 5;

select*from highest_no_of_rides;

-- Get the number of rides cancelled by drivers due to personal and car-related issues: --


create view Cancel_rides_by_driver as
select Canceled_Rides_by_Driver, count(Canceled_Rides_by_Driver) as cancel_rides
from booking
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select*from Cancel_rides_by_driver;

-- Find the maximum and minimum driver ratings for Prime Sedan bookings: --


CREATE VIEW max_min_rating AS
    SELECT 
        MAX(Driver_Ratings) AS max_rating,
        MIN(Driver_Ratings) AS min_rating
    FROM
        booking
    WHERE
        Vehicle_Type = 'prime sedan';

select*from max_min_rating;

--  Retrieve all rides where payment was made using UPI: --

CREATE VIEW Upi_payment as 
select *from booking where Payment_Method = 'UPI';

select*from Upi_payment;

-- Find the average customer rating per vehicle type: --


CREATE VIEW avg_cust_rating AS
    SELECT 
        Vehicle_Type, AVG(Customer_Rating) AS avg_cust_rating
    FROM
        booking
    GROUP BY Vehicle_Type;

select*from avg_cust_rating ;

-- Calculate the total booking value of rides completed successfully according to vehicle type: --

CREATE VIEW total_amt AS
    SELECT 
        Vehicle_Type,
        Booking_Status,
        SUM(Booking_Value) AS total_amt
    FROM
        booking
    WHERE
        Booking_Status = 'Success'
    GROUP BY Vehicle_Type;

select*from total_amt;

-- List all incomplete rides along with the reason --


create view incomplete_ride as 
select Booking_ID, Incomplete_Rides_Reason
from booking
where Incomplete_Rides_Reason <> 'null';

-- final_ans --

select*from incomplete_ride;





