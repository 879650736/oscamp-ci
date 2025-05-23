#!/bin/bash

ARCH="${1:-riscv64}"  # 将第一个命令行参数赋值给变量 ARCH

rm -f ./outputU.log
make testu CHAPTER=u1 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputU.log
make testu CHAPTER=u2 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputU.log
cat outputU.log
echo "All tests completed. Check outputU.log for results."
