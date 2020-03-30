#!/bin/bash

set -e

export IMAGE_NAME=$1 # The full docker image name (without tag)
export BRANCH_NAME=$2 # The git branch name (also the resulting docker image tag)
export REGISTRY=$3 # The Docker Registry to use
export REGISTRY_USERNAME=$4 # The username for the Docker Registry
export REGISTRY_PASSWORD=$5 # The password for the Docker Registry

cd debian-base/
echo ${REGISTRY_PASSWORD} | docker login --username DOCKER_USERNAME=${REGISTRY_USERNAME} --password-stdin ${REGISTRY}
#docker login docker.io
#docker build --build-arg DOCKER_USERNAME=${REGISTRY_USERNAME} --build-arg DOCKER_PASSWORD=${REGISTRY_PASSWORD} -t ${REGISTRY}/${IMAGE_NAME} .
docker build -t ${REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME} .
#docker build --pull --build-arg BRANCH_NAME=${BRANCH_NAME} --build-arg DOCKER_USERNAME=${REGISTRY_USERNAME} --build-arg DOCKER_PASSWORD=${REGISTRY_PASSWORD} -t ${REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME} .
docker push ${REGISTRY}/${IMAGE_NAME}:${BRANCH_NAME}

#docker build -t mqtran4793/test:debian-base .
#docker push mqtran4793/test:debian-base
