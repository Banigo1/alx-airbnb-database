-- User Table Indexes
CREATE INDEX idx_users_email ON User(email);
CREATE INDEX idx_users_created_at ON User(created_at);

-- Measure performance before adding indexes
-- Query: Fetch user bookings by email
EXPLAIN ANALYZE SELECT b.* 
FROM Booking b
JOIN User u ON b.user_id = u.id
WHERE u.email = 'test@example.com';

-- Booking Table Indexes
CREATE INDEX idx_bookings_user_id ON Booking(user_id);
CREATE INDEX idx_bookings_property_id ON Booking(property_id);
CREATE INDEX idx_bookings_booking_date ON Booking(booking_date);

-- Measure performance before adding indexes
-- Query: Retrieve properties within a price range
EXPLAIN ANALYZE SELECT * 
FROM Property 
WHERE price BETWEEN 100 AND 500;

-- Property Table Indexes
CREATE INDEX idx_properties_location ON Property(location);
CREATE INDEX idx_properties_price ON Property(price);

-- Measure performance after adding indexes
-- Query: Fetch user bookings by email
EXPLAIN ANALYZE SELECT b.* 
FROM Booking b
JOIN User u ON b.user_id = u.id
WHERE u.email = 'test@example.com';

-- Query: Retrieve properties within a price range
EXPLAIN ANALYZE SELECT * 
FROM Property 
WHERE price BETWEEN 100 AND 500;
