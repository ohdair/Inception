#!bin/bash

rm -rf latest.tar.gz
mkdir /var/www/
mv -f /wordpress/ /var/www/
cp -rf ./tmp/wp-config.php /var/www/wordpress/
chown -R www-data:www-data /var/www/wordpress/

# Unable to create the PID file (/run/php/php7.3-fpm.pid) 계속 이런 에러 떠서 추가함
mkdir -p /run/php/

# php-fpm을 foreground에서 실행시키겠다. foreground에서 실행안하면 container가 계속 exited 으로 바뀜
exec php-fpm7.3 -F