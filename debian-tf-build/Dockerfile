FROM debian:stretch-slim

RUN mkdir tensorflow_build

WORKDIR /tensorflow_build

ENV DEBIAN_FRONTEND noninteractive

RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

RUN apt-get update -y && \
    apt-get install -y build-essential curl wget dirmngr \
    git gcc g++ gcc-multilib g++-multilib autoconf autogen automake libtool \
    mlocate cmake make pkg-config zlib1g-dev && \
    updatedb

RUN ln -s /usr/bin/python3.5 /usr/bin/python

RUN wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
    apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
    dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
    apt-get update -y && \
    apt-get install -y cuda-toolkit-10-0

RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
    dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
    dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb

RUN wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
    dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb

RUN rm -rf /var/lib/apt/lists/*

COPY bazel-0.24.1-installer-linux-x86_64.sh /tensorflow_build

RUN chmod +x bazel-0.24.1-installer-linux-x86_64.sh && \
    ./bazel-0.24.1-installer-linux-x86_64.sh --user && \
    echo 'export PATH="$PATH:$HOME/bin"' >> ~/.bashrc
    
CMD source ~/.bashrc

RUN git clone https://github.com/tensorflow/tensorflow.git && \
    cd tensorflow && git checkout r1.14

COPY .tf_configure.bazelrc /tensorflow_build && \
    build_all_linux.sh tensorflow/contrib/makefile/

RUN ./tensorflow/contrib/makefile/build_all_linux.sh

RUN cd tensorflow && \
    bazel build --config=opt --config=cuda --config=monolithic --verbose_failures //tensorflow:libtensorflow_cc.so