#!/bin/bash

DT_TENANT=$(cat creds_dt.json | jq -r '.dynatraceTenant')
DT_API_TOKEN=$(cat creds_dt.json | jq -r '.dynatraceApiToken')
DT_PAAS_TOKEN=$(cat creds_dt.json | jq -r '.dynatracePaasToken')

echo "============================================================="
echo "creating Dynatrace secret"
echo "============================================================="

kubectl -n keptn create secret generic dynatrace --from-literal="DT_TENANT=$DT_TENANT" --from-literal="DT_API_TOKEN=$DT_API_TOKEN"  --from-literal="DT_PAAS_TOKEN=$DT_PAAS_TOKEN"

echo "============================================================="
echo "deploying Dynatrace service"
echo "============================================================="


kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-service/0.6.1/deploy/manifests/dynatrace-service/dynatrace-service.yaml

echo "============================================================="
echo "keptn configure monitoring dynatrace"
echo "============================================================="
keptn configure monitoring dynatrace

echo "============================================================="
echo "waiting 90 seconds for Dynatrace OneAgent to be deployed"
echo "============================================================="

sleep 90
kubectl get pods -n dynatrace


echo "============================================================="
echo "deploying Dynatrace SLI service"
echo "============================================================="

kubectl apply -f https://raw.githubusercontent.com/keptn-contrib/dynatrace-sli-service/0.3.0/deploy/service.yaml

echo "============================================================="
echo "setup of Dynatrace finished"
echo "============================================================="
