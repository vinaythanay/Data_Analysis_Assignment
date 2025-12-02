
-- Hotel Queries

-- Q1
SELECT b.user_id, b.room_no, b.booking_date
FROM bookings b
JOIN (
    SELECT user_id, MAX(booking_date) AS max_date
    FROM bookings
    GROUP BY user_id
) lastb ON lastb.user_id = b.user_id AND lastb.max_date = b.booking_date;

-- Q2
SELECT bc.booking_id,
       SUM(bc.item_quantity * i.item_rate) AS total_amount
FROM booking_commercials bc
JOIN bookings b ON bc.booking_id = b.booking_id
JOIN items i ON bc.item_id = i.item_id
WHERE b.booking_date >= '2021-11-01' AND b.booking_date < '2021-12-01'
GROUP BY bc.booking_id;

-- Q3
SELECT bc.bill_id,
       SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE bc.bill_date >= '2021-10-01' AND bc.bill_date < '2021-11-01'
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;

-- Q4
WITH monthly_item_qty AS (
  SELECT date_trunc('month', bc.bill_date) AS month_start,
         bc.item_id,
         SUM(bc.item_quantity) AS total_qty
  FROM booking_commercials bc
  WHERE bc.bill_date >= '2021-01-01' AND bc.bill_date < '2022-01-01'
  GROUP BY 1,2
),
ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY month_start ORDER BY total_qty DESC) AS rn_desc,
         ROW_NUMBER() OVER (PARTITION BY month_start ORDER BY total_qty ASC) AS rn_asc
  FROM monthly_item_qty
)
SELECT *
FROM ranked
WHERE rn_desc = 1 OR rn_asc = 1;

-- Q5
WITH bill_amounts AS (
  SELECT bc.bill_id,
         b.user_id,
         date_trunc('month', bc.bill_date) AS month_start,
         SUM(bc.item_quantity * i.item_rate) AS bill_amount
  FROM booking_commercials bc
  JOIN bookings b ON bc.booking_id = b.booking_id
  JOIN items i ON bc.item_id = i.item_id
  WHERE bc.bill_date >= '2021-01-01' AND bc.bill_date < '2022-01-01'
  GROUP BY bc.bill_id, b.user_id, month_start
),
ranked AS (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY month_start ORDER BY bill_amount DESC) AS rn
  FROM bill_amounts
)
SELECT *
FROM ranked
WHERE rn = 2;
