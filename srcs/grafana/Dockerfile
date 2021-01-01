FROM alpine:latest

RUN apk update
RUN apk add wget
RUN apk add libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.1.3.linux-amd64.tar.gz
RUN tar -xf grafana-7.1.3.linux-amd64.tar.gz
RUN rm -rf grafana-7.1.3.linux-amd64.tar.gz

ENV PATH=/grafana-7.1.3/bin:$PATH
WORKDIR /grafana-7.1.3

COPY datasource.yaml conf/provisioning/datasources/
COPY dashboards.yaml conf/provisioning/dashboards/

COPY /dashboards/* /var/lib/grafana/dashboards/

EXPOSE 3000

ENTRYPOINT [ "grafana-server"]
