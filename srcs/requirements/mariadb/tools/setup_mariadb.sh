#!/bin/sh

service mysql start;

# https://blogger.pe.kr/369
# cat의 표준출력을 표준 에러로 null 파일로 출력
# cat을 이용해 파일이 있는지 체크
cat /var/lib/mysql/.setup 2> /dev/null

# 쉘 스크립트 if문
# $? : 직접에 실행한 커맨드의 종료 값(0: 성공, 1: 실패)
# -ne : not equl 값이 다르면
# -eq : equl 값이 같으면
# mysql -e statement (--execute=statement) : 쉘스크립트나 CLI에서 mysql 명령어를 '실행'할 때 사용하는 명령어
# 명령문을 실행하고 종료, https://dev.mysql.com/doc/refman/8.0/en/mysql-command-options.html#option_mysql_execute

# mysql 명령어
# CREATE DATABASE : 데이터베이스 만들기
# ex) create database test;
# CREATE USER : 사용자 추가하기
# ex) create user 'tester'@'%' identified by 'tester1234';
# GRANT ALL PRIVILEGES ON : 사용자 권한 부여하기
# grant all privileges on test.* to 'tester'@'%'; flush privileges;
# mysql -u root -p : 루트 계정으로 데이터베이스 접속하기
if [ $? -ne 0 ]; then
	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE";
	mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'";
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%'";
	mysql -e "FLUSH PRIVILEGES";
	mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";

	mysql $MYSQL_DATABASE -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD
	mysqladmin -u$MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD shutdown

	touch /var/lib/mysql/.setup
fi

# mysqld는 백그라운드에서 돌아가고 있는 프로세스, MYSQL 서버이고
# mysql은 우분투의 터미널처럼 sql문을 실행시켜주는 command-line client입니다.
# exec 실행 시 자식 프로세스를 생성하여 실행하는것이 아닌 현재 프로세스를 대체하는 방식
# mysqld = MySQL + Daemon
exec mysqld
