#!/bin/bash

# problem -  zero padding
# 한 개의 숫자를 입력 받아 다음과 같이 확장 출력하는 스크립트를 작성하라.
# 예를 들어 입력 받은 숫자가 3인 경우 data001.log, data002.log, data003.log 가 출력된다.
# 숫자는 1 ~ 입력 받는 숫자 범위가 사용하도록 한다.
# brace expansion을 사용하여 해결한다.

# endnum 은 사용자로 부터 입력 받은 숫자가 들어 있는 변수이다.
read endnum

eval echo data{001..$endnum}.log
