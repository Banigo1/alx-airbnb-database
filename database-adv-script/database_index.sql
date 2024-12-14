-- User Table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20),
    city VARCHAR(255),
    country VARCHAR(255)
);

-- Booking Table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    user_id INT,
    property_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_price DECIMAL(10, 2),
    status VARCHAR(50), 
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

-- Property Table
CREATE TABLE Property (
    property_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    property_type VARCHAR(50),
    owner_id INT, -- Assuming 'owner_id' references another table
    price_per_night DECIMAL(10, 2)
);

-- Identify high-usage columns

-- User Table
-- High-usage columns: user_id, email 

-- Booking Table
-- High-usage columns: user_id, property_id, check_in_date, check_out_date, status

-- Property Table
-- High-usage columns: property_id, city, country, price_per_night

-- Create index commands

-- User Table
CREATE INDEX idx_user_email ON User(email);

-- Booking Table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_check_in_date ON Booking(check_in_date);
CREATE INDEX idx_booking_check_out_date ON Booking(check_out_date);
CREATE INDEX idx_booking_status ON Booking(status);

-- Property Table
CREATE INDEX idx_property_city ON Property(city);
CREATE INDEX idx_property_country ON Property(country);
CREATE INDEX idx_property_price_per_night ON Property(price_per_night);

-- Before adding indexes
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;
EXPLAIN ANALYZE SELECT * FROM Property WHERE city = 'New York';

-- Create index commands (as shown above)

-- After adding indexes
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;
EXPLAIN ANALYZE SELECT * FROM Property WHERE city = 'New York';
