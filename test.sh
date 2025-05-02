#!/bin/bash

ARCH="${1:-riscv64}"  # 将第一个命令行参数赋值给变量 ARCH

rm -f ./output.log
make testu CHAPTER=u1 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
make testu CHAPTER=u2 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
make testm1 CHAPTER=m1 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
make testm2 CHAPTER=m2 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
make testh1 CHAPTER=h1 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
make testh2 CHAPTER=h2 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
make testh3 CHAPTER=h3 ARCH="$ARCH" | grep -E "PASS|FAIL" >> output.log
cat output.log
echo "All tests completed. Check output.log for results."
