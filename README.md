# educated-linux-shell-programning-newbie

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
- $var=value
- ${val}  $val
- $# : arguments count
- $0,1,2  : command and arguments
- $$ : pid
- $? : return value of old(previous) process(0 : success)
- " " : interpret \ $ ` only
- ' ' : no imterpret
- ` ` : execution
- 


