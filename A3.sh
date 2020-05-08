#!/bin/bash

# problem - 파일 이름 목록 작성
# 단어를 하나 입력 받아 다음과 같이 확장하여 화면에 출력하는 스크립트를 작성하라.
# 예를 들어 입력 받은 내용이 temp이면 temp_1.png, temp_3.png, ... temp_99.png 가 출력된다.
# 즉, 이름_1.png 이름_3.png 이름_5.png ... 이름_99.png로 출력되어야 한다.
# 숫자는 1 ~ 100 사이의 홀수만 사용하도록 한다.
# brace expansion을 사용하여 해결한다.


# line 에는 사용자로 부터 입력 받은 내용이 들어 있는 변수이다.
read line

echo ${line}_{1..100..2}.png
