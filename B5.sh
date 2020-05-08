#!/bin/bash

# problem - 시간정보로 파일이름 만들기
# 날짜 및 시간 데이터 형식의 문자열에서 날짜와 시간 데이터를 추출하여 파일의 이름을 생성하라.
#날짜 및 시간 데이터는 'YYYY-MM-DD HH:MM:SS' 의 형식으로 주어진다.
#출력 해야하는 파일의 이름은 '/home/user/myfile_YYMMDDHHMMSS.bak' 형식이다.
#예를 들어 '2019-11-26 08:26:45'의 데이터를 받으면 /home/user/myfile_191126082645.bak 를 출력한다

read line
echo ${line} | sed -nr -e 's/(-| )/:/g' -e 's/^..//p' | awk 'BEGIN {FS=":"} {print "/home/user/myfile_" $1 $2 $3 $4 $5 $6 ".bak"}'
