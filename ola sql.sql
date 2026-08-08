CREATE DATABASE IF NOT EXISTS OLA;
USE OLA;

-- Check columns first
SHOW COLUMNS FROM bookings;

-- Check sample data
SELECT * FROM bookings LIMIT 5;

-- 1. Successful Bookings
CREATE VIEW successful_bookings AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Successful';

SELECT * FROM successful_bookings;

-- 2. Average Ride Distance Per Vehicle Type
CREATE VIEW avg_distance AS
SELECT Vehicle_Type,
AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM avg_distance;

-- 3. Cancelled Rides By Customers
CREATE VIEW total_rides_cancelled_by_customers AS
SELECT *
FROM bookings
WHERE Booking_Status = 'Cancelled by Customer';

SELECT * FROM total_rides_cancelled_by_customers;

-- 4. Top 5 Customers
CREATE VIEW top_5_customers AS
SELECT Customer_ID,
COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

SELECT * FROM top_5_customers;

-- 5. Driver Cancelled Rides Due To Personal & Car Issues
CREATE VIEW rides_cancelled_by_drivers_due_to_PC_related_issues AS
SELECT COUNT(*) AS total_cancelled
FROM bookings
WHERE Cancelled_Rides_by_Driver =
'Personal & Car related issues';

SELECT * FROM rides_cancelled_by_drivers_due_to_PC_related_issues;

-- 6. Max and Min Driver Ratings for Prime Sedan
CREATE VIEW max_min_driver_ratings AS
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM max_min_driver_ratings;

-- 7. UPI Payment Rides
CREATE VIEW upi_payment AS
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM upi_payment;

-- 8. Average Customer Rating Per Vehicle Type
CREATE VIEW avg_CR_per_VT AS
SELECT Vehicle_Type,
AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;

SELECT * FROM avg_CR_per_VT;

-- 9. Total Successful Booking Value
CREATE VIEW total_successful_bookings AS
SELECT SUM(Booking_Value) AS total_successful_booking_value
FROM bookings
WHERE Booking_Status = 'Successful';

SELECT * FROM total_successful_bookings;

-- 10. Incomplete Rides With Reason
CREATE VIEW all_incomplete_rides_WR AS
SELECT Booking_ID,
Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM all_incomplete_rides_WR;

-- ============================================
-- DROP ALL EXISTING VIEWS
-- ============================================

-- 1. Drop Successful Bookings View
DROP VIEW IF EXISTS successful_bookings;

-- 2. Drop Average Ride Distance View
DROP VIEW IF EXISTS avg_distance;

-- 3. Drop Customer Cancelled Rides View
DROP VIEW IF EXISTS total_rides_cancelled_by_customers;

-- 4. Drop Top 5 Customers View
DROP VIEW IF EXISTS top_5_customers;

-- 5. Drop Driver Cancelled Rides Due to Personal & Car Issues View
DROP VIEW IF EXISTS rides_cancelled_by_drivers_due_to_PC_related_issues;

-- 6. Drop Maximum & Minimum Driver Ratings View
DROP VIEW IF EXISTS max_min_driver_ratings;

-- 7. Drop UPI Payment Rides View
DROP VIEW IF EXISTS upi_payment;

-- 8. Drop Average Customer Rating Per Vehicle Type View
DROP VIEW IF EXISTS avg_CR_per_VT;

-- 9. Drop Total Successful Booking Value View
DROP VIEW IF EXISTS total_successful_bookings;

-- 10. Drop Incomplete Rides With Reason View
DROP VIEW IF EXISTS all_incomplete_rides_WR;