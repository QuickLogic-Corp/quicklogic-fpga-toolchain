# Dockerfile builds the quicklogic-fpga-toolchain from source, as described in
#   2) Compile from source code and run example 
# of the instructions here:
https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain

# Build and tag the container with something like:
# docker build . -t symbiflow-ql-slim-buster

# Run bash in the container interactively with something like:
# docker run -it symbiflow-ql-slim-buster bash


# The old Dockerfile that built a container from Quicklogic's released installer
# has been renamed to Dockerfile.use-installer
# Below are the Instructions on how to build a container from it.
# dockerfile-symbiflow-ql/Dockerfile.use-installer
A Dockerfile that builds a symbiflow container including iverilog, yosys, vtr, and
gtkwave targeting Quicklogic FPGAs.  See the Quicklogic repo for more info on how 
to use this.

https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain

You can build and tag the symbiflow-ql container with
docker build . -f Dockerfile.use-installer -t symbiflow-ql

In order to view the gtkwave program, the easiest (but not the safest) thing 
to do is allow x connections:
xhost +

docker run -it -e DISPLAY=$DISPLAY -v "/tmp/.X11-unix:/tmp/.X11-unix" symbiflow-ql bash

When you are finished, it would be wise to disallow x connections:
xhost -

One resource I found for running GUI programs under Docker:
http://wiki.ros.org/docker/Tutorials/GUI

# TODO
# The directory structure of these two containers should match.
#
# The Dockerfile that builds the container and builds the tools
# from source should also package up an installer that matches Quicklogic's installer
#
# Use github actions to build the container, and under it the quicklogic tools
# and installer, run tests in the container, and run tests in a container built
# from the installer.