#!/bin/bash

# problem - 암호 검사
# 보안 상 안전한 암호인지 확인하는 함수를 작성하라.
# 안전한 암호는 다음 사항을 모두 만족해야 한다
# 1. 길이가 최소 8글자 이상이어야 한다
# 2. 숫자(0~9)가 한 개 이상 포함되어야 한다
# 3. 특수문자(~!@#$%^&*)가 한 개 이상 포함되어 있어야 한다
# 4. 대문자(A~Z)가 한 개 이상 포함되어 있어야 한다
# 함수 is_safe는 첫 번째 파라미터로 검사할 암호를 받는다
# 안전한 암호이면 변수 SAFE에 1을, 아니면 0을 대입 후 함수를 종료한다
# 메인 스크립트는 스크립트 실행 시 입력 받은 인자를 함수의 파라미터로 전달하고 함수 종료 후 SAVE 변수를 보고 안전한 암호이면 "YES"를, 아니면 "NO"를 출력한다
# 예를 들어 ^$5678*A은 YES, 123456789# 은 NO 가 출력되는 암호이다.
# 유효성 검사에는 grep 명령을 사용하도록 한다.
# 변수에 grep을 이용한 유효성검사의 결과를 저장하고, 그 변수에 저장된 내용의 길이가 8이상인 경우 SAFE에 1을 저장하고 아닌 경우 0을 저장하는 방식으로 풀이해 주시기 바랍니다.
# 풀이시, $? 및 >/dev/null 2>&1 의 표현을 사용하지 않아야 합니다.  


SAFE=0
is_safe()
{
    # 여기에 코드를 작성한다
    len=${#1}
    if [ $len -lt 8 ]
    then
        SAFE=0
    else
        echo $1 | grep '[0-9]' | grep '[~!@#$%^&*]' | grep '[A-Z]' > /dev/null 2>&1
        [ $? -eq 0 ] && SAFE=1 || SAFE=0
    fi
    #res=`echo "$1" | grep을 이용한 유효성검사식 작성 `
    # res의 결과를 사용하여 길이 검사를 하여 8자 이상이면 SAFE=1 을 수행하도록 한다
}

read line
is_safe "$line"
[ $SAFE -eq 1 ] && echo "YES" || echo "NO"  
