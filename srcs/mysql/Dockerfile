FROM alpine:latest

RUN apk update
RUN apk add mariadb
RUN apk add mariadb-client
RUN apk add openrc

COPY my.cnf /etc/
COPY create_db .
COPY data_base.sql .
COPY start_mysql.sh .

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD sh start_mysql.sh