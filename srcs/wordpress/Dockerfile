FROM alpine:latest

RUN apk update
RUN apk add openssl
RUN apk add openssh
RUN apk add openrc
RUN apk add nginx
RUN apk add wget
RUN apk add supervisor
RUN apk add php7 php-fpm php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN mkdir /www
RUN adduser -D -g 'www' www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xvf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /www/

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisor.conf /etc/supervisord.conf
COPY wp-config.php /www/wordpress/
COPY start_wordpress.sh .

EXPOSE 5050

CMD sh start_wordpress.sh