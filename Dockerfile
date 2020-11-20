ARG IMAGE="python:3-slim-buster"

#---
# Place anything that is common to both the build and execution environment in base 
#
FROM $IMAGE AS base

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    ca-certificates \
    clang \
    cmake \
    curl \
    git \
    libffi-dev \
    libreadline-dev \
    tcl-dev \
    graphviz \
    wget \
    xdot \
 && apt-get autoclean && apt-get clean && apt-get -y autoremove \
 && update-ca-certificates \
 && rm -rf /var/lib/apt/lists

ENV INSTALL_DIR="/opt/symbiflow/eos-s3"
ENV PATH="$INSTALL_DIR/install/bin:$INSTALL_DIR/install/bin/python:$PATH"
ENV YOSYS=${INSTALL_DIR}/install/bin/yosys

#---

FROM base AS build

RUN apt-get update -qq \
 && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    bison \
    build-essential \
    flex \
    gawk \
    git \
    iverilog \
    pkg-config

#Checkout *yosys* repository (https://github.com/QuickLogic-Corp/yosys.git), branch: **quicklogic-rebased**. 
RUN git clone https://github.com/QuickLogic-Corp/yosys.git -b quicklogic-rebased quicklogic-yosys
RUN cd quicklogic-yosys
WORKDIR /quicklogic-yosys
RUN make config-gcc
RUN make install PREFIX=${INSTALL_DIR}/install
RUN cd -

#Checkout *yosys-symbiflow-plugins* (https://github.com/QuickLogic-Corp/yosys-symbiflow-plugins), branch: **ql-ios**.
WORKDIR /
RUN git clone https://github.com/QuickLogic-Corp/yosys-symbiflow-plugins -b ql-ios
RUN cd yosys-symbiflow-plugins
WORKDIR /yosys-symbiflow-plugins
# export PATH='specify Yosys installation path as specified in PREFIX in previous step':$PATH
RUN make
RUN make install
RUN cd -

#Checkout *vpr* repository (https://github.com/QuickLogic-Corp/vtr-verilog-to-routing.git), branch: **blackbox_timing**.
WORKDIR /
RUN git clone https://github.com/QuickLogic-Corp/vtr-verilog-to-routing -b blackbox_timing
RUN cd vtr-verilog-to-routing
WORKDIR /vtr-verilog-to-routing
RUN make

#Checkout *symbiflow-arch-defs* repository (https://github.com/QuickLogic-Corp/symbiflow-arch-defs.git), branch: **quicklogic-upstream-rebase**. 
WORKDIR /
RUN git clone https://github.com/QuickLogic-Corp/symbiflow-arch-defs.git -b quicklogic-upstream-rebase
RUN cd symbiflow-arch-defs
WORKDIR /symbiflow-arch-defs

RUN make env
RUN cd build
RUN make all_conda
RUN cd -
RUN make

#---

FROM base AS release-candidate

COPY --from=build /opt/symbiflow/eos-s3 /opt/symbiflow/eos-s3/
COPY --from=build /symbiflow-arch-defs /symbiflow-arch-defs/
COPY --from=build /yosys-symbiflow-plugins /yosys-symbiflow-plugins/
COPY --from=build /vtr-verilog-to-routing /vtr-verilog-to-routing/

FROM release-candidate AS all_quick_tests

WORKDIR /symbiflow-arch-defs/build/quicklogic/pp3/tests
RUN make all_quick_tests

FROM release-candidate AS all_ql_tests

WORKDIR /symbiflow-arch-defs/build/quicklogic/pp3/tests
RUN make all_ql_tests


FROM release-candidate AS release


# Build the container with something like:
# docker build . -t symbiflow-ql-slim-buster

# Run bash in the container interactively with something like:
# docker run -it symbiflow-ql-slim-buster bash

# Run any test case in the container running bash interactively.  For example, follow these steps to run a test case:
# cd /symbiflow-arch-defs/build/quicklogic/pp3/tests/quicklogic_testsuite/bin2seven
# make bin2seven-ql-chandalar_fasm


