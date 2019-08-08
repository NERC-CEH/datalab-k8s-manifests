# Manual Environment Specific Configuration

## Mongo Database

There are two collections that need to be populated in order for datalabs to function:

* Datalabs
* Storage

The seed data is stored in the sub folders `test` and `production` for the different
environments. To import the data first open a direct port forward to the database:

```bash
kubectl port-forward <pod-name> 27017:27017
```

With the Port forward open, run the following command **from within the config/mongo
directory** to execute a mongo container and import the required seed data.

```bash
docker run --rm --net="host" -v ${PWD}/production:/seeddata -v ${PWD}/import.sh:/import.sh mongo sh /import.sh
```

For linux machines, adding `--net="host"` allows the container to use the open port
forward on localhost.

For mac machines, adding `-e MONGO_HOST=docker.for.mac.localhost` with redirect the
connect to the local port. For example,

```bash
docker run --rm -e MONGO_HOST=docker.for.mac.localhost -e MONGO_PORT=<port> -e MONGO_USER=datalab -e MONGO_PASSWORD='<password>' -v ${PWD}/test:/seeddata -v ${PWD}/import.sh:/import.sh mongo sh /import.sh
```

Environment variables can be used to set the database name, host and port:

* MONGO_HOST
* MONGO_PORT
* MONGO_DATALAB_DB_NAME

These can be set using the docker `-e` flag.
