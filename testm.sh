#!/bin/bash

ARCH="${1:-riscv64}"  # 将第一个命令行参数赋值给变量 ARCH

rm -f ./outputM.log
make testm1 CHAPTER=m1 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputM.log
make testm2 CHAPTER=m2 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputM.log
cat outputM.log
echo "All tests completed. Check outputM.log for results."
