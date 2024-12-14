-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_created_at ON User(created_at);

-- Booking Table Indexes
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Property Table Indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price);

-- Query Performance Measurement

-- Step 1: Analyze before adding indexes
ANALYZE Booking;

-- Step 2: Check performance before adding indexes
EXPLAIN SELECT * FROM Booking WHERE user_id = 1;

-- Step 3: Add indexes
CREATE INDEX idx_booking_user ON Booking(user_id);

-- Step 4: Analyze after adding indexes
ANALYZE Booking;

-- Step 5: Check performance after adding indexes
EXPLAIN SELECT * FROM Booking WHERE user_id = 1;












EXPLAIN ANALYZE SELECT first_name FROM User WHERE email = 'johndoe@example.com';
CREATE INDEX email_index on User(email);
EXPLAIN ANALYZE SELECT first_name FROM User WHERE email = 'johndoe@example.com';

EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id IN (SELECT id FROM Property  WHERE name = 'Beach House');
CREATE INDEX prop_id_index on Booking(property_id);
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id IN (SELECT id FROM Property  WHERE name = 'Beach House');


EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Beach House';
CREATE INDEX name_index ON Property (name);
EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Beach House';