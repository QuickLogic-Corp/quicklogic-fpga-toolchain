Quicklogic FPGA Toolchain
=========================

Contains SymbiFlow toolchain release packages for Quicklogic FPGAs

This guide describes everything you need to set up your system to
develop for QuickLogic FPGA Toolchain. Currently, the SymbiFlow
Installer runs only on Linux 64bit.

Note:  Place a request for the installers that support QLF-K4N8 and QLF-K6N10.
For EOS-S3 devices, the Release tag has installer which can be downloaded. 

Symbiflow supports these QuickLogic devices - QLF-K4N8, QLF-K6N10 and EOS-S3

For more details on the symbiflow options refer the tutorial guide: `Symbiflow_Tutorial <https://quicklogic-quicklogic-fpga-toolchain.readthedocs-hosted.com/en/latest/index.html>`_

Ways to run Symbiflow on these devices are explained in the following sub-sections:

QLF-K4N8/QLF-K6N10 Device:
==========================

Below are some ways to run SymbiFlow for QLF-K4N8/QLF-K6N10 Devices:

.. _1-run-an-installer-and-run-an-example:

1) Run an installer and run an example
----------------------------------------------------------



.. _2-compile-from-source-code-and-run-example:

2) Compile from source code and run example
-------------------------------------------

This release package contains the following GitHub repositories that are
compiled to create this package. 

You may use the following command to get the source, compile and install
it:

::

   #Checkout *symbiflow-arch-defs* repository (https://github.com/QuickLogic-Corp/symbiflow-arch-defs.git), branch: **master**. 
   git clone https://github.com/QuickLogic-Corp/symbiflow-arch-defs.git 
   cd symbiflow-arch-defs
   make env
   cd build;make all_conda
   
   #Run any test case in the current terminal window. For example, follow these steps to run a test case:
   cd build/quicklogic/<device>/tests/design_flow/counter_16bit
   #For qlf_k4n8
   make counter_16bit-umc22-adder_route
   #For qlf_k6n10
   make counter_16bit-gf12-adder_route



EOS-S3 Device:
==============

Below are some ways to run SymbiFlow for EOS-S3 Device:

1) Run an installer and run an example
2) Compile from source code and run example
3) Run SymbiFlow in a container

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
`Symbiflow_v1.3.2 <https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v1.3.2/Symbiflow_v1.3.2.gz.run>`__

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
  bash Symbiflow_v1.3.2.gz.run

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
compiled to create this package. 

**Note: Refer the repositories read.md pages for the prerequisites to build.**

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
-------------------------------------------

The qorc-sdk project from Quicklogic's github page contains good examples for running the qorc tools to
create hardware and FPGA gateware for the quickfeather development kit.  
https://github.com/QuickLogic-Corp/qorc-sdk

A quick way to get started without installing any tools is to use a docker container.  Build your own 
container image from Dockerfile.use-installer with:

  ::

    docker build --build-arg TAG=v1.3.1 -f Dockerfile.use-installer . -t qorc:1.3.1

Or pull a prebuilt container image from github with:

  ::

    docker pull ghcr.io/thirsty2/quicklogic-fpga-toolchain/qorc:1.3.1
    docker tag ghcr.io/thirsty2/quicklogic-fpga-toolchain/qorc:1.3.1 qorc:1.3.1

If you have cloned the qorc-sdk project, you can use the container and build an example project.
Change to the qorc-sdk directory, and start bash in a qorc container with:

  ::

    cd qorc-sdk
    docker run -it --rm -v $(pwd):/home/ic/qorc-sdk qorc:1.3.1 bash
    source $INSTALL_DIR/conda/etc/profile.d/conda.sh
    conda activate
    cd qorc-sdk/qf_apps/qf_helloworldhw/GCC_Project
    make

You can use qfprog in a container to program the quickfeather hardware.
Instructions and a Dockerfile are here:
https://github.com/Thirsty2/qfprog

Or use pip3 to install the programming tool from the QuickLogic github page here:
https://github.com/QuickLogic-Corp/TinyFPGA-Programmer-Application


Hardware features that are not supported in this release
--------------------------------------------------------

-  IO registers: Usage of IO registers available in the IO block
   (Hardware)




