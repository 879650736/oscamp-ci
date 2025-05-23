import base

# Create tuples of (comment, pattern) instead of just patterns
EXPECTED_u = [
    ("m_1_0", "monolithic kernel exit \[Some\(0\)\] normally!"),
    ("m_2_0", "monolithic kernel exit \[Some\(0\)\] normally!"),
]

NOT_EXPECTED_u = [
    ("m_1_0", "No block device found!"),
    ("m_2_0", "No block device found!"),
]

if __name__ == "__main__":
    base.test(EXPECTED_u, NOT_EXPECTED_u)