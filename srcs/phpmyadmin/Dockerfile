FROM alpine:latest

RUN apk update
RUN apk add openssl
RUN apk add openssh
RUN apk add openrc
RUN apk add wget
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN adduser -D -g 'www' www
RUN chown -R www:www /var/lib/nginx
RUN mkdir /www
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

WORKDIR /www
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=ft_services"

RUN mkdir -p /usr/share/webapps/ && cd /usr/share/webapps
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
COPY config.inc.php phpmyadmin/config.inc.php
COPY start_phpmyadmin.sh .
# ?
RUN chmod 644 phpmyadmin/config.inc.php

EXPOSE 5000

CMD sh start_phpmyadmin.sh