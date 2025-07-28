-- Create database
CREATE DATABASE IF NOT EXISTS airlineDB;

-- Use database
USE airlineDB;

-- View database
SHOW TABLES;
SELECT * FROM Customer;
SELECT * FROM Aircraft;
SELECT * FROM Flight;
SELECT * FROM Booking;

/* 2. Normalize the following airline database and write 
the DDL scripts to create the database tables: */
CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    status ENUM('Gold', 'Silver', 'None') NOT NULL,
    total_mileage INT
);

CREATE TABLE Aircraft (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    total_seats INT
);

CREATE TABLE Flight (
    id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10) NOT NULL,
    aircraft_id INT NOT NULL,
    flight_mileage INT NOT NULL,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(id)
);

CREATE TABLE Booking (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    flight_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (flight_id) REFERENCES Flight(id)
);

# INSERT DATA
-- Airline data (for test)
INSERT INTO Customer (name, status, total_mileage) VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO Aircraft (name, total_seats) VALUES
('Boeing 747', 400),    -- id=1
('Airbus A330', 236),   -- id=2
('Boeing 777', 264);    -- id=3

INSERT INTO Flight (flight_number, aircraft_id, flight_mileage) VALUES
('DL143', 1, 135),      -- id=1
('DL122', 2, 4370),     -- id=2
('DL53', 3, 2078),      -- id=3
('DL222', 3, 1765),     -- id=4
('DL37', 1, 531);       -- id=5

INSERT INTO Booking (customer_id, flight_id) VALUES
(1, 1), -- Agustine Riviera, DL143
(1, 2), -- Agustine Riviera, DL122
(2, 2), -- Alaina Sepulvida, DL122
(1, 1), -- Agustine Riviera, DL143 (repetido)
(3, 2), -- Tom Jones, DL122
(3, 3), -- Tom Jones, DL53
(1, 1), -- Agustine Riviera, DL143 (repetido)
(4, 1), -- Sam Rio, DL143
(1, 1), -- Agustine Riviera, DL143 (repetido)
(3, 4), -- Tom Jones, DL222
(5, 1), -- Jessica James, DL143
(4, 1), -- Sam Rio, DL143 (repetido)
(6, 4), -- Ana Janco, DL222
(7, 4), -- Jennifer Cortez, DL222
(5, 2), -- Jessica James, DL122
(4, 5), -- Sam Rio, DL37
(8, 4); -- Christian Janco, DL222