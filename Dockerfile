FROM jupyter/scipy-notebook:latest
LABEL maintainer="OpenJNY <openjny@gmail.com>"

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends graphviz && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

RUN conda install --yes --quiet pytorch torchvision cpuonly -c pytorch && \
    conda install --yes --quiet -c dglteam dgl && \
    conda install --yes --quiet -c conda-forge umap-learn && \
    conda install --yes --quiet pygraphviz && \
    conda clean --all -f -y
RUN python -m pip install torchviz