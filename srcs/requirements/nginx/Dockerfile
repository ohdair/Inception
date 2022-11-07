FROM debian:buster

LABEL writer="jaewpark@student.42seoul.kr"

RUN apt update && apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -days 365 -x509 -nodes \
    -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gam/CN=localhost" \
    -out /etc/nginx/ssl/server.crt \
    -keyout /etc/nginx/ssl/server.key

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

# daemon off는 nginx 서버를 foreground에서 실행할 수 있게 해준다.
# 이 명령어가 없으면 컨테이너를 실행할 때 -d를 붙여도 서버가 중지된다
CMD ["nginx", "-g", "daemon off;"]