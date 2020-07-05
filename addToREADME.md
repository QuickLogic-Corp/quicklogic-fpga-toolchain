# dockerfile-symbiflow-ql
A Dockerfile that builds a symbiflow container including iverilog, yosys, vtr, and
gtkwave targeting Quicklogic FPGAs.  See the Quicklogic repo for more info on how 
to use this.

https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain

You can build and tag the symbiflow-ql container with
docker build . -t symbiflow-ql

In order to view the gtkwave program, the easiest (but not the safest) thing 
to do is allow x connections:
xhost +

docker run -it -e DISPLAY=$DISPLAY -v "/tmp/.X11-unix:/tmp/.X11-unix" symbiflow-ql bash

When you are finished, it would be wise to disallow x connections:
xhost -

One resource I found for running GUI programs under Docker:
http://wiki.ros.org/docker/Tutorials/GUI
