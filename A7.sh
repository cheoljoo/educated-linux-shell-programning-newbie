#!/bin/bash


#problem - 문자열 추출
# 한 개의 문자열을 입력 받아 그 문자열의 3번 위치부터 5번 위치까지 3글자를 화면으로 출력하는 스크립트를 작성하라.
# 위치 번호는 0번부터 시작한다.
# 예를 들어 "international"를 입력 받은 경우 ern 이 출력된다.
# parameter expansion을 사용하여 해결한다.

# word는 사용자로 부터 입력 받은 문자열이 들어 있는 변수이다.
read word

echo ${word:3:3}
