kubectl -n keptn set image deployment/bridge bridge=keptn/bridge2:0.6.1.EAP.20200221.1458 --record
kubectl -n keptn-datastore set image deployment/mongodb-datastore mongodb-datastore=keptn/mongodb-datastore:0.6.1.EAP.20200131.1010 --record
