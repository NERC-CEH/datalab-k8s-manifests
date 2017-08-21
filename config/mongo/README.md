# Manual Environment Specific Configuration

## Mongo Database

There are two collections that need to be populated in order for datalabs to function:

* Notebooks
* Storage

The seed data is stored in the sub folders `test` and `production` for the different
environments. To import the data first open a direct port forward to the database:

```
kubectl port-forward <pod-name> 28017:27017
```

Note the different IP address, avoid 27017 so it doesn't conflict with databases running
locally.

With the Port forward open, run the following command **from within the config/mongo directory** to execute a mongo container and import the required seed data.

```
docker run -rm --net="host" -v ${PWD}/<environment>:/data -v ${PWD}/import.sh:/import.sh mongo sh //import.sh
```

The `--net="host"` allows the container to use the open port forward