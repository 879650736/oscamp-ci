import base

EXPECTED_2 = [
    # u_1_0
    "Hello, Arceos!",

]

NOT_EXPECTED_2 = [
    "FAIL: T.T",
]

if __name__ == "__main__":
    base.test(EXPECTED_2, NOT_EXPECTED_2)
