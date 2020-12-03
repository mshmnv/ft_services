FROM alpine:latest

RUN apk update
RUN apk add grafana --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/

COPY datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY /dashboards/* /var/lib/grafana/dashboards/

EXPOSE 3000

ENTRYPOINT [ "grafana-server", "--homepath=/usr/share/grafana" ]