FROM mqtran4793/debian-tf-base:0.1

WORKDIR /tensorflow_build/tensorflow
RUN cpuinfo
RUN export PATH="$PATH:$HOME/bin" && \
    bazel build --config=opt --config=monolithic --verbose_failures //tensorflow:libtensorflow_cc.so