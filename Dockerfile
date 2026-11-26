FROM jupyter/base-notebook:latest
USER root
RUN apt-get update && apt-get install -y --no-install-recommends nodejs npm git && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /content && chmod 777 /content
# Make npm global installs writable for the notebook user
RUN mkdir -p /opt/npm-global && chown -R jovyan:jovyan /opt/npm-global
ENV NPM_CONFIG_PREFIX=/opt/npm-global
ENV PATH=/opt/npm-global/bin:$PATH
USER jovyan
