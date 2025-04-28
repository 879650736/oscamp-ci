import base

EXPECTED_2b = [
    # u_1_0
    "Hello, Arceos!",

]

NOT_EXPECTED_2b = [
    "FAIL: T.T",
]

if __name__ == "__main__":
    base.test(EXPECTED_2b, NOT_EXPECTED_2b)
