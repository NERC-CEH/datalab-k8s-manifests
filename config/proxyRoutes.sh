# SSL certificates
curl -i -X POST http://localhost:8001/certificates \
    -F "cert=@/etc/ssl/certs/datalabs.pem" \
    -F "key=@/etc/ssl/private/datalabskey.pem" \
    -F "snis=testlab.test-datalabs.nerc.ac.uk,testlab-api.test-datalabs.nerc.ac.uk,testlab-docs.test-datalabs.nerc.ac.uk,testlab-minio.test-datalabs.nerc.ac.uk,testlab-jupyter.test-datalabs.nerc.ac.uk,testlab-zeppelin.test-datalabs.nerc.ac.uk,testlab-dask.test-datalabs.nerc.ac.uk,testlab-spark.test-datalabs.nerc.ac.uk"

# app 31501
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-app' \
  --data 'hosts=testlab.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:31501' \
  --data 'https_only=true'

# api - 32328
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-api' \
  --data 'hosts=testlab-api.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:32328' \
  --data 'https_only=true'

# docs - 31859
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-docs' \
  --data 'hosts=testlab-docs.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:31859' \
  --data 'https_only=true'

# jupyter - 32012
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-jupyter' \
  --data 'hosts=testlab-jupyter.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:32012' \
  --data 'preserve_host=true' \
  --data 'https_only=true'

# minio - 32031
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-minio' \
  --data 'hosts=testlab-minio.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:32031' \
  --data 'https_only=true'

# zeppelin - 31913
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-zeppelin' \
  --data 'hosts=testlab-zeppelin.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:31913' \
  --data 'https_only=true'

# dask - 30551
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-dask' \
  --data 'hosts=testlab-dask.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:30551' \
  --data 'https_only=true'

# spark dashboard - 32629
# curl -i -X POST \
#   --url http://localhost:8001/apis \
#   --data 'name=datalab-spark' \
#   --data 'hosts=testlab-spark.test-datalabs.nerc.ac.uk' \
#   --data 'upstream_url=http://192.168.3.6:32629' \
#   --data 'https_only=true'


# zeppelin-connect - 30737
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-zeppelin-connect' \
  --data 'hosts=testlab-zeppelin.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:30737' \
  --data 'uris=/connect' \
  --data 'strip_uri=true' \
  --data 'https_only=true'

# minio-connect - 32709
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-minio-connect' \
  --data 'hosts=testlab-minio.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:32709' \
  --data 'uris=/connect' \
  --data 'strip_uri=true' \
  --data 'https_only=true'

# shiny-server - 31594
curl -i -X POST \
  --url http://localhost:8001/apis \
  --data 'name=datalab-shiny' \
  --data 'hosts=testlab-shiny.test-datalabs.nerc.ac.uk' \
  --data 'upstream_url=http://192.168.3.6:31594' \
  --data 'https_only=true'
