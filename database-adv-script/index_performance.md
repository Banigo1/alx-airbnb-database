email is the most used column in User table
property_id is the most used column in Booking table
name is the most used column in Property table

First query
SELECT first_name FROM User WHERE email = 'johndoe@example.com';

performance before is actual time=0..1
performance after is actual time=100e-6..100e-6

Second query
SELECT * FROM Booking WHERE property_id IN ( SELECT id FROM Property WHERE name = 'Beach House' );

performance before is actual time=1.0622..0.0638
performance after is actual time=0.0622..0.0638

Third query
SELECT * FROM Property WHERE name = 'Beach House';

performance before is actual time=0.0627..0.0738
performance after is actual time=0.0206..0.0231

EXPLAIN ANALYZE SELECT first_name FROM User WHERE email = 'johndoe@example.com';
CREATE INDEX email_index on User(email);
EXPLAIN ANALYZE SELECT first_name FROM User WHERE email = 'johndoe@example.com';

EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id IN (SELECT id FROM Property  WHERE name = 'Beach House');
CREATE INDEX prop_id_index on Booking(property_id);
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id IN (SELECT id FROM Property  WHERE name = 'Beach House');


EXPLAIN ANALYZE SELECT * FROM Property WHERE name = 'Beach House';
CREATE INDEX name_index ON Property (name);