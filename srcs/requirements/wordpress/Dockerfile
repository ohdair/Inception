FROM debian:buster

LABEL writer="jaewpark@student.42seoul.kr"
# php-fpm : 정적인 페이지를 동적인 CGI를 포함한 것으로 PHP FastCGI Process Manager의 약어입니다
RUN apt update && apt install -y mariadb-client php7.3-fpm php-cli php-mysql tar wget curl sudo vim

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

WORKDIR	/var/www/html/wordpress
RUN  mkdir -p /run/php

EXPOSE 9000

CMD  ["sh", "/tmp/setup.sh"]