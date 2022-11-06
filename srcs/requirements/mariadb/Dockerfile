FROM debian:buster

RUN apt update && apt install -y mariadb-server

COPY tools/setup_mariadb.sh /tmp/setup_mariadb.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
# COPY ./conf/wp_dump.sql ./

EXPOSE 3306

CMD ["sh", "./setup_mariadb.sh"]