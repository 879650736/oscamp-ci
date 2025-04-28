import base

# Create tuples of (comment, pattern) instead of just patterns
EXPECTED_u = [
    ("u_7_0", "[mkfs.fat]"),
    ("u_8_0", "worker1 checks code:"),
]

NOT_EXPECTED_u = [
    ("u_7_0", "No block dev!"),
    ("u_8_0", "No block device found!"),
]

if __name__ == "__main__":
    base.test(EXPECTED_u, NOT_EXPECTED_u)