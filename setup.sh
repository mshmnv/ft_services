#!/bin/bash

# создание kubernetes cluster
minikube start # --vm-driver=virtualbox --cpus=2 --disk-size="10000mb" --memory="2000mb"

minikube addons enable metallb
minikube addons enable dashboard # The Dashboard is a web-based Kubernetes user interface

kubectl apply -f srcs/metallb-config.yaml

docker build -t nginx scrs/nginx
# docker build -t wordpress scrs/wordpress
# docker build -t php scrs/phpmyadmin
# docker build -t mariadb scrs/mysql
# docker build -t grafana scrs/grafana     
# docker build -t influxdb scrs/influxdb   # time series db - база для хранения временных рядов
# docker build -t ftps scrs/ftps
# docker build -t telegraf srcs/telegraf/  # agent for collecting data


kubectl apply -f srcs/nginx-deployment.yaml
# kubectl apply -f srcs/wordpress-deployment.yaml
# kubectl apply -f srcs/phpmyadmin-deployment.yaml
# kubectl apply -f srcs/mysql-deployment.yaml
# kubectl apply -f srcs/influxdb-deployment.yaml
# kubectl apply -f srcs/ftps-deployment.yaml
# kubectl apply -f srcs/grafana-deployment.yaml




# minikube addons configure metallb  # in terminal: -- Enter Load Balancer Start IP:


