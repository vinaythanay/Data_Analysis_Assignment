# 01_Time_Converter.py
# Converts integer minutes into "X hrs Y minutes" format.
def minutes_to_hours_minutes(total_minutes: int) -> str:
    if not isinstance(total_minutes, int):
        raise TypeError("total_minutes must be an integer")
    if total_minutes < 0:
        raise ValueError("total_minutes must be non-negative")
    hours = total_minutes // 60
    minutes = total_minutes % 60
    parts = []
    if hours == 1:
        parts.append(f"{hours} hr")
    elif hours > 1:
        parts.append(f"{hours} hrs")
    if minutes == 1:
        parts.append(f"{minutes} minute")
    elif minutes > 1 or minutes == 0:
        parts.append(f"{minutes} minutes")
    return " ".join(parts)

if __name__ == '__main__':
    examples = [0, 1, 59, 60, 61, 130, 1440]
    for e in examples:
        print(f"{e} -> {minutes_to_hours_minutes(e)}")
