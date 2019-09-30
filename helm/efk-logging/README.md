### Setup Helm3
```bash
wget https://get.helm.sh/helm-v3.0.0-beta.3-linux-amd64.tar.gz
tar -zxvf helm-v3.0.0-beta.3-linux-amd64.tar.gz
mv linux-amd64/helm /usr/local/bin/helm3
```

### Add repos
```bash
helm3 repo add elastic https://helm.elastic.co
helm3 repo add kiwigrid https://kiwigrid.github.io
```

### Create logging namespace
```bash
kubectl create -f efk-logging/efk-logging-ns.yaml
```

### Update repos
```bash
helm3 repo update
```

### Install Helm Charts
```bash
helm3 upgrade --install elasticsearch elastic/elasticsearch -n efk-logging -f efk-logging/values-elastic.yaml
helm3 upgrade --install kibana elastic/kibana -n efk-logging
helm3 upgrade --install fluentd-elasticsearch kiwigrid/fluentd-elasticsearch -n efk-logging -f efk-logging/values-fluentd-es.yaml
```


### Access Kibana at localhost:5601 and create index pattern
```bash
kubectl port-forward $KIBANA_POD 5601:5601 --namespace=efk-logging
```

### Migrating from Helm2 to Helm3
https://helm.sh/blog/migrate-from-helm-v2-to-helm-v3/
https://github.com/helm/helm-2to3