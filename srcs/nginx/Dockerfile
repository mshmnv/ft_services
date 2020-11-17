FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openrc
RUN apk add openssh
RUN apk add openssl

RUN adduser -D -g 'user' user
RUN echo "user:password" | chpasswd

RUN chown -R user:user /var/lib/nginx
RUN mkdir -p /run/nginx

RUN ssh-keygen -A
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=ft_services"


COPY nginx.conf /etc/nginx/nginx.conf
COPY start_nginx.sh .
RUN chmod +x start_nginx.sh

EXPOSE 80 443

CMD sh start_nginx.sh
