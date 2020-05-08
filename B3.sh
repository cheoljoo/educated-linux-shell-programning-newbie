#!/bin/bash

# problem - 대문자를 소문자로 변경
# 한 개의 문자열을 입력 받아 그 문자열의 대문자를 소문자로 변경하여 화면으로 출력하는 스크립트를 작성하라.
# 예를 들어 "FileNo"을 입력 받은 경우 fileno 가 출력된다.

# word는 사용자로 부터 입력 받은 문자열이 들어 있는 변수이다.
read word
echo ${word} | awk '{print tolower($0) }'
