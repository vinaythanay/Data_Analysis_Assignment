# Data_Analyst_Assignment — PlatinumRx

Repository content prepared for the assignment.

## Structure

```
Data_Analyst_Assignment/
├── Python/
│   ├── 01_Time_Converter.py
│   └── 02_Remove_Duplicates.py
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
└── README.md
```

## Python Scripts

### 01_Time_Converter.py
- Function: `minutes_to_hours_minutes(total_minutes: int) -> str`
- Converts integer minutes to a readable format (e.g., `130 -> "2 hrs 10 minutes"`).
- Handles edge cases and raises appropriate errors for invalid inputs.
- Demo usage is included in the `__main__` block.

### 02_Remove_Duplicates.py
- Function: `remove_duplicate_chars(s: str) -> str`
- Removes duplicate characters while preserving first occurrence order.
- Demo usage is included in the `__main__` block.

## Excel Workbook — Ticket_Analysis.xlsx

Contains two sheets:
- `ticket` — sample ticket data with helper columns:
  - `created_date`, `closed_date` (converted date/times)
  - `same_day?` (TRUE if created and closed on same day)
  - `same_hour?` (TRUE if created and closed in same hour)
- `feedbacks` — sample feedbacks and a `ticket_created_at` column populated via VLOOKUP from the `ticket` sheet.

## How to run / use

1. **Python**
   - Run demo:
     ```
     python Data_Analyst_Assignment/Python/01_Time_Converter.py
     python Data_Analyst_Assignment/Python/02_Remove_Duplicates.py
     ```

2. **Excel**
   - Open `Data_Analyst_Assignment/Spreadsheets/Ticket_Analysis.xlsx` in Excel or Google Sheets.
   - Enable automatic calculation to have formulas evaluated.
