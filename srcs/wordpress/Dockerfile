FROM alpine:latest

RUN apk update
RUN apk add openssl
RUN apk add openssh
RUN apk add openrc
RUN apk add nginx
RUN apk add wget
RUN apk add php7 php-fpm php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN adduser -D -g 'user' user
RUN chown -R user:user /var/lib/nginx
RUN mkdir -p /run/nginx
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/localhost.crt \
-keyout /etc/ssl/certs/localhost.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=ft_services"

RUN mkdir /www
RUN mkdir -p /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /www/

COPY wp-config.php /www/wordpress/
COPY start_wordpress.sh .
RUN chmod +x start_wordpress.sh

EXPOSE 5050

CMD sh start_wordpress.sh