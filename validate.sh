#/bin/bash

CONFIGMAP=$1

# Replace template '{{ namespace }}' with 'namespace' etc.
cat templates/datalab/$CONFIGMAP.template.yml | sed 's/{{ *//g' | sed 's/ *}}//g'  > test/$CONFIGMAP.yml

# Convert to json so can extract the bits we want
node_modules/.bin/yaml2json test/$CONFIGMAP.yml -s

# Extract data.config
cat test/$CONFIGMAP.json | node_modules/.bin/jq2 '$.data.config' > test/$CONFIGMAP.config.json

# Validate config against schema
ajv validate -s schema/$CONFIGMAP.json -d test/$CONFIGMAP.config.json
