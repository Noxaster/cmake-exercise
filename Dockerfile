FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    unzip \
    wget \
    vim \
    libboost-all-dev \
    libdeal.ii-dev \
    git

WORKDIR /tmp

RUN wget https://github.com/jbeder/yaml-cpp/archive/refs/tags/yaml-cpp-0.6.3.zip

RUN unzip yaml-cpp-0.6.3.zip

WORKDIR /tmp/yaml-cpp-yaml-cpp-0.6.3
RUN mkdir build && cd build && \
    cmake .. -DYAML_BUILD_SHARED_LIBS=ON && \
    make && \
    make install

ENV LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /cmake-exercise

CMD ["/bin/bash"]