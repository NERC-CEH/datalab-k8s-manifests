# Deploy a Dask cluster

To deploy a dask cluster run the following commands

```
kubectl apply -f namespace.yml
kubectl apply -f authorisation.yml
kubectl create configmap dask-scheduler --from-file=adaptive.py --from-file=run.sh  --namespace=dask
kubectl create -f scheduler.yml
kubectl create -f service.yml
kubectl create -f worker.yml
```