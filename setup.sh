#!/bin/bash

# создание kubernetes cluster
minikube start  
# --driver=virtualbox --disk-size=5000MB
eval $(minikube docker-env)

minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard

kubectl apply -f srcs/metallb-config.yaml

docker build -t nginx srcs/nginx
docker build -t wordpress srcs/wordpress
docker build -t mysql srcs/mysql
docker build -t phpmyadmin srcs/phpmyadmin
# docker build -t ftps srcs/ftps
# docker build -t grafana srcs/grafana     
# docker build -t influxdb srcs/influxdb   # time series db - база для хранения временных рядов (for grafana)
# docker build -t telegraf srcs/telegraf  # agent for collecting data (for influxdb)

kubectl apply -f srcs/nginx/nginx-deployment.yaml
kubectl apply -f srcs/wordpress/wordpress-deployment.yaml
kubectl apply -f srcs/mysql/mysql-deployment.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin-deployment.yaml
# kubectl apply -f srcs/ftps/ftps-deployment.yaml
# kubectl apply -f srcs/influxdb/influxdb-deployment.yaml
# kubectl apply -f srcs/grafana/grafana-deployment.yaml

minikube dashboard