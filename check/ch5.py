import base

# Create tuples of (comment, pattern) instead of just patterns
EXPECTED_u = [
    ("h_2_0", "Got pflash magic: pfld"),
]

NOT_EXPECTED_u = [
]

if __name__ == "__main__":
    base.test(EXPECTED_u, NOT_EXPECTED_u)