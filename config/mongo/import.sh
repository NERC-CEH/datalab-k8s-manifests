#!/bin/bash

set -e

echo "Job Import started: $(date)"

MONGO_HOST=${MONGO_HOST:-localhost}
MONGO_PORT=${MONGO_PORT:-27017}
MONGO_DATALAB_DB_NAME=${MONGO_DATALAB_DB_NAME:-datalab}

echo "Vairables set: $(date)"

mongoimport --host $MONGO_HOST:$MONGO_PORT --db $MONGO_DATALAB_DB_NAME --collection datalabs --type json --drop --file /seeddata/datalabsCollection.json --jsonArray
mongoimport --host $MONGO_HOST:$MONGO_PORT --db $MONGO_DATALAB_DB_NAME --collection dataStorage --type json --drop --file /seeddata/dataStorageCollection.json --jsonArray

echo "Job Import finished: $(date)"
