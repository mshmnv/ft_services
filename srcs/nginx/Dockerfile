FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl
# RUN apk add supervisor
# RUN apk add openrc

RUN adduser -D "user"
RUN echo "user:password" | chpasswd

# COPY nginx.conf /etc/nginx/
# COPY index.html /www/
# COPY start_nginx.sh .
# COPY supervisor.conf /etc/supervisord.conf

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=www.example.com"


CMD start_nginx.sh

EXPOSE 80 443