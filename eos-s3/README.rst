Quicklogic FPGA Toolchain
=========================

Contains SymbiFlow toolchain release packages for Quicklogic FPGAs

This guide describes everything you need to set up your system to
develop for QuickLogic FPGA Toolchain. Currently, the SymbiFlow
Installer runs only on Linux 64bit.

Below are some ways to run SymbiFlow:

1) Run an installer and run an example
2) Compile from source code and run example
3) Run SymbiFlow in a container


For more details on the symbiflow options refer the tutorial guide: `Symbiflow_Tutorial <https://quicklogic-fpga-tool-docs.readthedocs.io/en/latest/index.html>`_

For details on the usage of RAM, FIFO and Multiplier blocks, refer to
the following document:
`Ram_Fifo_Mult_User_Document <https://quicklogic-fpga-tool-docs.readthedocs.io/en/latest/ram/S3BDeviceHardmacroResources.html>`_


**NOTE:**

While running the compilation with the latest toolchain (v1.3.1), the following warning would be seen:

::

  fasm/fasm/parser/__init__.py:27: RuntimeWarning: 
  Falling back on slower textX parser implementation:
    ImportError: cannot import name 'tags' from 'fasm.parser' (/path/to/toolchain/install/quicklogic-arch-defs/tests/counter_16bit/fasm/fasm/parser/__init__.py)
  Please install all dependencies and reinstall with:
    pip uninstall
    pip install -v fasm
    '  pip install -v fasm'.format(e), RuntimeWarning)
  ['textx']

| This is due to recent changes in the `Symbiflow fasm <https://github.com/SymbiFlow/fasm>`_ which adds support for the :code:`antlr` parser in place of :code:`textx`.
| This is not a problem, and current installation will continue to use :code:`textx` as the parser, as with previous releases.
| :code:`antlr` installation requires a few extra steps, which needs to be integrated into the toolchain installation.
| This is not yet incorporated in the current install, and will be added in a future release.
| Manual Installation of :code:`antlr` can be done from the instructions at the `Symbiflow fasm <https://github.com/SymbiFlow/fasm>`_ readme.
|
| A brief of the steps for manual installation (optional), after toolchain installation is completed:

- Ensure :code:`conda activate` is executed

- Execute the following sequence

  ::

    cd $INSTALL_DIR
    git clone https://github.com/SymbiFlow/fasm.git
    cd fasm
    git submodule update --init
    sudo apt install cmake default-jre-headless uuid-dev libantlr4-runtime-dev
    make build
    python setup.py test

- If all goes well, run the below to test:

  ::

    python3 -c "import fasm.parser as p; print(p.available)"

  An output similar to below:

  ::
     
    ['antlr', 'textx']

  indicates that :code:`antlr` is now installed and available, and will be used as the default parser.

.. _1-run-an-installer-and-run-an-example:

1) Run an installer and run an example
----------------------------------------------------------

Download
`Symbiflow_v1.3.1 <https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v1.3.1/Symbiflow_v1.3.1.gz.run>`__

This package installs these toolchains :

-  Yosys
-  Yosys-Plugins
-  VTR
-  iverilog
-  Architecture definitions installation

Steps:

- Install

::

  export INSTALL_DIR="specify the installpath"
  bash Symbiflow_v1.3.1.gz.run

- Initialize

::

  export INSTALL_DIR="specify the installpath"
  export PATH="$INSTALL_DIR/quicklogic-arch-defs/bin:$INSTALL_DIR/quicklogic-arch-defs/bin/python:$PATH"
  source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
  conda activate

- Run help command

::
   
  ql_symbiflow -h

- Run Example Design

  The example designs are provided in separate directories at :code:`$INSTALL_DIR/quicklogic-arch-defs/tests` :

  1. :code:`counter_16bit` - simple 16-bit up-counter. The design targets the device ql-eos-s3 and package PD64.

   To run this example, run following commands:

   ::

     cd $INSTALL_DIR/quicklogic-arch-defs/tests/counter_16bit
     ql_symbiflow -compile -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p chandalar.pcf 


.. _2-compile-from-source-code-and-run-example:

2) Compile from source code and run example
-------------------------------------------

This release package contains the following GitHub repositories that are
compiled to create this package. Note: Refer the repositories read.md
pages for the prerequisites to build.

You may use the following command to get the source, compile and install
it:

::

   #Checkout *yosys* repository (https://github.com/QuickLogic-Corp/yosys.git), branch: **quicklogic-rebased**. 
   git clone https://github.com/QuickLogic-Corp/yosys.git -b quicklogic-rebased quicklogic-yosys
   cd quicklogic-yosys
   #compiling using gcc
   make config-gcc
   make install PREFIX='specify installation path'
   cd -

   #Checkout *yosys-symbiflow-plugins* (https://github.com/QuickLogic-Corp/yosys-symbiflow-plugins), branch: **ql-ios**.
   git clone https://github.com/QuickLogic-Corp/yosys-symbiflow-plugins -b ql-ios
   cd yosys-symbiflow-plugins
   export PATH='specify Yosys installation path as specified in PREFIX in previous step':$PATH
   make install
   cd -

   #Checkout *vpr* repository (https://github.com/SymbiFlow/vtr-verilog-to-routing.git), branch: **master**.
   git clone https://github.com/SymbiFlow/vtr-verilog-to-routing -b master
   cd vtr-verilog-to-routing
   make

   #Checkout *symbiflow-arch-defs* repository (https://github.com/QuickLogic-Corp/symbiflow-arch-defs.git), branch: **quicklogic-upstream-rebase**. 
   git clone https://github.com/QuickLogic-Corp/symbiflow-arch-defs.git -b quicklogic-upstream-rebase
   export YOSYS='path to Yosys binary, installed in first step'
   export VPR='path to vpr binary built'
   export GENFASM='path to genfasm binary built'
   cd symbiflow-arch-defs
   make env
   cd build
   make all_conda

   #Run any test case in the current terminal window. For example, follow these steps to run a test case:
   cd quicklogic/pp3/tests/quicklogic_testsuite/bin2seven
   make bin2seven-ql-chandalar_fasm

.. _3-run-symbiflow-in-a-container:

3) Run SymbiFlow in a container
-------------------------------

Containers provide isolated environments, similar to VMs, but lighter
weight, and with performance closer to the native machine they run on.
Containers start quickly from an efficient layered image which provides
an identical environment each time the container starts. A great place
to start is the Docker website, which provides links to tutorials and
documentation:

https://www.docker.com/why-docker

This project uses containers to build Symbiflow automatically whenever a
change is pushed to Quicklogic/quicklogic-fpga-toolchain. With each
successful build, a container image is pushed as a github package, and
may be pulled or run directly by a container runtime such as Docker.
Such images are useful for developing continuous integration of FPGA
projects. The act of building and testing them automatically through
github actions also provides assurances that what is checked into the
github source repositories can be built and executed. Below are some of
the options for using containers to run or build SymbiFlow for
Quicklogic development.

.. _option-a-build-a-container-image-locally-from-dockerfileuse-installer:

Option A) Build a container image locally from Dockerfile.use-installer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

| The Dockerfile.use-installer in this repo builds a SymbiFlow container
  from a released installer.
| You can build and tag the symbiflow-ql container with:

::

   docker build . -f Dockerfile.use-installer -t symbiflow-ql

In order to view the gtkwave program, the easiest (but not the safest)
thing to do is allow x connections:

::

   xhost +

   docker run -it -e DISPLAY=$DISPLAY -v "/tmp/.X11-unix:/tmp/.X11-unix" symbiflow-ql bash

   or run a prebuilt container automatically built from the installer by github actions:

   docker run -it -e DISPLAY=$DISPLAY -v "/tmp/.X11-unix:/tmp/.X11-unix" docker.pkg.github.com/thirsty2/quicklogic-fpga-toolchain/symbiflow-ql:1.2.0.0 bash

Inside your running docker container, try some of the commands from the
tutorial:
`Symbiflow_Tutorial <https://quicklogic-fpga-tool-docs.readthedocs.io/en/latest/index.html>`__

::

   source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
   conda activate

   #Execute the help command to display the help
   ql_symbiflow -h

   cd $INSTALL_DIR/quicklogic-arch-defs/tests/counter_16bit

   # Use iverilog to simulate the design
   iverilog -o my_design counter_16bit.v counter_16bit_tb.v
   vvp my_design

   # use gtkwave to view the results (assumes you have allowed x connections, and have an xserver running)
   gtkwave counter_16bit_tb.vcd

   ql_symbiflow -compile -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p chandalar.pcf 

When you are finished, it would be wise to disallow x connections:

::

   xhost -

Option B) Build a container image locally from Dockerfile
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Dockerfile in this repo builds SymbiFlow from source. You can create
and tag a local image with a Docker command like:

::

   docker build . -t symbiflow-ql-slim-buster

Then you can run the container interactively with a docker command like:

::

   docker run -it symbiflow-ql-slim-buster bash

From your bash session in the container, try:

::

   #Run any test case in the current terminal window. For example, follow these steps to run a test case:
   cd /symbiflow-arch-defs/build/quicklogic/pp3/tests/quicklogic_testsuite/bin2seven
   make bin2seven-ql-chandalar_fasm

   #Or try:
   cd /symbiflow-arch-defs/build/quicklogic/pp3/tests
   make all_quick_tests

Option C) Use a container image that is built automatically by a github action workflow
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

See the 'packages' links for the Docker command to pull a Symbiflow
container image, or use it as the basis of a new container.

You can run bash interactively inside of a prebuilt SymbiFlow container
using a docker command like this:

::

   docker run -it docker.pkg.github.com/quicklogic-corp/quicklogic-fpga-toolchain/symbiflow-ql-src:latest bash

From your bash session in the container, try:

::

   #Run any test case in the current terminal window. For example, follow these steps to run a test case:
   cd /symbiflow-arch-defs/build/quicklogic/pp3/tests/quicklogic_testsuite/bin2seven
   make bin2seven-ql-chandalar_fasm

   #Or try:
   cd /symbiflow-arch-defs/build/quicklogic/pp3/tests
   make all_quick_tests

Hardware features that are not supported in this release
--------------------------------------------------------

-  IO registers: Usage of IO registers available in the IO block
   (Hardware)
