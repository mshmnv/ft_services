FROM alpine:latest

RUN apk update
RUN apk add influxdb

COPY start_influxdb.sh .

EXPOSE 8086
CMD sh start_influxdb.sh