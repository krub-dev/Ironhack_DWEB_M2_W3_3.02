-- Use database
USE airlineDB;

-- 3. Get the total number of flights in the database
SELECT COUNT(*) AS total_flights
FROM Flight;

-- 4. Get the average flight distance
SELECT AVG(flight_mileage) AS avg_flight_distance
FROM Flight;

-- 5. Get the average number of seats
SELECT AVG(total_seats) AS avg_number_of_seats
FROM Aircraft;

-- 6. Get the average number of miles flown by customers grouped by status
SELECT status, AVG(total_mileage) AS avg_miles_flown
FROM Customer
GROUP BY status;

-- 7. Get the maximum number of miles flown by customers grouped by status
SELECT status, MAX(total_mileage) AS max_miles_flown
FROM Customer
GROUP BY status;

-- 8. Get the total number of aircraft with a name containing Boeing
SELECT COUNT(*) AS total_boeing_aircraft
FROM Aircraft
WHERE name LIKE '%Boeing%';

-- 9. Find all flights with a distance between 300 and 2000 miles
SELECT * FROM Flight
WHERE flight_mileage BETWEEN 300 AND 2000;

-- 10. Find the average flight distance booked grouped by customer status
SELECT cust.status, AVG(fl.flight_mileage) AS avg_booked_distance
FROM Booking bk
JOIN Customer cust ON bk.customer_id = cust.id
JOIN Flight fl ON bk.flight_id = fl.id
GROUP BY cust.status;

-- 11. Find the most often booked aircraft by gold status members
SELECT a.name, COUNT(*) AS bookings
FROM Booking bk
JOIN Customer cust ON bk.customer_id = cust.id
JOIN Flight fl ON bk.flight_id = fl.id
JOIN Aircraft a ON fl.aircraft_id = a.id
WHERE cust.status = 'Gold'
GROUP BY a.name
ORDER BY bookings DESC
LIMIT 1;
