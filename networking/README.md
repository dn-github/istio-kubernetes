For fault injection,
apply destination-rule-all.yaml
apply rating-service-delay.yaml
apply reviews-v2-timeout.yaml

For mTLS,
deploy rating service without sidecar
apply destination-rule-mtls-all.yaml
try running the service. All the response will be from reviews V1. Because reviews v2 and v3 are failing to call ratings service which is not configured with mTLS.

For Authorization and Access Policy,
apply deny-all-global.yaml
run the service and see the failure
apply allow-grpc-traffic-global.yaml
run the service and see the success