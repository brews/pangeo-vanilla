#! /usr/bin/env bash

set -e

helm upgrade pangeohub pangeo/pangeo \
    --devel --version "19.09.27-86dd66c" \
    -f parameters.yaml \
    --set jupyterhub.proxy.secretToken=$JHUB_SECRET_TOKEN \
    --set jupyterhub.auth.github.clientId=$GITHUB_CLIENTID \
    --set jupyterhub.auth.github.clientSecret=$GITHUB_CLIENTSECRET \
    --namespace=pangeo
