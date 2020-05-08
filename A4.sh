#!/bin/bash

# endnum 은 사용자로 부터 입력 받은 숫자가 들어 있는 변수이다.
read endnum

eval echo data{1..$endnum}.log
