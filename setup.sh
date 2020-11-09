# создание kubernetes cluster
minikube start # --vm-driver=virtualbox --cpus=2 --disk-size="10000mb" --memory="2000mb"


minikube addons enable metallb
minikube addons enable dashboard

kubectl apply -f srcs/metallb-config.yaml

docker build -t nginx scrs/nginx
docker build -t wordpress scrs/wordpress
docker build -t php scrs/php
docker build -t mariadb scrs/mysql
# docker build -t telegraf srcs/telegraf/  # why
docker build -t grafana scrs/grafana
docker build -t influxdb scrs/influxdb
docker build -t ftps scrs/ftps

# kubectl apply - для каждого в srcs

minikube addons configure metallb  # in terminal: -- Enter Load Balancer Start IP:


