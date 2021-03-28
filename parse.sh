#!/bin/bash
[ ! -d "./Testcase" ] && mkdir Testcase
nc -l 8888 | grep tests | python3 build.py