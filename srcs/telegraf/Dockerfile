FROM alpine:latest

RUN apk update
ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_static_linux_amd64.tar.gz ./
RUN tar xf ./telegraf-1.16.1_static_linux_amd64.tar.gz
RUN cp -r ./telegraf-1.16.1/* /

COPY telegraf.conf /etc/telegraf/telegraf.d/
COPY start_telegraf.sh .

EXPOSE 8125

CMD sh start_telegraf.sh