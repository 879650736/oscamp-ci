#!/bin/bash

rm -f ./output.log
make testu CHAPTER=u1 | grep -E "PASS|FAIL">> output.log
make testu CHAPTER=u2 | grep -E "PASS|FAIL">> output.log
make testm1 CHAPTER=m1 | grep -E "PASS|FAIL">> output.log
make testm2 CHAPTER=m2 | grep -E "PASS|FAIL">> output.log
make testh1 CHAPTER=h1 | grep -E "PASS|FAIL">> output.log
make testh2 CHAPTER=h2 | grep -E "PASS|FAIL">> output.log
make testh3 CHAPTER=h3 | grep -E "PASS|FAIL">> output.log
cat output.log
echo "All tests completed. Check output.log for results."
