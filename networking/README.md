For fault injection,
apply destination-rule-all.yaml
apply rating-service-delay.yaml
apply reviews-v2-timeout.yaml

For mTLS,
deploy rating service without sidecar
deploy all other services with sidecar
apply destination-rule-mtls-all.yaml
try running the service. All the response will be from reviews V1. Because reviews v2 and v3 are failing to call ratings service which is not configured with mTLS.
Now inject sidecar to stand-alone service.
Run the service again to see success

For Authorization and Access Policy,
apply deny-all-global.yaml
run the service and see the failure

For all access:
apply allow-grpc-traffic-global.yaml
run the service and see the success

For fine grain access:
apply allow-grpc-traffic-productpage.yaml
run the service to see failure because productpage cant access details or reviews
apply allow-grpc-traffic-details.yaml
run the service to see failure because productpage cant access reviews
apply allow-grpc-traffic-reviews.yaml
run the service to see all response from reviews v1. Because reviews v2 and v3 can't access ratings
apply allow-grpc-traffic-ratings.yaml
run the service to see success