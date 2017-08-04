# Datalab Kubernetes Manifests

This respository contains all of the Kubernetes manifests required to deploy a datalab. There are many different components and each is separated into a different folder.

## Datalab

Deployment of the datalab application, api and online documentation. For each one a deployment and corresponding service is created.

## Gluster

Creation of the endpoints and service required to support Gluster volumes.

## Jupyter

Deployment of a Jupyter notebook with mounted storage and service.

## Minio

Deployment of a Minio container to provide S3 access and a file browser for a Gluster volume.

## Rook

Rook deployment. Possible alternative to Gluster.

## Spark

Deployment of a Spark cluster. Master and Worker deployments into a namespace with required services.

## Zeppelin

Deployment of a Zeppelin notebook with mounted storage and service.

## Vault

Deployment of Vault backed by Gluster volume with service.