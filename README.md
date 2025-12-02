📊 Data_Analyst_Assignment — PlatinumRx

Repository content prepared for the assignment.

📁 Repository Structure
Data_Analyst_Assignment/
├── SQL/
│   ├── 01_Hotel_Schema_Setup.sql
│   ├── 02_Hotel_Queries.sql
│   ├── 03_Clinic_Schema_Setup.sql
│   └── 04_Clinic_Queries.sql
│
├── Python/
│   ├── 01_Time_Converter.py
│   ├── 02_Remove_Duplicates.py
│   └── 03_Merge_Tickets_Feedbacks.py
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
└── README.md

🧠 SQL Scripts
01_Hotel_Schema_Setup.sql

Creates the hotel database schema:

users

bookings

booking_commercials

items

Includes sample insert statements.

Primary keys & foreign keys properly defined.

02_Hotel_Queries.sql

Contains analytical SQL queries such as:

Fetching the latest booking per user.

Total bill amount per booking (JOINs + SUM).

Bills above a threshold.

Monthly aggregated commercial data (using CTE + window functions).

03_Clinic_Schema_Setup.sql

Sets up the clinic-related schema:

customer

clinic_sales

expenses

clinic_master

04_Clinic_Queries.sql

Includes:

Revenue by sales channel.

Top spenders.

Monthly revenue–expense–profit calculation.

City-wise profit distribution.

🐍 Python Scripts
01_Time_Converter.py

Function:

minutes_to_hours_minutes(total_minutes: int) -> str


Converts time in minutes → "X hrs Y minutes".

Handles validation & edge cases.

Demonstration provided in __main__.

02_Remove_Duplicates.py

Function:

remove_duplicate_chars(s: str) -> str


Removes duplicates while preserving order.

Example:
"mississippi" → "misp"

Includes demo usage.

03_Merge_Tickets_Feedbacks.py

Reads ticket & feedback CSV/Excel files.

Merges on cms_id.

Computes:

ticket_created_at

same_day?

same_hour?

Exports result as final_output.xlsx.

📗 Excel Workbook — Ticket_Analysis.xlsx

This workbook contains dynamic formulas, auto-updating when new rows are inserted.

Sheet 1 — ticket

Columns:

ticket_id

created_at

closed_at

outlet_id

cms_id

Helper Columns Added
Column	Formula	Purpose
created_date	=INT(B2)	Extract date part of created_at
closed_date	=INT(C2)	Extract date part of closed_at
same_day?	=F2=G2	TRUE if same day
same_hour?	=HOUR(B2)=HOUR(C2)	TRUE if same hour
Sheet 2 — feedbacks

Columns:

cms_id

feedback_at

feedback_rating

ticket_created_at

Formula to pull ticket created time:
=INDEX(ticket!$B$2:$B$11, MATCH(A2, ticket!$E$2:$E$11, FALSE))


✔ Dynamically updates
✔ No hardcoding
✔ Works even without a mouse (supports keyboard fill using Ctrl+Shift+↓ + Ctrl+D)

▶ How to Run / Use
SQL

Run any .sql file using:

PostgreSQL CLI:
psql -U postgres -d yourdb -f 01_Hotel_Schema_Setup.sql

Or using VS Code PostgreSQL Extension:

Open the .sql file.

Select the connected server.

Press Ctrl + Enter to execute.

Python

Run any script from terminal:

python Python/01_Time_Converter.py
python Python/02_Remove_Duplicates.py
python Python/03_Merge_Tickets_Feedbacks.py

Excel

Open:

Spreadsheets/Ticket_Analysis.xlsx


Enable Auto Calculation

Update or add rows → all metrics update automatically
