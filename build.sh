#!/bin/bash

set -e

export IMAGE_NAME=$1 # The full docker image name (without tag)
export DOCKER=$2 # The Docker Registry to use
export DOCKER_USER=$3 # The username for the Docker Registry
export DOCKER_PASSWORD=$4 # The password for the Docker Registry

cd debian-base/

echo ${DOCKER_PASSWORD} | docker login --username ${DOCKER_USER} --password-stdin ${REGISTRY}
docker build --build-arg DOCKER_USERNAME=${REGISTRY_USERNAME} --build-arg DOCKER_PASSWORD=${REGISTRY_PASSWORD} -t ${REGISTRY}/${IMAGE_NAME} .
docker push ${REGISTRY}/${IMAGE_NAME}

#docker build -t mqtran4793/test:debian-base .
#docker push mqtran4793/test:debian-base
