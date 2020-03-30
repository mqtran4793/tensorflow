FROM debian:stretch-slim

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

COPY tensorflow-gpu.tar.gz /

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

RUN tar -xzvf tensorflow-gpu.tar.gz \
&& tensorflow-gpu/install_tensorflow-gpu_prerequisites.sh \
&& tensorflow-gpu/install_tensorflow-gpu.sh

RUN apt-get clean \
&& rm -rf /var/lib/apt/lists/*
