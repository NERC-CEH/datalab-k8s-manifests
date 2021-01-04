# DataLab Kubernetes Manifests

This repository contains the Kubernetes manifests required to deploy a DataLab. 
These manifests are configured to be deployed using [Helm 3](https://helm.sh/) through a single Helm chart located at `helm/datalab`.

## Installing a DataLab

The Helm chart can be installed with default values using the following command where `<release_name>` is to be replaced with a name of your choice e.g. `datalab`.

```bash
helm install <release_name> ./helm/datalab
```

The default values applied during this command are defined in `./helm/datalab/values.yaml`.
Default values can be overridden by:

- passing another file of values using either the `-f` or `--values` flags e.g. `helm install --values my-values.yaml ./helm/datalab`
- or, if only overriding a small number of values, the `--set` flag e.g. `helm install --set namespace=test ./helm/datalab`

See the [`helm install` documentation](https://helm.sh/docs/helm/helm_install/) for more information.

Additional value files for different CEH environments are provided in the `config` directory.

## Upgrading a DataLab

Installed DataLabs can be upgraded to the latest chart using the following command where `<release_name>` is to be replaced with the name used when installing the DataLab Helm chart in [Installing a DataLab](#installing-a-datalab).

```bash
helm upgrade <release_name> ./helm/datalab
```

## Updating the Helm chart

As the system develops, it will be necessary to update the Helm chart used to install a DataLab. 
To update the way in which a DataLab is deployed to Kubernetes, the templates should be updated accordingly.
To update the version of DataLab that is to be deployed, the `appVersion` in `.helm/datalab/Chart.yaml` should be updated.
The `appVersion` should be set to the Docker tag of the DataLab version to be deployed.
When making changes in either of these places, the chart `version` field needs to be updated. 
This is covered in more detail in comments within `./helm/datalab/Chart.yaml` itself. 

## Additional notes

### Vault unseal

By default, the DataLab Helm chart [deploys a cronjob](helm/datalab/templates/vault/vault-unseal-cronjob.yml) that runs periodically to unseal the vault should it be rescheduled for any reason.
This can be opted out of by setting `deployVaultUnseal` to `false`.
For the unseal job to work, the vault keys must be stored in a Kubernetes secret. 
This secret must be created manually in the correct namespace. 
See the following snippet for an example of how this can be done where `<namespace>` should be replaced with the `namespace` value used when installing DataLab (e.g. `test` by default).

```bash
echo -n 'KEY_1,KEY_2' > ./vault_keys.txt
kubectl create secret -n <namespace> generic vault-unseal-secret --from-file=./vault_keys.txt
rm -f ./vault_keys.txt
```

---

[![Build Status](https://github.com/NERC-CEH/datalab-k8s-manifests/workflows/Push%20action/badge.svg)](https://github.com/NERC-CEH/datalab-k8s-manifests/workflows/Push%20action/badge.svg)
