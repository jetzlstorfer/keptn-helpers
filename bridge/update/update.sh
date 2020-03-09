kubectl -n keptn set image deployment/bridge bridge=keptn/bridge2:20200308.0859 --record
kubectl -n keptn set image deployment/configuration-service configuration-service=keptn/configuration-service:20200308.0859 --record
kubectl -n keptn-datastore set image deployment/mongodb-datastore mongodb-datastore=keptn/mongodb-datastore:20200308.0859 --record
