# Quicklogic FPGA Toolchain
Contains release packages for Quicklogic FPGA toolchain

This guide describes everything you need to set up your system to develop for QuickLogic FPGA Toolchain 

Symbiflow Installer currently is designed to run only on Linux 64bit

## Overview of Requirements

To build and run sample example, you will need the below package :
- *gtkwave* [Install guide](http://gtkwave.sourceforge.net/gtkwave.pdf)

## The Symbiflow Package Location and Contents

Download [Symbiflow_v0.1.0](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v0.1.0/Symbiflow_v0.1.0.gz.run)

This package installs these toolchain :

- Yosys
- Yosys-Plugins
- VTR
- iverilog
- Architecture definitions installation


```bash
#To Install
export INSTALL_DIR="specify the installpath"
bash Symbiflow_v0.1.0.gz.run

#To Run example
export INSTALL_DIR="specify the installpath"
export PATH="$INSTALL_DIR/install/bin:$INSTALL_DIR/install/bin/python:$PATH"
source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
conda activate

#Execute the help command to display the help
ql_symbiflow -h
```

## Run Example Design

The example designs are provided in separate directories at $INSTALL_DIR/install/tests:

1. `counter_16bit` - simple 16-bit up-counter . The design targets the the device ql-eos-s3 and package PD64.

To run the examples, run following commands:
```bash
cd $INSTALL_DIR/install/tests/counter_16bit
ql_symbiflow -compile -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p counter_16bit.pcf 

```

For more details on the symbiflow options refer the tutorial guide:
[Symbiflow_Tutorial](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/files/4760374/Symbiflow_Installation_Guide_and_Tutorial.pdf)

For details on the usage of RAM, FIFO and Multiplier blocks, refer to the following document:
[Ram_Fifo_Mult_User_Document](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/files/4751774/S3B_Hardmacro_User_Guide.pdf)
