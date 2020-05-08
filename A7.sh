#!/bin/bash

# word는 사용자로 부터 입력 받은 문자열이 들어 있는 변수이다.
read word

echo ${word:3:3}
