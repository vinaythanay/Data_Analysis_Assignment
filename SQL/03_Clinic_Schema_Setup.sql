
-- Clinic Schema Setup

CREATE TABLE clinics (
  cid VARCHAR(50) PRIMARY KEY,
  clinic_name TEXT,
  city TEXT,
  state TEXT,
  country TEXT
);

CREATE TABLE customer (
  uid VARCHAR(50) PRIMARY KEY,
  name TEXT,
  mobile VARCHAR(20)
);

CREATE TABLE clinic_sales (
  oid VARCHAR(50) PRIMARY KEY,
  uid VARCHAR(50) REFERENCES customer(uid),
  cid VARCHAR(50) REFERENCES clinics(cid),
  amount NUMERIC,
  datetime TIMESTAMP,
  sales_channel TEXT
);

CREATE TABLE expenses (
  eid VARCHAR(50) PRIMARY KEY,
  cid VARCHAR(50) REFERENCES clinics(cid),
  description TEXT,
  amount NUMERIC,
  datetime TIMESTAMP
);

-- Sample inserts
INSERT INTO clinics VALUES ('C1','Clinic A','CityX','StateX','India');
INSERT INTO customer VALUES ('U1','John','9999');
INSERT INTO clinic_sales VALUES ('O1','U1','C1',500,'2021-09-10','online');
INSERT INTO expenses VALUES ('E1','C1','Rent',200,'2021-09-05');
