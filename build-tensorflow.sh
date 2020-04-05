# #!/bin/bash

# for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done
# apt-get update -y
# apt-get install -y build-essential wget \
#     autoconf autogen automake libtool \
#     mlocate unzip python3
# updatedb

# ln -sf /usr/bin/python3.5 /usr/bin/python

# #mkdir tensorflow-build && \
# #mv bazel-0.24.1-installer-linux-x86_64.sh tensorflow-build && \
# #mv .tf_configure.bazelrc tensorflow-build && \
# #cd tensorflow-build

# wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
# wget -qO - http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub | apt-key add -
# wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb
# wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb
# wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb
# wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb
# wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb


# dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.de
# apt-get update -y
# apt-get install -y cuda-toolkit-10-0
# dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb
# dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb
# dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb
# dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb
# dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb

# ./scripts/build-tensorflow/bazel-0.24.1-installer-linux-x86_64.sh --user
# echo
# echo "Finished install bazel"
# echo
# git clone https://github.com/tensorflow/tensorflow.git
# cd tensorflow
# pwd
# echo "Checkout"
# git checkout r1.14
# rm -rf tensorflow/contrib/makefile/downloads

# ./tensorflow/contrib/makefile/download_dependencies.sh
# HOST_NSYNC_LIB='tensorflow/contrib/makefile/compile_nsync.sh'
# TARGET_NSYNC_LIB="$HOST_NSYNC_LIB"
# export HOST_NSYNC_LIB TARGET_NSYNC_LIB
# ./tensorflow/contrib/makefile/compile_linux_protobuf.sh
# export PATH="$PATH:$HOME/bin"
# echo "Check bazel version"
# bazel --version

# echo "Build tensorflow"
# bazel build --config=opt --config=cuda --config=monolithic --verbose_failures=1 //tensorflow:libtensorflow_cc.so

# rm -rf /var/lib/apt/lists/*

# echo 'export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/NsightCompute-1.0${PATH:+:${PATH}}' >> ~/.bashrc
# echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc



















#!/bin/bash

set -e

for i in $(seq 1 8); do mkdir -p "/usr/share/man/man${i}"; done

# Installing prerequisites
echo 
echo "###############################################"
echo "#     Installing Tensorflow prerequisites     #"
echo "###############################################"
echo
apt-get update -y
apt-get install -y build-essential wget autoconf autogen automake libtool mlocate unzip python3
updatedb

# Setting up the correct version of python
ln -sf /usr/bin/python3.5 /usr/bin/python

# Downloading and installing CUDA
echo
echo "################################"
echo "#     Installing CUDA 10.0     #"
echo "################################"
echo
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
wget -qO - http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub | apt-key add -
dpkg -i cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
apt-get update -y
apt-get install -y cuda-toolkit-10-0

# Downloading and installing cuDNN
echo
echo "################################"
echo "#     Installing cuDNN 7.4     #"
echo "################################"
echo
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb
dpkg -i libcudnn7_7.4.2.24-1+cuda10.0_amd64.deb
dpkg -i libcudnn7-dev_7.4.2.24-1+cuda10.0_amd64.deb

# Downloading and installing TensorRT
echo
echo "###################################"
echo "#     Installing TensorRT 6.0     #"
echo "###################################"
echo
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer6_6.0.1-1+cuda10.0_amd64.deb
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb
wget https://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64/libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb
dpkg -i libnvinfer6_6.0.1-1+cuda10.0_amd64.deb
dpkg -i libnvinfer-dev_6.0.1-1+cuda10.0_amd64.deb
dpkg -i libnvinfer-plugin6_6.0.1-1+cuda10.0_amd64.deb

# Installing bazel 0.24.1
echo
echo "###################################"
echo "#     Installing Bazel 0.24.1     #"
echo "###################################"
echo
./scripts/build-tensorflow/bazel-0.24.1-installer-linux-x86_64.sh --user

# CloningTensorflow git
git clone https://github.com/tensorflow/tensorflow.git
# Check out r1.14
cd tensorflow
git checkout r1.14

rm -rf tensorflow/contrib/makefile/downloads

./tensorflow/contrib/makefile/download_dependencies.sh
HOST_NSYNC_LIB='tensorflow/contrib/makefile/compile_nsync.sh'
TARGET_NSYNC_LIB="$HOST_NSYNC_LIB"
export HOST_NSYNC_LIB TARGET_NSYNC_LIB
./tensorflow/contrib/makefile/compile_linux_protobuf.sh
export PATH="$PATH:$HOME/bin"
echo "Check bazel version"
bazel version
cp ../scripts/build-tensorflow/.tf_configure.bazelrc  .
cat .tf_configure.bazelrc
echo "Build tensorflow"
bazel build --config=opt --config=cuda --config=monolithic --verbose_failures=1 //tensorflow:libtensorflow_cc.so

rm -rf /var/lib/apt/lists/*

mkdir -p /usr/local/include/tf/tensorflow
cp -r tensorflow/cc /usr/local/include/tf/tensorflow/cc
cp -r tensorflow/core /usr/local/include/tf/tensorflow/core
cp -r bazel-genfiles /usr/local/include/tf/bazel-genfiles
cp -r third_party /usr/local/include/tf/third_party
cp -r tensorflow/contrib/makefile/downloads/* /usr/local/include
cp -r bazel-bin/tensorflow/libtensorflow* /usr/local/lib

echo 'export PATH=/usr/local/cuda-10.0/bin:/usr/local/cuda-10.0/NsightCompute-1.0${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc