# Datalab Kubernetes Manifests

This repository contains all of the Kubernetes manifests required to deploy a datalab. There are many different components and each is separated into a different folder.

## Datalab

Deployment of the datalab application, api and online documentation. For each one a deployment and corresponding service is created.

## Dask

Deployment of a Dask cluster. Scheduler and worker deployments into a namespace with
required services.

## Discourse

Discourse is deployed as a separate virtual machine within the tenancy; only ingress
routes to the internal IP address are needed.

## Spark

Deployment of a Spark cluster. Master and Worker deployments into a namespace with required services.

## Vault

Deployment of Vault backed by Gluster volume with service.

## Management

These manifests consist of non-necessary components which are part of maintaining and managing the cluster.

### Etcd Backup

This will take nightly backups of etcd and store them in a newly provisioned persistent volume.

### Vault Unseal

This will setup a cronjob to periodically check the status of the Vault seal and unseal if necessary. Note that storing the Vault keys in the cluster must be
carried out manually in the correct namespace prior to deployment of the manifest, this is not automated. See snippet below.

```bash
echo -n 'KEY_1,KEY_2' > ./vault_keys.txt
kubectl create secret -n test generic vault-unseal-secret --from-file=./vault_keys.txt
rm -f ./vault_keys.txt
```
