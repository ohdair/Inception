FROM debian:buster

LABEL writer="jaewpark@student.42seoul.kr"

RUN apt update && apt install -y mariadb-server mariadb-client

COPY ./tools/setup_mariadb.sh /tmp/setup_mariadb.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

CMD ["sh", "./tmp/setup_mariadb.sh"]