FROM alpine:latest

RUN apk update
RUN apk add vsftpd
RUN apk add openssl
RUN apk add openrc

RUN echo -e "password\npassword\n" | adduser -h /user -s /bin/false user
RUN	chown user:user /user


RUN openssl req -newkey rsa:2048 -x509 -days 365 -nodes -out /etc/vsftpd.crt \
-keyout /etc/vsftpd.key -subj "/C=RU/ST=MSK/L=MSK/O=21school/CN=ft_services"

COPY vsftpd.conf /etc/vsftpd/
COPY start_ftps.sh .

EXPOSE 21

CMD sh start_ftps.sh