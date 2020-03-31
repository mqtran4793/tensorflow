FROM debian:stretch-slim

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

COPY tensorflow-gpu_build.tar.gz /

RUN tar -xzvf tensorflow-gpu_build.tar.gz && \
    ./tensorflow-gpu_build/tensorflow-gpu_build_env.sh