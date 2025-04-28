import sys
import re

def test(expected, not_expected=[]):
    print(expected, not_expected)
    
    output = sys.stdin.read(1000000)

    count = 0
    total = len(expected) + len(not_expected)

    for item in expected:
        # Check if the item is a tuple (comment, pattern)
        if isinstance(item, tuple) and len(item) == 2:
            comment, pattern = item
            if re.search(pattern, output):
                count += 1
                print(f'\033[92m[PASS]\033[0m found <{pattern}> # {comment}')
            else:
                print(f'\033[91m[FAIL]\033[0m not found <{pattern}> # {comment}')
        else:
            # Handle the case where it's just a pattern
            pattern = item
            if re.search(pattern, output):
                count += 1
                print(f'\033[92m[PASS]\033[0m found <{pattern}>')
            else:
                print(f'\033[91m[FAIL]\033[0m not found <{pattern}>')

    for item in not_expected:
        # Check if the item is a tuple (comment, pattern)
        if isinstance(item, tuple) and len(item) == 2:
            comment, pattern = item
            if not re.search(pattern, output):
                count += 1
                print(f'\033[92m[PASS]\033[0m not found <{pattern}> # {comment}')
            else:
                print(f'\033[91m[FAIL]\033[0m found <{pattern}> # {comment}')
        else:
            # Handle the case where it's just a pattern
            pattern = item
            if not re.search(pattern, output):
                count += 1
                print(f'\033[92m[PASS]\033[0m not found <{pattern}>')
            else:
                print(f'\033[91m[FAIL]\033[0m found <{pattern}>')

    print('\nTest passed: %d/%d' % (count, total))
    assert count == total