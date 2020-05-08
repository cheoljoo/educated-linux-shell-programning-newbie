#!/bin/bash

# problem - 메타 문자를 포함한 문자열 출력
# name, course 변수에 각각 "linux", "expert" 가 저장되어 있다.
# var 변수에 name과 course의 내용 및 \(escape character)를 사용하여 지정된 문자열을 저장하고, echo를 사용하여 출력하도록 한다.

name="linux"
course="expert"

# "linux expert"
echo "${name} ${course}"


# "$linux \expert"
echo "\$${name} \\${course}"


# "experted linux"  
echo "${course}ed ${name}"
