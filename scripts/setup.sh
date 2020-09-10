#!/bin/sh

set -e
minikube start --memory=4096 --cpus=3 --kubernetes-version=v1.17.4 --vm-driver=virtualbox -p istio-poc
eval $(minikube docker-env -p istio-poc)

istioctl install --set profile=demo
kubectl label namespace default istio-injection=enabled

kubectl apply -f ../product/product.yaml
kubectl get services
kubectl get pods

kubectl apply -f ../networking/product-gateway.yaml
istioctl analyze