#!/bin/bash

#problem - 시간 형식 유효성 검사
# 문자열을 입력 받아 문자열의 형식이 시간인 경우 YES 아닌 경우 NO를 출력하라.
# 시간 형식은 HH:MM:SS 형식으로 시간, 분, 초가 각 2글자로 이루어져 있으며, 시간은 00-23, 분과 초는 00-59의 값을 갖는다.
# 예를 들어 01:34:55 는 시간 형식이 맞으며 25:14:45 또는 AM 03:18:33 은 시간 형식이 아니다.
# sed의 -r 옵션을 사용하면 확장 정규표현식을 사용할 수 있으며, grep -E 또는 egrep, awk 등은 채점 시스템에서 확장 정규표현식에 대해 동작 하지 않는다.

read N
for x in `eval echo {1..$N}`
do
    read PH
    echo "$PH" | 
    {
        var=`sed  -rn '/^((0|1)[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$/s/.*/YES/p'`
        echo ${var:-"NO"}
    }
done  
