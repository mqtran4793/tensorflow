FROM debian:stretch-slim

RUN mkdir tensorflow_build

WORKDIR /tensorflow_build

ENV DEBIAN_FRONTEND noninteractive

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done && \
    apt-get update -y && \
    apt-get install -y build-essential dirmngr \
    git gcc g++ autoconf autogen automake libtool \
    mlocate cmake make zip unzip \
    python3 python3-dev && \
    updatedb && \
    ln -s /usr/bin/python3.5 /usr/bin/python && \
    apt-get install -y wget && \
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
    wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
    wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
    apt-get purge -y wget && \
    rm -rf /var/lib/apt/lists/*

RUN dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
    apt-get update -y && \
    apt-get install -y cuda-toolkit-10-0 && \
    dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
    dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
    rm -rf cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
    rm -rf lib*

COPY bazel-0.24.1-installer-linux-x86_64.sh /

RUN apt-get install -y curl && \
    chmod +x bazel-0.24.1-installer-linux-x86_64.sh && \    
    ./bazel-0.24.1-installer-linux-x86_64.sh --user && \
    git clone https://github.com/tensorflow/tensorflow.git && \
    apt-get purge -y curl && \
    rm -rf bazel-0.24.1-installer-linux-x86_64.sh

#COPY bazel-0.24.1-installer-linux-x86_64.sh /tensorflow_build

#RUN chmod +x bazel-0.24.1-installer-linux-x86_64.sh && \
#    ./bazel-0.24.1-installer-linux-x86_64.sh --user

#RUN git clone https://github.com/tensorflow/tensorflow.git

#WORKDIR /tensorflow_build/tensorflow

#RUN git checkout r1.14

#COPY .tf_configure.bazelrc /tensorflow_build/tensorflow

#RUN rm -rf tensorflow/contrib/makefile/downloads && \
#    ./tensorflow/contrib/makefile/download_dependencies.sh

#RUN HOST_NSYNC_LIB=`tensorflow/contrib/makefile/compile_nsync.sh` && \
#    TARGET_NSYNC_LIB="$HOST_NSYNC_LIB" && \
#    export HOST_NSYNC_LIB TARGET_NSYNC_LIB

#RUN ./tensorflow/contrib/makefile/compile_linux_protobuf.sh

#WORKDIR /

#RUN rm -rf /var/lib/apt/lists/* && \
#    rm -rf /tensorflow_build/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#    rm -rf /tensorflow_build/lib* && \
#    rm -rf /tensorflow_build/bazel-0.24.1-installer-linux-x86_64.sh && \
#    apt-get purge -y wget