FROM debian:stretch-slim
ADD label_image /
RUN ls
# FROM debian:stretch-slim as builder

# WORKDIR /tensorflow_build

# COPY bazel-0.24.1-installer-linux-x86_64.sh /tensorflow_build

# RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done && \
#     apt-get update -y && \
#     apt-get install -y build-essential dirmngr \
#     git gcc g++ autoconf autogen automake libtool \
#     mlocate cmake make unzip python3 && \
#     updatedb && \
#     ln -s /usr/bin/python3.5 /usr/bin/python && \
#     apt-get install -y wget && \
#     wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#     apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
# 	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
# 	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
# 	wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
#     apt-get purge -y wget && \
#     rm -rf /var/lib/apt/lists/* && \
#     dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#     apt-get update -y && \
#     apt-get install -y cuda-toolkit-10-0 && \
#     dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
#     dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
#     dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
#     dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
#     dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
#     rm -rf cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#     rm -rf lib* && \
#     chmod +x bazel-0.24.1-installer-linux-x86_64.sh && \    
#     ./bazel-0.24.1-installer-linux-x86_64.sh --user && \
#     git clone https://github.com/tensorflow/tensorflow.git && \
#     rm -rf bazel-0.24.1-installer-linux-x86_64.sh
    
# WORKDIR /tensorflow_build/tensorflow

# COPY .tf_configure.bazelrc /tensorflow_build/tensorflow

# RUN git checkout r1.14 && \
#     apt-get install -y curl wget && \
#     rm -rf tensorflow/contrib/makefile/downloads && \
#     ./tensorflow/contrib/makefile/download_dependencies.sh && \
#     HOST_NSYNC_LIB=`tensorflow/contrib/makefile/compile_nsync.sh` && \
#     TARGET_NSYNC_LIB="$HOST_NSYNC_LIB" && \
#     export HOST_NSYNC_LIB TARGET_NSYNC_LIB && \
#     ./tensorflow/contrib/makefile/compile_linux_protobuf.sh && \
#     apt-get purge -y curl wget && \
#     rm -rf /var/lib/apt/lists/* && \
#     export PATH="$PATH:$HOME/bin" && \
#     bazel build --config=opt --config=cuda --config=monolithic --verbose_failures=1 //tensorflow:libtensorflow_cc.so

# FROM debian:stretch-slim

# WORKDIR /

# RUN mkdir /usr/local/include/tf && \
#     mkdir /usr/local/include/tf/tensorflow

# WORKDIR /tensorflow_build

# RUN for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done && \
#     apt-get update -y && \
#     apt-get install -y wget dirmngr && \
#     wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#     apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
#     wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
#     apt-get purge -y wget dirmngr && \
#     rm -rf /var/lib/apt/lists/* && \
#     dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#     apt-get update -y && \
#     apt-get install -y cuda-toolkit-10-0 && \
#     dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb && \
#     dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb && \
#     dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb && \
#     dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb && \
#     dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb && \
#     rm -rf cuda-repo-ubuntu1604_10.0.130-1_amd64.deb && \
#     rm -rf lib* && \
#     echo 'export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/NsightCompute-1.0${PATH:+:${PATH}}' >> ~/.bashrc && \
#     echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

# WORKDIR /

# RUN rm -rf tensorflow_build

# COPY label_image /label_image
# COPY --from=builder tensorflow_build/tensorflow/tensorflow/cc /usr/local/include/tf/tensorflow/cc
# COPY --from=builder tensorflow_build/tensorflow/tensorflow/core /usr/local/include/tf/tensorflow/core
# COPY --from=builder tensorflow_build/tensorflow/bazel-genfiles /usr/local/include/tf/bazel-genfiles
# COPY --from=builder tensorflow_build/tensorflow/third_party /usr/local/include/tf/third_party
# COPY --from=builder tensorflow_build/tensorflow/tensorflow/contrib/makefile/downloads /usr/local/include
# COPY --from=builder tensorflow_build/tensorflow/bazel-bin/tensorflow/libtensorflow_cc.so /usr/local/lib
# COPY --from=builder tensorflow_build/tensorflow/bazel-bin/tensorflow/libtensorflow_cc.so.1 /usr/local/lib
# COPY --from=builder tensorflow_build/tensorflow/bazel-bin/tensorflow/libtensorflow_cc.so.1.14.1 /usr/local/lib
# COPY --from=builder tensorflow_build/tensorflow/bazel-bin/tensorflow/libtensorflow_cc.so.1.14.1-2.params /usr/local/lib