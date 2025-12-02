# 02_Remove_Duplicates.py
def remove_duplicate_chars(s: str) -> str:
    if not isinstance(s, str):
        raise TypeError('Input must be a string')
    seen = set()
    result_chars = []
    for ch in s:
        if ch not in seen:
            seen.add(ch)
            result_chars.append(ch)
    return ''.join(result_chars)

if __name__ == '__main__':
    examples = ['banana', 'mississippi', '', 'aabbcc', '112233112']
    for ex in examples:
        print(f"{ex} -> {remove_duplicate_chars(ex)}")
