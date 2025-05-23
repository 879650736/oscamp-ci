#!/bin/bash

ARCH="${1:-riscv64}"  # 将第一个命令行参数赋值给变量 ARCH

rm -f ./outputH.log
make testh1 CHAPTER=h1 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputH.log
make testh2 CHAPTER=h2 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputH.log
make testh3 CHAPTER=h3 ARCH="$ARCH" | grep -E "PASS|FAIL" >> outputH.log
cat outputH.log
echo "All tests completed. Check outputH.log for results."
