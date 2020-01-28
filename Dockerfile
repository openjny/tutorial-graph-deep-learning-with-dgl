FROM jupyter/scipy-notebook:latest
LABEL maintainer="OpenJNY <openjny@gmail.com>"

USER root
USER $NB_UID
RUN conda install pytorch torchvision cpuonly -c pytorch
RUN conda install -c dglteam dgl