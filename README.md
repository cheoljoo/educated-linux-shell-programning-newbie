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
- command 보여주기
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

## 공백, alias, 명령 종류, 명령 제어
- meta (명령 제어)
    - ; 한행에 여러개의 명열을 사용할때
    - & 명령을 백그라운드 수행
    - && 앞 명령이 성공하면 뒤 명령 수행
    - || 앞의 것이 실패일때 뒤 명령 수행
- space 사용법
    - 대입을 제외하고 모든 경우 공백을 사용하면 실수를 줄일수 있다.
    - $변수=값
    - [ 대상1 = 대상2 ]     <-  대상 1,2를 비교한다. eq   [ ] 앞뒤에 공백이 꼭 있어야 한다. 
    - { 명령1; 명령2; }     
    - ( 명령1; 명령2; )
    - keyword인 [ , { , ( 은 뒤에 공백을 넣어야 한다.
- shell에서 alias 사용하기




```
#!/bin/sh

**shopt -s expand aliases**
alias mydate='date "+%Y-%m-%d %H:%M:%S"'
mydate
unalias mydate
```
    - 그냥 수행하면 된다. 
    - 그러나, .bashrc 와 같이 실핼할때는 source를 이용해야 한다. 
- keyword를 보여줌
    - $ compgen -k | column
- 내장 명령들 보기
    - $ compgen -b | column
```
$  compgen -k | column
     if              else            fi              esac            select
     until           done            function        {               !
     ]]
     then            elif            case            for             while
     do              in              time            }               [[

          $  compgen -b | column
          .               bg              caller          complete        dirs
          eval            false           hash            kill
          mapfile         pwd             return          source          trap
          ulimit          wait
          :               bind            cd              compopt         disown
          exec            fc              help            let             popd
          read            set             suspend         true            umask
          [               break           command         continue        echo
          exit            fg              history         local           printf
          readarray       shift           test            type
          unalias
          alias           builtin         compgen         declare         enable
          export          getopts         jobs            logout          pushd
          readonly        shopt           times           typeset         unset
```

##  확장 및 치환 작업의 세부 절차를 알아보고, Brace Expansion과 Tiled Expansion
- brace expansion : 공백이 없어야 한다.
    - echo X{app,bpp}Y   -> XappY XbppY
        - mv ~/*.{png,gif,jpg} ~/Pictures
    - echo a{,,,}b  ->  null string
        - ab ab ab ab
        - cp test.sh{,.bak}    -> cp test.sh test.sh.bak
        - echo temp/{,X/}rc.d   -> temp/rc.d temp/X/rc.d
    - echo {1..10..2}
        - 1 3 5 7 9
        - echo {a..f..2}
        - a=1;b=5; echo {$a..$b}   -> {1..5}
        - eval echo {$a..$b}    -> 1 2 3 4 5 
        - echo {01..3}   -> 01 02 03
        - echo {A..F}{0..3}
        - echo {{A..Z},{a..z}}  ->  A B C .. Z a b c .. z
- tiled expansion
    - ~ 기호 : 홈 디렉토리
    - echo ~+    -> $PWD
    - echo ~-    -> 이전 directory
- parameter expansion
    - ${#NAME}   : 문자열의 길이
    - ${NAME:-STR}  : NAME이 NULL이면 STR을, 아니면 NAME을 선택
        - echo ${var2:-"string2"}  -> string2  변수를 만들고 초기화하지는 않음.
        - no set value
    - ${NAME:+STR}  : NAME이 NULL이면 NULL을 , 아니면 STR을 선택
        - no set value
    - ${NAME:=STR}  : NAME이 NULL이면 생성후 STR을 대입
    - ${NAME:OFFSET} : OFFSET위치부터 모든 문자를 선택 , 맨 앞이 0번 위치임
        - echo ${var:2:3}    -> 2부터 3개
    - ${NAME/PATTERN/STR} : 처음나오는 PATTERN을 STR로 대체
        - echo ${var/"abc"/"123"}
            - no set value
        - echo ${var//"abc"/"123"}
            - change value
    - ${NAME#PATTERN} : 앞에서부터 PATTERN과 일치하는 가장 짧은 부분 제거
        - var=abcdabcd
        - echo ${var#*c}    ->  앞의 abc가 삭제  -> dabcd
        - echo ${var##*c}    ->  앞에서 가장 먼 c 를 찾아 가 앞 모두 제거   -> d
    - ${NAME%PATTERN} : 뒤에서부터 PATTERN과 일치하는 가장 짧은 부분 제거
        - echo ${var%b*}  -> abcda
        - echo ${var%%b*}  -> a
- command substitution & block : 명령 실행의 결과로 대체하고 서브 쉘을 사용해 여러 명령을 하나로 묶는다.
    - $()    : \`\`과 동일 기능을 함, var=name_$(date +%F)
    - () -> 이것이 sub shell을 의미함.
        - sub shell 사용한 변수는 외부에 영향을 주기 않음
        - 오류 발생해도 동작이 멈추지 않으며 , set -e 를 사용하여 오류 발생시 shell을 종효 할수 있다. 
            - echo `ls /etc | grep conf`   ==>  echo $(ls /etc | grep conf)
```
var1=$1
var2=$2
[ $var1 = "aaa" ] ** \
(
    [ $var2 = "bbb" ] && exit 1
    var2="xxx"
    echo subshell: var1=$var1 var2=$var2
)
echo var1=$var1 var2=$var2
```
        - var1 aaa  var2 ccc
        - subshell: var1=aaa var2=xxx
        - var1=aaa var2=ccc
    - {} -> block 
        - sub shell 사용한 변수는 외부에 영향을 줌
```
var1=$1
var2=$2
[ $var1 = "aaa" ] ** \
{
    [ $var2 = "bbb" ] && exit 1
    var2="xxx"
    echo subshell: var1=$var1 var2=$var2
}
echo var1=$var1 var2=$var2
```
        - var1 aaa  var2 ccc
        - 여기서 exit 1 은 subshell이 아닌 process가 종료됨.
        - subshell: var1=aaa var2=xxx
        - var1=aaa var2=xxx
- 오류가 발생할때 멈춰라.   : set -e
```
set -e
ls -al /abcd
echo "abcd"
set +e
```


## 정규표현식
### grep 
    - grep -rn 'a\{2,3\}u' /etc     -> 2번이상 3번 이하 반복
    - [:alnum:]   -> 알파벳과 숫자
    - [^[:alnum:]]   -> 알파벳과 숫자가 아닌 것
    - [:  :]안에 alnum, alpha , blank , cntrl , digit , graph(보이는문자) , lower , upper , print(보이는 문자와 공백) , punct , space , xdigit
        - grep '[[:alpha:]]port' /etc/services -> support
        - grep '[^[:digit:]]port' /etc/services -> support
- grep -E / egrep , awk : 확장 정규표현식
    - sis|sys  -> or 
    - y?  
    - M+ 
    - m{2,3} -> 2개 이상 3개 이하 
    - grep -E '(s)(i|y)\1' /etc/services ->  첫번째 () 가 \1
    - grep -E '(day)?time' /etc/services
- grep -rn 'a' /etc
    -r 은 /etc안의 모든 file들에 대해서 처리
- grep -n '[cC]onf' !$   2>/dev/null
    - !$ : 마지막 명령의 마지막 인수 
    - !! 은 마지막 명령 전체
- grep  '\<ab' /etc/services    -> 단어가 ab로 시작한 것을 찾아라
- grep  'ab\>' /etc/services    -> 단어가 ab로 끝나는  것을 찾아라
- phone number : grep -E '^01[016-9]-[0-9]{3,4}-[0-9]{4,4}$'

### sed
- 행단위 처리
- -n : 편집된 것맟 처리 
- -e : 다중 편집   -e '..'  -e '...' 
- -r : extend regular expression
- sed '2,4p'  : 2번에서 4번을 출력하라.   -> 2,4번 행을 한번더 출력하고 있다.
- sed -n '2,4p'  : 2,4번만 출력 -n 은 기본이 입력을 출력하지 않음
- sed -n '/root/p'  /etc/passwd    :  root 포함된 행 출력
- sed -n '/^sys/p'  : sys로 시작되는 행 출력
- sed -nr '/bash$/p'
- sed '2,$d'   : 2번행에서 마지막 행까지  삭제
- sed '/nologin/d' !$
- sed -n '/nologin/dp' !$   : d와 p를 같이 사용할수는 없다. 
- sed 's/root/myroot/'
- sed 's/root/myroot/g'
- sed -n 's/^sys/mysys/p' 
- sed -n '/^root/s/bash/sh/p'   -> root로 시작하는 것을 찾아서 bash를 sh로 교체하라 
- sed -n 's/^s[a-p]/my&/p'   -> &은 앞의 내용 그대로 ^s[a-p]
- sed -n 'root/,/dev/p'   -> root에서 시작해서 dev 가 보이는 행에서 끝내라
- sed -n '2,/dev/p' !$   -> 2번행부터 ㅣ작해서 dev가 나오면 멈춰라.
```
$ sedvar='2,4d
s/^sys/s../
s/bash$/..h/'
$ sed "$sedvar" /etc/passwd
```
- sed -f input_file
- help 에서 Options:하는 부분에서 공백행까지만 출력을 해라.
    - help $1 | sed -n '/^ *Options:/,/^ *$/p' | sed '$d'
- ls -l 을 개선해서 file의 종류도 표시하라
    - ls -l $1 | sed -e '/^-/s/$/*/' -e '/^d/s/$/\//' -e '/^l/s/$/@/'
- 핸드폰 검사의 유효성
```
    res=` echo $1 | sed -nr '/^01[016-9]( |-|:)[0-9]{3,4}\1[0-9]{4,4}$/s/( |-|:)/ /gp'`
    echo ${res:-"wrong number"}
```

### awk
- 원본은 손상되지 않으며 텍스트 형태로 되어 있는 입력 데이터를 레코드와 필드 별로 처리해 출력
- awk '/패턴/ { 동작 }'    $필드번호
- ps -ef | awk '/kworker/ { print $8 " is owned by " $1 }'
- awk는 스크립트 언어로 다양한 특수 변수와 연산자  , 제어문 , 함수 등을 가지고 있다.
    -  ![예제](awk01.png)
        - $5,$9 이면 , 은 output field separator로 공백이다.
    - awk 조작 명령 및 BEGIN , END 패턴
    - awk BEGIN에서 OFS , FS, ORS등의 구분자를 변경, 동작에서 변수를 사용하는 방법
        - FS : field separator   ex) FS=":"
        - OFS : output field separator
        - ORS : output record separator   라인마다의 구분자
        - NR : 처리하는 행의 수  (출력 라인수)
    - 변수 정의 : 초기값은 BEGIN pattern에 넣어주면 된다.
    - 바깥에서 사용한 변수 사용
        - ls -l | awk '/'"$var"'/'
        - 패턴 :   '"$var"'
        - 동작 :   "'"$var"'"
- awk -f awkfile
- df | awk '/\'"$1"'$/ { print "filesystem:" $1 "\nblocks:" $2 "\nuse:" $5 }'
- 펄더 안에 shell  패턴을 포함하는 모든 file들을 찾아라.
```
grep -Ern '^#! ?/bin/(bash|sh)$' $1 2>/etc/null | awk 'BEGIN {FS=":" } { print $1":"$2} ' | awk 'BEGIN {FS=":"} /:1$/{ print $1}' > $2
```

## 조건문
- test
    - test 표현식
    - [ 표현식 ]
        - [ STR ]  or [ -n STR ]   : 문자열 STR이 NULL이 아니면 참
        - [ -z STR ] : STR이 NULL이 아니면 참
        - [ ! EXP ]  : EXP의 결과를 반전
        - [ STR1 -a STR2 ] : STR1 , STR2 모두 NULL이 아니면 참
        - [ STR1 -o STR2 ] : STR1 , STR2 하나라도 NULL이 아니면 참
        - [ STR1 = STR2 ] : STR1 와  STR2 가 같으면  참
        - [ STR1 != STR2 ] : STR1 와  STR2 가 다르면  참
    - test 명령 확장  [[  ]]
        - == , != , =~ , && , || 
        - \* : 어떤 문자든 상관없이 0개 ~ 여러개
            - [[ $var == 1[3-9]* ]]; echo $?  -> 13으로 시작하면됨
        - && 와 ||을 결합한 예제 : 한 줄에 참인 경우 거짓인 경우 실행
            - [ -d $dir ] && echo "$dir exists" || echo "$dir does not exist"
    - [ $var -a "xxx" ]; echo $?
    - 정수 비교
        - [ INT1 -eq INT2 ]
        - -eq , -ne , -ge , -gt , -le , -lt
    - 변수는 "" 으로 묶어서 표현해야 실수가 없다.
        - [ -n $xxx ]; echo $?   -> $xxx이 null이면 참이 나온다. 
        - [ -n "$xxx"]; echo $?    : 정상 작동
- let : 수식 연산을 수행하며 최종 연산 결과가 0이면 1을 아니면 0을 반환한다.
    - let var=var+5   : 수식에 공백이 없으며 , $ 기호 불필요
    - let "var = var +5"   : 수식에 공백이 있는 경우 ""으로 감싸야 한다.
    - (( )) 연산은 let 명령과 동일하다.
    - 연산자
        - ++ , -- , 산술연산 , % , ** , 비교기호 , 비트 , 논리 , expr?exp1:exp2 , 대입
- if
    - if ..  ; then commands; else commands2; fi
        - if cp $1 $2 >/dev/null 2>&1; then ... ; fi
        - ps -C bash | sed '1d' | awk '{print $1}' 
- random : 난수 만들기
    - RANDOM 이라는 환경변수는 읽을때마다 0 ~ 32767 사이의 값을 반환
- case
    - case NAME in CASE1) command1;; CASE2) command2;;  ..;; *) ... ;;  esac
```
case $1 in
[6-9][0-9] | 10)                    | 및 glob 문자 사용가능
    GRADE="P"
    ;;
[0-9] | [1-5][0-9])
    GRADE="F"
    ;;
esac
```
- read
    - read ID
    - read -t 3 ID     : 3초만 기다림. 3초후에 ID에는 값이 대입되지 않음
- here
    - here 다큐먼트는 어떤 프로그램에 자동으로 사용자 입력을 주고자 할때 사용한다.
    - ![](here01.png)
    - ![](here02.png)
- echo -n "AAA"    -> return이 없음.

## 반복문과 함수
- for
    - for NAME in LIST; do commands; done
    - ![](for01.png)
    - example
        - ![](for02.png)
- while
    - while control; do commands; done
    - ![](while01.png)
    - example
        - ![](while02.png)
        - ![](while03.png)
        - ![](while04.png)
- until  : 조건이 거짓인 동안 반복
    - until control; do commands; done
    - ![](until01.png)
- select
    - select NAME in LIST; do commands; done
    - ![](select01.png)
    - PS3="message:"     -> 입력 받기 전에 출력  (기본 : #?)
    - example
        - ![](select02.png)
- break , continue
    - break , continue는 for , while , until , select와 같은 반복문에서 사용
    - ![](break01.png)
- shift : 위치 패러미터들을 앞으로 1칸 이동시킨다.
    - ![](shift01.png)
- 암호 만들기 : 배열 생성하여 사용
    - ![](passwd01.png)
    - ![](passwd02.png)
- 함수 (function)
    - ![](function01.png)
    - ![](function02.png)
    - $# 인자의 개수
    - $0 는 쉘스크립트의 이름 (함수 이름이 아님)