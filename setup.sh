minikube start

# metalLB
docker build -t nginx scrs/nginx
docker build -t wordpress scrs/wordpress
docker build -t php scrs/php
docker build -t mariadb scrs/mysql
docker build -t telegraf srcs/telegraf/  #why
docker build -t grafana scrs/grafana
docker build -t influxdb scrs/influxdb
docker build -t ftps scrs/ftps




