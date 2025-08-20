FROM ubuntu:24.04 AS engine

LABEL authors="pmrj"

WORKDIR /root
USER root
ENV CONDA_PATH=/opt/conda/bin/conda
ENV CONDA_DIR=/opt/conda

ARG USER_NAME="Pedro Jorge"
ARG USER_EMAIL="tree@rustcircle.com"

RUN apt-get update && apt-get install apt-utils && apt-get install -y git wget curl  && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git config --global user.name $USER_NAME
RUN git config --global user.email $USER_EMAIL
RUN git config --global init.defaultBranch main

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh

RUN bash /tmp/miniconda.sh -b -p $CONDA_DIR

ENV PATH="$CONDA_DIR/bin:$PATH"

RUN $CONDA_DIR/bin/conda init bash

SHELL ["/bin/bash", "-i", "-c"]

RUN rm -rf /tmp/miniconda.sh

RUN conda tos accept

RUN conda update -n base conda -y

RUN conda config --set solver libmamba

RUN conda create -n engine python=3.9 --solver libmamba -y

ADD requirements.txt /requirements.txt

ADD install.sh /install.sh

RUN chmod +x /install.sh

RUN /install.sh

ENTRYPOINT ["/bin/bash", "-i", "-c"]