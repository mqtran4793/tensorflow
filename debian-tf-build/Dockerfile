FROM debian:stretch-slim

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

COPY tensorflow-gpu_build.tar.gz /

RUN tar -xzvf tensorflow-gpu_build.tar.gz && \
    ./tensorflow-gpu_build/tensorflow-gpu_build_env.sh