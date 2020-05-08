#!/bin/bash

#problem - 단어의 길이
# 한 개의 문자열를 입력 받아 그 문자열의 길이를 화면으로 출력하는 스크립트를 작성하라.
# 예를 들어 "weather"를 입력 받은 경우 7 이 출력된다.
# parameter expansion을 사용하여 해결한다.


# word는 사용자로 부터 입력 받은 문자열이 들어 있는 변수이다.
read word

echo ${#word}
