FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openrc
RUN apk add openssh
RUN apk add openssl
RUN apk add supervisor

RUN adduser -D -g 'www' www
RUN echo "www:password" | chpasswd

RUN mkdir /www
RUN mkdir -p /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=ft_services"

COPY nginx.conf /etc/nginx/
COPY start_nginx.sh .
RUN chmod +x start_nginx.sh
COPY index.html /www/
COPY supervisor.conf /etc/supervisord.conf

EXPOSE 80 443

CMD sh start_nginx.sh
