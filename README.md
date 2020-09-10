# Quicklogic FPGA Toolchain
Contains release packages for Quicklogic FPGA toolchain

This guide describes everything you need to set up your system to develop for QuickLogic FPGA Toolchain 
Symbiflow Installer currently is designed to run only on Linux 64bit

Below are the three ways user can run the symbiflow:
1) Run an installer and follow instructions to run example
2) Install conda step by step and run example
3) Compile from source code and run example

## 1) Run an installer and follow instructions to run example

Download [Symbiflow_v1.2.0](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/v1.2.0/Symbiflow_v1.2.0.gz.run)

This package installs these toolchain :

- Yosys
- Yosys-Plugins
- VTR
- iverilog
- Architecture definitions installation


```bash
#To Install
export INSTALL_DIR="specify the installpath"
bash Symbiflow_v1.2.0.gz.run

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
[Symbiflow_Tutorial](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/files/5199560/Symbiflow_Installation_Guide_and_Tutorial.pdf)

For details on the usage of RAM, FIFO and Multiplier blocks, refer to the following document:
[Ram_Fifo_Mult_User_Document](https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/files/5199568/S3B_Hardmacro_User_Guide.pdf)

## 2) Compile from source code and run example

This release package contains the following GitHub repositories that are compiled to create this package:
You may use the following command to get the source, compile and install it:
```bash
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

#Checkout *vpr* repository (https://github.com/QuickLogic-Corp/vtr-verilog-to-routing.git), branch: **blackbox_timing**.
git clone https://github.com/QuickLogic-Corp/vtr-verilog-to-routing -b blackbox_timing
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
```

## Hardware features that are not supported in this release
- IO registers: Usage of IO registers available in the IO block (Hardware) 
