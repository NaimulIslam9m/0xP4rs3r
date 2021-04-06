#!/bin/bash

BCyan='\033[1;36m'
BRed='\033[1;31m'
NC='\033[0m' # No Color

OK="${BCyan}*${NC}"
ERROR="${BRed}!{NC}"

[ ! -d "./Testcase" ] && mkdir Testcase

echo -e "[$OK] Listening on port 8888... "

input=`nc -l 8888 | grep tests`

if [[ `echo $input | wc -c` == 0 ]]; then
    echo -e "[$ERROR] Got nothing 😐"
    exit
fi

echo -e "[$OK] Got it!"
echo -e "[$OK] Ready to roll 😎"

echo $input | python3 build.py
