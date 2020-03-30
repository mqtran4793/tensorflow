#!/bin/bash

set -e

#ROOT="$HOME/Desktop/Docker/"

cd debian-base/
docker build -t mqtran4793/test:debian-base .
docker push mqtran4793/test:debian-base
