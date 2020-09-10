#!/bin/sh

set -e

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
echo "$INGRESS_PORT"

export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
echo "$SECURE_INGRESS_PORT"

# change to the current minikube profile
export INGRESS_HOST=$(minikube ip -p istio-poc)
echo "$INGRESS_HOST"

export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo "$GATEWAY_URL"
# mention the output host:port in the client file

