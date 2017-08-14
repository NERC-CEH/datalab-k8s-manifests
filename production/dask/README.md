# Deploy a Dask cluster

To deploy a dask cluster run the following commands

```
kubectl apply -f authorisation.yml
kubectl apply -f scheduler.yml
kubectl apply -f service.yml
kubectl apply -f workers.yml
```