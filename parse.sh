#!/bin/bash

BCyan='\033[1;36m'
BRed='\033[1;31m'
NC='\033[0m' # No Color

OK="${BCyan}*${NC}"
ERROR="${BRed}!{NC}"

[ ! -d "./Testcase" ] && mkdir Testcase

echo -e "[$OK] Listening on port 8888... "

nc -l 8888 | grep tests | python3 build.py
