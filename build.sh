#!/bin/bash

set -e

export IMAGE_NAME=$1 # The full docker image name (without tag)
export REGISTRY=$2 # The Docker Registry to use
export REGISTRY_USERNAME=$3 # The username for the Docker Registry
export REGISTRY_PASSWORD=$4 # The password for the Docker Registry

cd debian-base/
#echo ${REGISTRY_PASSWORD} | docker login --username DOCKER_USERNAME=${REGISTRY_USERNAME} --password-stdin
#docker login -u DOCKER_USERNAME=${REGISTRY_USERNAME} -p DOCKER_PASSWORD=${REGISTRY_PASSWORD}
#docker build --build-arg DOCKER_USERNAME=${REGISTRY_USERNAME} --build-arg DOCKER_PASSWORD=${REGISTRY_PASSWORD} -t ${REGISTRY}/${IMAGE_NAME} .
docker build -t ${REGISTRY}/${IMAGE_NAME} .
docker push ${REGISTRY}/${IMAGE_NAME}

#docker build -t mqtran4793/test:debian-base .
#docker push mqtran4793/test:debian-base
