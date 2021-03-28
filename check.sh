#!/bin/bash

tc=1
BRed='\033[1;31m'
BGreen='\033[1;32m'
NC='\033[0m' # No Color

for x in `ls Testcase/$1*.in`; do
    cat $x | python3 $1.py > Testcase/$1$tc.res
    diff -y --suppress-common-lines Testcase/$1$tc.res Testcase/$1$tc.out > Testcase/diff.txt
    if [[ `echo $?` == 1 ]]; then
        echo -e "${BRed} WA On Test $tc ${NC}"
        cat Testcase/diff.txt
    else
        echo -e "${BGreen} PASSED ${NC}"
    fi
    ((tc+=1))
done