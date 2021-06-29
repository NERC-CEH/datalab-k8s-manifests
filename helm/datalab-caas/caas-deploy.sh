#!/bin/bash

NAMESPACE=test
MONGO_PASSWORD=""
TEMPDIR='./tmp'


# create the namespace for the lab
if kubectl get namespaces | grep -q '$NAMESPACE'; then
   echo "$NAMESPACE namespace exists"
else
  echo "Creating a new $NAMESPACE namespace...."
  kubectl create namespace $NAMESPACE
fi


# deploy secrets
# create mongo password secret
kubectl create secret generic mongo-password-secret -n $NAMESPACE --from-literal=secret=$MONGO_PASSWORD

# Create auth-signing-key secret
privateKeyFile=private_key.pem
publicKeyFile=public_key.pem
mkdir $TEMPDIR
cd $TEMPDIR
openssl genpkey -algorithm RSA -out $privateKeyFile -pkeyopt rsa_keygen_bits:2048
openssl rsa -pubout -in $privateKeyFile -out $publicKeyFile

kubectl create secret generic auth-signing-key -n $NAMESPACE --from-file=public="$publicKeyFile" --from-file=private="$privateKeyFile"

cd ..
rm -r $TEMPDIR