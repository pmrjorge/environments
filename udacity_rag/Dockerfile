FROM nvidia/cuda:13.0.0-cudnn-runtime-ubuntu24.04 AS engine

LABEL authors="pmrj"

WORKDIR /root
USER root
ENV CONDA_HOME=/miniconda3/bin/conda
ENV CONDA_DIR=/miniconda3

ARG USER_NAME="Pedro Jorge"
ARG USER_EMAIL="tree@rustcircle.com"

RUN apt-get update && apt-get install apt-utils && apt-get install -y unzip git wget curl nginx openssh-server gcc g++ build-essential cmake clang make && \
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

SHELL ["conda", "run", "-n", "engine", "/bin/bash", "-c"]

RUN conda run -n engine jupyter lab --generate-config

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication no/PasswordAuthentication no/' /etc/ssh/sshd_config

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /start.sh

RUN chmod +x /start.sh

WORKDIR /workspace
VOLUME ["/workspace"]

EXPOSE 8888 8080 22 80
ENTRYPOINT ["/start.sh"]