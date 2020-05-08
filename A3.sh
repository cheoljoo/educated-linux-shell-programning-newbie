#!/bin/bash

# line 에는 사용자로 부터 입력 받은 내용이 들어 있는 변수이다.
read line

echo ${line}_{1..100..2}.png
