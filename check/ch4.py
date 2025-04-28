import base

# Create tuples of (comment, pattern) instead of just patterns
EXPECTED_u = [
    ("h_1_0", "Shutdown vm normally!"),
]

NOT_EXPECTED_u = [
]

if __name__ == "__main__":
    base.test(EXPECTED_u, NOT_EXPECTED_u)