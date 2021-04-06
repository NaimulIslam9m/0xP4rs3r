#!/bin/bash

tc=1

BCyan='\033[1;36m'
BRed='\033[1;31m'
BGreen='\033[1;32m'
NC='\033[0m' # No Color

OK="${BCyan}*${NC}"
ERROR="${BRed}!${NC}"

file_name=$1
name=`echo $file_name | cut -d '.' -f 1`
ext=`echo $file_name | cut -d '.' -f 2`

for x in `ls Testcase/$name*.in`; do
    if [[ $ext == py ]]; then
        cat $x | python3 $name.py > Testcase/$name$tc.res
    elif [[ $ext == cpp ]]; then
        g++ -std=c++17 $file_name
        cat $x | ./a.out > Testcase/$name$tc.res
    elif [[ $ext == c ]]; then
        gcc $file_name
        cat $x | ./a.out > Testcase/$name$tc.res
    elif [[ $ext == java ]]; then
        javac $file_name
        cat $x | $name.class > Testcase/$name$tc.res
    fi

    diff -y --suppress-common-lines Testcase/$name$tc.res Testcase/$name$tc.out > Testcase/diff.txt

    if [[ `echo $?` == 1 ]]; then
        echo -e "[$ERROR]${BRed} WA On Test $tc ${NC}"
        cat Testcase/diff.txt
    else
        echo -e "[$OK]${BGreen} PASSED ${NC}"
    fi

    ((tc+=1))
done