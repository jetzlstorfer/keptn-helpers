#!/bin/bash

DT_TENANT=$(cat creds_dt.json | jq -r '.dynatraceTenant')
DT_API_TOKEN=$(cat creds_dt.json | jq -r '.dynatraceApiToken')
DT_PAAS_TOKEN=$(cat creds_dt.json | jq -r '.dynatracePaasToken')

kubectl -n keptn create secret generic dynatrace --from-literal="DT_TENANT=$DT_TENANT" --from-literal="DT_API_TOKEN=$DT_API_TOKEN"  --from-literal="DT_PAAS_TOKEN=$DT_PAAS_TOKEN"

kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-service/0.6.1/deploy/manifests/dynatrace-service/dynatrace-service.yaml

keptn configure monitoring dynatrace

sleep 10
kubectl get pods -n dynatrace

kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-sli-service/0.3.0/deploy/service.yaml

