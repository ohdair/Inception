FROM debian:buster

RUN apt update && apt install -y mariadb-server

COPY tools/setup_mariadb.sh /setup_mariadb.sh
COPY ./conf/my.cnf /etc/mysql/my.cnf
# COPY ./conf/wp_dump.sql ./

EXPOSE 3306

CMD ["sh", "./setup_mariadb.sh"]