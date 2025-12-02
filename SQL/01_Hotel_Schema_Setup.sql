
-- Hotel Schema Setup

CREATE TABLE users (
  user_id VARCHAR(50) PRIMARY KEY,
  name TEXT,
  phone_number VARCHAR(20),
  mail_id TEXT,
  billing_address TEXT
);

CREATE TABLE bookings (
  booking_id VARCHAR(50) PRIMARY KEY,
  booking_date TIMESTAMP,
  room_no VARCHAR(20),
  user_id VARCHAR(50) REFERENCES users(user_id)

);


CREATE TABLE booking_commercials (
  id VARCHAR(50) PRIMARY KEY,
  booking_id VARCHAR(50) REFERENCES bookings(booking_id),
  bill_id VARCHAR(50),
  bill_date TIMESTAMP,
  item_id VARCHAR(50),
  item_quantity NUMERIC
);

CREATE TABLE items (
  item_id VARCHAR(50) PRIMARY KEY,
  item_name TEXT,
  item_rate NUMERIC
);

-- Sample INSERTS (dummy placeholders)
INSERT INTO users VALUES ('U1','John','9999','john@test.com','Addr1');
INSERT INTO bookings VALUES ('B1','2021-11-10','101','U1');
INSERT INTO items VALUES ('I1','Tea',20);
INSERT INTO booking_commercials VALUES ('BC1','B1','Bill1','2021-11-10','I1',2);


