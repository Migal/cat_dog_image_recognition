FROM continuumio/anaconda3

RUN install apt-utils
RUN apt install htop
RUN conda install -c conda-forge tensorflow
RUN conda install -c conda-forge keras
RUN conda install -y opencv
RUN conda install -c conda-forge tqdm

ENV NB_USER student
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

WORKDIR /home/${NB_USER}

