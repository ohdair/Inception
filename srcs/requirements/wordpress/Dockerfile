FROM debian:buster

RUN apt update && apt install -y mariadb-client php7.3-fpm php-cli php-mysql tar wget curl

COPY ./tools/setup.sh /tmp/setup.sh
COPY ./conf/wp-config.php /tmp/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz
RUN tar xzvf latest.tar.gz

WORKDIR	/var/www/html/wordpress
RUN  mkdir -p /run/php

EXPOSE 9000

CMD  ["sh", "/tmp/setup.sh"]