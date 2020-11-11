#!/bin/bash

 # for school mac
#  export MINIKUBE_HOME=/Users/lbagg/goinfre/.minikube
#  export PATH=$MINIKUBE_HOME/bin:$PATH
#  export KUBECONFIG=$MINIKUBE_HOME/.kube/config
#  export KUBE_EDITOR="code -w"

# создание kubernetes cluster
minikube start  --vm-driver=virtualbox --disk-size="5000mb"
eval $(minikube docker-env)

minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard # The Dashboard is a web-based Kubernetes user interface

kubectl apply -f srcs/metallb-config.yaml

docker build -t nginx srcs/nginx
# docker build -t phpmyadmin srcs/phpmyadmin
# docker build -t wordpress srcs/wordpress
# docker build -t mariadb srcs/mysql
# docker build -t grafana srcs/grafana     
# docker build -t influxdb srcs/influxdb   # time series db - база для хранения временных рядов
# docker build -t ftps srcs/ftps
# docker build -t telegraf srcs/telegraf/  # agent for collecting data


kubectl apply -f srcs/nginx/nginx-deployment.yaml
# kubectl apply -f srcs/phpmyadmin-deployment.yaml
# kubectl apply -f srcs/wordpress-deployment.yaml
# kubectl apply -f srcs/mysql-deployment.yaml
# kubectl apply -f srcs/influxdb-deployment.yaml
# kubectl apply -f srcs/ftps-deployment.yaml
# kubectl apply -f srcs/grafana-deployment.yaml

minikube dashboard
