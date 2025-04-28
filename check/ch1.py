import base

# Create tuples of (comment, pattern) instead of just patterns
EXPECTED_u = [
    ("u_1_0", "Hello, Arceos!"),
    ("u_2_0", "Alloc Vec"),
    ("u_3_0", "Got pflash magic: pfld"),
    ("u_4_0", "Multi-task OK!"),
    ("u_5_0", "worker2 ok!"),
    ("u_6_0", "Multi-task\(Preemptible\) ok!"),
]

NOT_EXPECTED_u = [
]

if __name__ == "__main__":
    base.test(EXPECTED_u, NOT_EXPECTED_u)