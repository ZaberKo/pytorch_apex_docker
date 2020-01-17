FROM pytorch/pytorch:1.3-cuda10.1-cudnn7-devel
LABEL maintainer="zaberchann" version="0.1"

ARG WORKSPACE_DIR=/workspace
WORKDIR ${WORKSPACE_DIR}
RUN apt-get update \
    && apt-get install -y vim curl git

RUN mkdir /root/software \
    && cd /root/software \
    && git clone https://github.com/NVIDIA/apex \
    && cd apex \
    && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./

RUN pip install matplotlib seaborn
