# FROM debian:buster

# RUN apt update && apt install -y php7.3 php-mysql php-fpm mariadb-client curl wget sudo

# COPY ./conf/setup.sh /tmp/setup.sh
# COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

# WORKDIR /var/www/html/wordpress

# RUN mkdir -p /run/php

# EXPOSE 9000

# CMD ["bash", "/tmp/setup.sh"]

FROM debian:buster

COPY ./tools/setup.sh /tmp/
COPY ./conf/wp-config.php /tmp/

RUN  apt update && apt install -y php7.3-fpm php-mysql tar wget curl 

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN  wget https://wordpress.org/latest.tar.gz
RUN  tar xzvf latest.tar.gz

EXPOSE 9000

CMD  ["sh", "/tmp/setup.sh"]