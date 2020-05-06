# educated-linux-shell-programning-newbie
- site : http://www.codexpert.org/    문제 풀기 site
- id : LGM20021084
- passwd : 1~6

# 사용자 및 그룹 관리
- sudo, su [-], id, sudo useradd, sudo passwd, sudo userdel, sudo groupadd, sudo groupdel

# ps, top, tar, date, time, sleep 등의 프로세스, 파일압축, 날짜 및 시간 관련 명령
- ps ax  : S(signal) Ri(running)  Z(zombie)
- top -b : 갱신이 덧붙여 표시
- tar
- date , time

#  find를 사용한 파일 검색 및 sort, tee, uniq, tr, wc, cut 등의 텍스트 조작 명령
- find 
    - atime (access)
    - ctime (change) : chmod , chown
    - mtime (modification) : ls -l
    - exec 
- tr -d   : 뒤의 문자를 제거
- tr 문자1 문자2 : 문자1을 문자 2로 변경
- cut -d 구분자 -f필드위치번호

# 파일 시스템 관련 df, sudo mount, sudo umount, mkfs, dd  등의 명령 
- dd if=/dev/cdrom of=cdrom.iso bs=512

# shell
## 쉘의 이해 및 쉘 스크립트 작성 기초
- set -x   , set +x : for debugging

## 변수, 인용부호, 단어 분리, Globbing
- var=value
- ${var}  $var
- $# : arguments count
- $0,1,2  : command and arguments
- $$ : pid
- $? : return value of old(previous) process(0 : success)
- " " : interpret \ $ ` only
- ' ' : no interpret
- \` \` : execution
- escape
    - ```echo hello     world  -> hello world (only 1 space)```
    - ```echo hello\ \ \ \ \ world  -> hello     world (5 space)```
    - echo -e "\x41"  -> hexdecimal : escape application
- quote
    - dir="my folder"
    - mkdir $dir   -> create 2 directory
    - mkdir "$dir"  -> directory name is "my folder"
- globbing : * , ? , [ ] 등의 glob 문자가 해석되는 것을 의미 (해석 원하지 않음)
    - A="date: *"
    - echo $A  -> * 이 directory안의 모든 파일이 나옴
    - echo "$A"  -> date: *
- `\`date +%y%m%d\``

## 환경변수, 지역변수, source 명령
- set : 지역 변수 
- env : 환경변수
    - HOME , PATH , USER , HOSTNAME , PS1 , PWD , RANDOM , UDI , PPID
- export
    - export name=linux  (환경변수)
    - course="expert" (지역변수)
    - name="programming"   (환경변수)
        - 한번 환경변수 만들면 그대로 사용된다. export를 한번만 하면 된다. 
- unset
- source exe.sh  : 같은 shell에서 수행됨

## 변수타입, 읽기전용, 배열 속성
- let
    - var=5; echo $var; let var++; echo $var
- declare OPTION(s) NAME-value  : 변수에 속성 부여
    - -p  : 변수의 속성과 값을 출력
    - -i : 정수형 데이터만 저장할수 있도록 속성 부여
    - -r : read only
    - -a : 배열 속성 부여
    - declare -i ivar="123" -> 123
    - declare -i ivar=abc -> 0
- readonly 
    - readonly rovar="constant"
    - rovar="string" -> readonly로 알려줌
- array
    - avar1=("data0" "1" "data2")
    - echo ${avar1[*]}
    - unset avar1[1]
    - declare -p avar1 -> [0] [2] 만 나옴
- 
