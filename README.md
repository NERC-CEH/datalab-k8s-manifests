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
