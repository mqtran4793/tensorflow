FROM debian:stretch-slim

WORKDIR /

ENV DEBIAN_FRONTEND noninteractive

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

#COPY tensorflow-gpu.tar.gz /

RUN apt-get update -y && \
    apt-get install -y build-essential wget curl dirmngr \
    git gcc g++ gcc-multilib g++-multilib autoconf autogen automake libtool \
    mlocate cmake make pkg-config zlib1g-dev && \
    updatedb

RUN wget --load-cookies /tmp/cookies.txt \
    "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1r99mka_KR3U_TFCaA2TfLkB9fiW12I0Y' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1r99mka_KR3U_TFCaA2TfLkB9fiW12I0Y" -O tensorflow-gpu.tar.gz && rm -rf /tmp/cookies.txt

RUN tar -xzvf tensorflow-gpu.tar.gz

RUN ln -s /usr/bin/python3.5 /usr/bin/python

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub && \
    dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb && \
    apt-get update -y && \
    apt-get install -y cuda-toolkit-10-0

RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
    dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
    dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \

RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /usr/local/include/tf && \
    cp -r tensorflow-gpu/tensorflow/ /usr/local/include/tf/ && \
    cp -r tensorflow-gpu/third_party/ /usr/local/include/tf/ && \
    cp -r tensorflow-gpu/include/* /usr/local/include/ && \
    cp -r tensorflow-gpu/libtensorflow* /usr/local/lib

RUN cd tensorflow-gpu/example && \
    curl –L "https://storage.googleapis.com/download.tensorflow.org/models/inception_v3_2016_08_28_frozen.pb.tar.gz" | tar -C label_image/data/ -xz && \
    cd label_image && mkdir build && cd build && \
    cmake .. && make && \
    ./label_image