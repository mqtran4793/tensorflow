#!/bin/bash

set -e

export IMAGE_NAME=$1 # The full docker image name (without tag)
export BRANCH_NAME=$2 # The git branch name (also the resulting docker image tag)
export REGISTRY=$3 # The Docker Registry to use
export REGISTRY_USERNAME=$4 # The username for the Docker Registry
export REGISTRY_PASSWORD=$5 # The password for the Docker Registry

echo ${REGISTRY_PASSWORD} | docker login --username ${REGISTRY_USERNAME} --password-stdin
docker build -t ${REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME} .
docker push ${REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME}