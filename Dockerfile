FROM pytorch/pytorch:1.6.0-cuda10.1-cudnn7-devel
LABEL maintainer="zaberchann" version="0.1"


ARG USERNAME=zaber

RUN useradd -G sudo -m -s /bin/bash ${USERNAME}


RUN apt-get update \
    && apt-get install -y vim curl git


ARG WORKSPACE_DIR=workspace
ARG HOMEDIR=/home/${USERNAME}

USER ${USERNAME}
WORKDIR ${WORKSPACE_DIR}

RUN mkdir ${HOMEDIR}/software \
    && cd ${HOMEDIR}/software \
    && git clone https://github.com/NVIDIA/apex \
    && cd apex \
    && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./

RUN pip install matplotlib seaborn

