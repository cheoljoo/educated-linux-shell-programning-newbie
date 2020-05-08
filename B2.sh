#!/bin/bash

# problem - 문자열 조작
# 공백을 포함한 한 개의 문자열을 입력 받아 그 문자열의 화면으로 출력하는 스크립트를 작성하라.
# 예를 들어 "drwxr-x--- 2 user user 4096 Apr 23 09:44 practice" 을 입력 받은 경우 "practice - owner: user group: user size: 4096" 과 같이 출력한다.
# 입력되는 문자열은 ls -l 을 실행해서 받은 결과와 같은 구조이다.
# awk를 사용한다.

# word는 사용자로 부터 입력 받은 문자열이 들어 있는 변수이다.
read word
echo ${word} | awk '{print $9 " - owner: " $3 " group: " $4 " size: " $5 }'

