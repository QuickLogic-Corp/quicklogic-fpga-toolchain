# Quicklogic FPGA Toolchain
Contains release packages for Quicklogic FPGA toolchain

This guide describes everything you need to set up your system to develop for QuickLogic FPGA Toolchain 

Symbilfow Installer currently is designed to run on the below Linux 64bit versions :

- CentOS : 7.3
- RHEL : 7.7
- Ubuntu : 20.04

## Overview of Requirements

To build and run sample example, you will need *Make* package

**make** Installation varies depending on your platform:

Platform   | Make  
---------- | -----
*Debian/Ubuntu* | `sudo apt-get install make`
*Fedora* | `sudo dnf install make` 

## The Symbiflow Package Location and Contents

Download [Symbiflow_v0.1.0](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v0.1.0/Symbiflow_v0.1.0.gz.run)

This package installs these toolchain :

- Yosys
- Yosys-Plugins
- VTR
- Iverilog
- Architecture definitions installation


```bash
export SYM_INSTALL_PATH=*specify the installpath*
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
```bash
cd $SYM_INSTALL_PATH/symbiflow-arch-defs/quicklogic/tests/counter_16bit
ql_symbiflow -compile -d ql-eos-s3 -k pd64 -v counter_16bit.v -t top -p counter_16bit.pcf -dump header 

```

For more details on the symbiflow options refer the tutorial guide:
[Symbiflow Tutorial](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/files/4717066/Symbiflow_Installation_Guide_and_Tutorial.pdf)


