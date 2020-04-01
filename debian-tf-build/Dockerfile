FROM mqtran4793/debian-tf-base:0.1

WORKDIR /tensorflow_build/tensorflow

COPY .tf_configure.bazelrc /tensorflow_build/tensorflow

RUN export PATH="$PATH:$HOME/bin" && \
    bazel build --config=opt --config=cuda --config=monolithic --jobs=6 --verbose_failures //tensorflow:libtensorflow_cc.so