# Quicklogic FPGA Toolchain
Contains release packages for Quicklogic FPGA toolchain

This guide describes everything you need to set up your system to develop for QuickLogic FPGA Toolchain 

This quickstart guide currently is designed to be used only Linux.

## Overview of Requirements

To build and run sample example, you will need below things:

1. Make

Installation varies depending on your platform:

Platform   | Make  
---------- | -----
*Debian/Ubuntu* | `sudo apt-get install make`
*Fedora* | `sudo dnf install make` 

This block of code regards the toolchain installation :

- Yosys
- Yosys-Plugins
- VTR
- Iverilog
- Architecture definitions installation

Download the Symbiflow_v0.1.0.gz.run present at : 
https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases

```bash
export SYM_INSTALL_PATH=/opt/ql_symbiflow
bash Symbiflow_v0.1.0.gz.run

#Enter the directory $SYM_INSTALL_PATH/symbiflow-arch-defs/install/bin
cd $SYM_INSTALL_PATH/symbiflow-arch-defs/install/bin

#Execute the following command to source the installation file
source ql_env

#Execute the help command to display the help
ql_symbiflow -h
```

## Run Example Design

The example designs are provided in separate directories at $SYM_INSTALL_PATH/symbiflow-arch-defs/quicklogic/tests:

1. `counter_16bit` - simple 16-bit up-counter . The design targets the the device ql-eos-s3 and package PD64.

To run the examples, run following commands:
cd $SYM_INSTALL_PATH/symbiflow-arch-defs/quicklogic/tests/counter_16bit
ql_symbiflow -compile -d ql-eos-s3 -k pd64 -v counter_16bit.v -t top -p counter_16bit.pcf -dump header 

```bash
