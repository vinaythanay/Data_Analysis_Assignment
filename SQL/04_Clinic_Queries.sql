
-- Clinic Queries

-- Q1
SELECT cs.sales_channel,
       SUM(cs.amount) AS revenue
FROM clinic_sales cs
WHERE cs.datetime >= '2021-01-01' AND cs.datetime < '2022-01-01'
GROUP BY cs.sales_channel;

-- Q2
SELECT cs.uid, c.name, SUM(cs.amount) AS total_spent
FROM clinic_sales cs
LEFT JOIN customer c ON c.uid = cs.uid
WHERE cs.datetime >= '2021-01-01' AND cs.datetime < '2022-01-01'
GROUP BY cs.uid, c.name
ORDER BY total_spent DESC
LIMIT 10;

-- Q3
WITH revenue_per_month AS (
  SELECT date_trunc('month', datetime) AS month_start,
         SUM(amount) AS revenue
  FROM clinic_sales
  WHERE datetime >= '2021-01-01' AND datetime < '2022-01-01'
  GROUP BY 1
),
expense_per_month AS (
  SELECT date_trunc('month', datetime) AS month_start,
         SUM(amount) AS expense
  FROM expenses
  WHERE datetime >= '2021-01-01' AND datetime < '2022-01-01'
  GROUP BY 1
)
SELECT COALESCE(r.month_start, e.month_start) AS month_start,
       COALESCE(r.revenue,0) AS revenue,
       COALESCE(e.expense,0) AS expense,
       COALESCE(r.revenue,0) - COALESCE(e.expense,0) AS profit,
       CASE WHEN COALESCE(r.revenue,0) - COALESCE(e.expense,0) > 0 THEN 'profitable'
            ELSE 'not-profitable' END AS status
FROM revenue_per_month r
FULL JOIN expense_per_month e USING (month_start);

-- Q4
WITH sales_month AS (
  SELECT cid, SUM(amount) AS revenue
  FROM clinic_sales
  WHERE date_trunc('month', datetime) = '2021-09-01'
  GROUP BY cid
),
exp_month AS (
  SELECT cid, SUM(amount) AS expense
  FROM expenses
  WHERE date_trunc('month', datetime) = '2021-09-01'
  GROUP BY cid
),
profit_per_clinic AS (
  SELECT cl.cid, cl.clinic_name, cl.city,
         COALESCE(s.revenue,0) AS revenue,
         COALESCE(e.expense,0) AS expense,
         COALESCE(s.revenue,0) - COALESCE(e.expense,0) AS profit
  FROM clinics cl
  LEFT JOIN sales_month s ON cl.cid = s.cid
  LEFT JOIN exp_month e ON cl.cid = e.cid
)
SELECT city, cid, clinic_name, profit
FROM (
  SELECT *, ROW_NUMBER() OVER (PARTITION BY city ORDER BY profit DESC) AS rn
  FROM profit_per_clinic
) t
WHERE rn = 1;

-- Q5
WITH sales_month AS (
  SELECT cid, SUM(amount) AS revenue
  FROM clinic_sales
  WHERE date_trunc('month', datetime) = '2021-09-01'
  GROUP BY cid
),
exp_month AS (
  SELECT cid, SUM(amount) AS expense
  FROM expenses
  WHERE date_trunc('month', datetime) = '2021-09-01'
  GROUP BY cid
),
profit_per_clinic AS (
  SELECT cl.cid, cl.clinic_name, cl.state,
         COALESCE(s.revenue,0) - COALESCE(e.expense,0) AS profit
  FROM clinics cl
  LEFT JOIN sales_month s ON cl.cid = s.cid
  LEFT JOIN exp_month e ON cl.cid = e.cid
)
SELECT state, cid, clinic_name, profit
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY state ORDER BY profit ASC) AS rn
  FROM profit_per_clinic
) t
WHERE rn = 2;
