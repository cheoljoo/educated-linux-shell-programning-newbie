#!/bin/bash

#problem - 숫자 범위 맞추기
# 입력 받은 내용이 0~100 사이의 숫자면 "OK" 아니면 "X"를 출력하는 스크립트를 작성하라.
# 예를 들어 입력 받은 내용이 99 이면 OK, 200이면 X를 출력한다.

# num에는 사용자로 부터 입력 받은 내용이 들어 있는 변수이다.
read num

if (test $num -ge 0) then
    if (test $num -le 100) then
        echo "OK"
    else
        echo "X"
    fi
else
    echo "X"
fi
