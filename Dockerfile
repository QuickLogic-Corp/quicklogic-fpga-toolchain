FROM ubuntu:18.04 as builder
# ubuntu:20.04 does not include libffi.so.6, but the version of yosys in the 
# Quicklogic Symbiflow_v1.1.1.gz.run installer needs libffi.so.6, so use 18.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles

RUN apt-get update && apt-get install -y \
    libcanberra-gtk-module \
    wget \
    xz-utils && \
    rm -rf /var/lib/apt/lists/*

# make /bin/sh symlink to bash instead of dash:
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

ENV INSTALL_DIR="/opt/symbiflow/eos-s3"
RUN wget https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v1.1.0_Beta/Symbiflow_v1.1.0.gz.run
RUN chmod 755 Symbiflow_v1.1.0.gz.run
RUN ./Symbiflow_v1.1.0.gz.run
RUN rm Symbiflow_v1.1.0.gz.run

ENV PATH="${INSTALL_DIR}/install/bin:${INSTALL_DIR}/install/bin/python:$PATH"


