#! /usr/bin/env bash

set -e

gcloud auth activate-service-account --key-file=key.json

gcloud config set project $PROJECT_NAME
gcloud config set container/cluster $CLUSTER_NAME
gcloud config set compute/zone $ZONE
gcloud container clusters get-credentials $CLUSTER_NAME --zone $ZONE

helm upgrade pangeohub pangeo/pangeo \
    --devel --version "19.09.27-86dd66c" \
    -f parameters.yaml \
    --set jupyterhub.proxy.secretToken=$JHUB_SECRET_TOKEN \
    --set jupyterhub.auth.github.clientId=$GITHUB_CLIENTID \
    --set jupyterhub.auth.github.clientSecret=$GITHUB_CLIENTSECRET \
    --namespace=pangeo
