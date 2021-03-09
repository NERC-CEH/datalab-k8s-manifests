### Add repo
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

### Update repo
```bash
helm repo update
```

### Install Helm Chart
```bash
kubectl create ns prometheus
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace prometheus -f test/values.yaml
```

### Create Monitoring Ingress
```bash
kubectl create -f test/monitor-ingress.yaml
```
