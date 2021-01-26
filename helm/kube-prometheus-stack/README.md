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
helm install [RELEASE_NAME] prometheus-community/kube-prometheus-stack --namespace prometheus -f values.yaml
```
