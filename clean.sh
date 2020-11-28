#!/bin/bash

kubectl delete --all deployments
kubectl delete --all pvc
kubectl delete --all pv
kubectl delete --all pods
kubectl delete --all services

minikube delete