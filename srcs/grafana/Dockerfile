FROM alpine:latest

RUN apk update
RUN apk add grafana

# RUN wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz \
# && tar -zxvf grafana-6.7.2.linux-amd64.tar.gz1

COPY start_grafana.sh .

EXPOSE 3000

CMD sh start_grafana.sh