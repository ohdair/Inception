FROM debian:buster

RUN apt update && apt install -y nginx openssl

RUN openssl req -newkey rsa:2048 -days 365 -x509 -nodes \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gam/CN=localhost" \
    -out /etc/ssl/certs/server.crt \
    -keyout /etc/ssl/private/server.key

# COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/default /etc/nginx/sites-available/default

EXPOSE 443

# daemon off는 nginx 서버를 foreground에서 실행할 수 있게 해준다.
# 이 명령어가 없으면 컨테이너를 실행할 때 -d를 붙여도 서버가 중지된다
CMD ["nginx", "-g", "daemon off;"]