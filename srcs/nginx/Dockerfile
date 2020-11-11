FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openssh
RUN apk add openssl
# RUN apk add supervisor
# openrc - HTTP and reverse proxy server 
RUN apk add openrc


RUN adduser -D "user"
RUN echo "user:password" | chpasswd

COPY nginx.conf /etc/nginx/nginx.conf
COPY start_nginx.sh .

RUN chmod +x start_nginx.sh

# COPY supervisord.conf /etc/supervisord.conf

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=www.example.com"

EXPOSE 80 443

CMD bash start_nginx.sh
