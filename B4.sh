#!/bin/bash

#problem - 필드 분할
# 입력 받는 문자열에서 첫 번째 필드만 한 행에 하나씩 출력한다.
#필드의 구분은 ":"으로 이루어지며 한 행은 3개의 필드로 구성된다.

read N
for x in `eval echo {1..$N}`
do
    read FN
    echo ${FN} | awk 'BEGIN {FS=":"} {print $1}'
done
