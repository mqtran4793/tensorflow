FROM debian:stretch-slim

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install wget -y \
&& wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1i629qmgmp-tr5tPmk5WMuG2HVPL7esi-' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1i629qmgmp-tr5tPmk5WMuG2HVPL7esi-" -O tensorflow-gpu.tar.gz && rm -rf /tmp/cookies.txt

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

RUN tar -xzvf tensorflow-gpu.tar.gz \
&& tensorflow-gpu/install_tensorflow-gpu_prerequisites.sh \
&& tensorflow-gpu/install_tensorflow-gpu.sh

RUN rm -r tensorflow-gpu.tar.gz \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
