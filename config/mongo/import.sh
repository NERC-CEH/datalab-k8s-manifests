#!/bin/bash

set -e

echo "Job Import started: $(date)"

MONGO_HOST=${MONGO_HOST:-localhost}
MONGO_PORT=${MONGO_PORT:-27017}
MONGO_DATALAB_DB_NAME=${MONGO_DATALAB_DB_NAME:-datalab}
MONGO_USER=${MONGO_USER:-datalabs-root-u}
MONGO_PASSWORD=${MONGO_PASSWORD:-datalabs-root-p}

echo "Variables set: $(date)"

mongoimport -u $MONGO_USER -p $MONGO_PASSWORD --host $MONGO_HOST:$MONGO_PORT --db $MONGO_DATALAB_DB_NAME --collection datalabs --type json --drop --file /seeddata/datalabsCollection.json --jsonArray --authenticationDatabase admin
mongoimport -u $MONGO_USER -p $MONGO_PASSWORD --host $MONGO_HOST:$MONGO_PORT --db $MONGO_DATALAB_DB_NAME --collection dataStorage --type json --drop --file /seeddata/dataStorageCollection.json --jsonArray --authenticationDatabase admin

echo "Job Import finished: $(date)"
