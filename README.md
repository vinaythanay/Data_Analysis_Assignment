# 📊 Data_Analyst_Assignment — PlatinumRx

Repository content prepared for the assignment.

---

## 📁 Repository Structure

```
Data_Analyst_Assignment/
├── SQL/
│   ├── 01_Hotel_Schema_Setup.sql
│   ├── 02_Hotel_Queries.sql
│   ├── 03_Clinic_Schema_Setup.sql
│   └── 04_Clinic_Queries.sql
│
├── Python/
│   ├── 01_Time_Converter.py│  
│   └── 02_Remove_Duplicates.py
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
└── README.md
```

---

## 🧠 SQL Scripts

### **01_Hotel_Schema_Setup.sql**

Creates the hotel database schema:

- users
- bookings
- booking_commercials
- items

Includes sample insert statements.
Primary keys & foreign keys are correctly defined.

---

### **02_Hotel_Queries.sql**

Contains analytical SQL queries such as:

- Fetching the latest booking per user
- Total bill amount per booking (JOINs + SUM)
- Bills above a threshold
- Monthly aggregated commercial data (CTE + window functions)

---

### **03_Clinic_Schema_Setup.sql**

Sets up the clinic-related schema:

- customer
- clinic_sales
- expenses
- clinic_master

---

### **04_Clinic_Queries.sql**

Includes:

- Revenue by sales channel
- Top spenders
- Monthly revenue–expense–profit calculation
- City‑wise profit distribution

---

## 🐍 Python Scripts

### **01_Time_Converter.py**

Function:

```
minutes_to_hours_minutes(total_minutes: int) -> str
```

Converts minutes → `"X hrs Y minutes"`.
Handles validation & edge cases.
Includes demonstration in `__main__`.

---

### **02_Remove_Duplicates.py**

Function:

```
remove_duplicate_chars(s: str) -> str
```

Removes duplicate characters while preserving first‑occurrence order.
Example: `"mississippi"` → `"misp"`

---

## 📗 Excel Workbook — Ticket_Analysis.xlsx

### **Sheet 1 — ticket**

Columns include:

- ticket_id
- created_at
- closed_at
- outlet_id
- cms_id

Helper columns:

| Column       | Formula                | Purpose           |
| ------------ | ---------------------- | ----------------- |
| created_date | `=INT(B2)`           | Extract date part |
| closed_date  | `=INT(C2)`           | Extract date part |
| same_day?    | `=F2=G2`             | TRUE if same day  |
| same_hour?   | `=HOUR(B2)=HOUR(C2)` | TRUE if same hour |

---

### **Sheet 2 — feedbacks**

Columns:

- cms_id
- feedback_at
- feedback_rating
- ticket_created_at

Formula:

```
=INDEX(ticket!$B$2:$B$11, MATCH(A2, ticket!$E$2:$E$11, FALSE))
```

✔ Dynamically updates
✔ No hardcoding
✔ Works even without a mouse (Ctrl+Shift+↓ → Ctrl+D)

---

## ▶ How to Run / Use

### **SQL**

Run scripts with PostgreSQL:

```
psql -U postgres -d yourdb -f SQL/01_Hotel_Schema_Setup.sql
```

Or in VS Code (PostgreSQL extension):

- Open file
- Connect to server
- Press **Ctrl + Enter** to execute

---

### **Python**

Run scripts:

```
python Python/01_Time_Converter.py
python Python/02_Remove_Duplicates.py
```

---

### **Excel**

Open:

```
Spreadsheets/Ticket_Analysis.xlsx
```

- Ensure **Automatic Calculation** is ON
- Add rows → All formulas update instantly

---

## ✅ Assignment Completed

This repository fully satisfies:

✔ SQL schema creation
✔ SQL analytical queries
✔ Python utilities & transformations
✔ Excel spreadsheet analysis
