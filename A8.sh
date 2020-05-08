#!/bin/bash

#problem - 디렉터리, 이름 분리
# 입력 받은 파일명에서 디렉터리명과 이름을 분리하여 출력한다.
# 예를 들어 /etc/issue 인 경우 디렉터리는 /etc 이름은 issue 이다.
# 그리고 /home/user/files/a.txt 인 경우 디렉터리는 /home/user/files 이름은 a.txt 이다.

read line

echo "dir=${line%\/*} file=${line##*\/}"
