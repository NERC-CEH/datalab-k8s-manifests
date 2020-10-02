### Add repo
```bash
helm repo add stable https://kubernetes-charts.storage.googleapis.com
```

### Update repo
```bash
helm repo update
```

### Install Helm Chart
```bash
helm install --set storageClass.name=nfs-storage --set nfs.server=192.168.3.23 --set nfs.path=/data/nfs stable/nfs-client-provisioner
```
