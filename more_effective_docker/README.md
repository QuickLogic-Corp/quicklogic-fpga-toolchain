# Using the FPGA Toolchain effectively with Docker

Aiming at end users of the QF board for development, using M4 + FPGA, it would probably be easier to use the FPGA Toolchain, if we combine it with Docker.
It would be easier to switch between versions of the toolchain, and is equivalent to a new installation with the installer as well, while providing a way to prevent dependencies of the toolchain to become a problem to maintain, as in different versions of the toolchain may have 

## Dockerfile

The current Dockerfile (Dockerfile.use-installer) - has one problem, in that the installer is being run with root user, and hence we cannot use bind mounts to the host system to effectively use it. With bind mounts, we can have the qorc-sdk or gateware in the host system, and use the toolchain to build it, and the outputs are available in the host system just as if we used a locally installed FPGA toolchain.
With the current Dockerfile based image, if we use bind mounts, then the files/dirs created will be having root as owner and access permissions locked as well, and current user in the host system cannot use it, so it is ok for testing the installation, but not for usage by the end user or developer.

Hence, it would be good to modify it so that the current user UID, GID are passed in to the build, and the actual installation of the toolchain happens under the current user, effectively making it equivalent to a local installation.
```
...
# make /bin/sh symlink to bash instead of dash:
RUN echo "dash dash/sh boolean false" | debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

# MOD 1. add ARGs so that these can be passed in while doing a docker build, the following will be default values
# TAG should refer to the Symbiflow Toochain Version tag: for e.g. v1.2.0
ARG TAG=v1.2.0
ARG USER=docker
ARG UID=1000
ARG GID=1000
# default password for user
ARG PW=docker

RUN useradd -m ${USER} --uid=${UID} && echo "${USER}:${PW}" | \
      chpasswd

ENV INSTALL_DIR=/opt/symbiflow/eos-s3/$TAG

# MOD 2: create dir and chown to local user
RUN mkdir /opt/symbiflow
RUN chown ${USER} /opt/symbiflow

# MOD 3: become local user for installation
USER ${UID}:${GID}
WORKDIR /home/${USER}

# continue with installation as before
RUN wget https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/download/$TAG/Symbiflow_$TAG.gz.run

...
```

For full Dockerfile refer to **Dockerfile.use-installer-user**

## Building the Docker image

As the current user, the image can be built with:
```
docker build --build-arg USER=$USER \
         --build-arg UID=$UID \
         --build-arg GID=$GID \
         --build-arg PW=password \
         --build-arg TAG=v1.2.0 \
         -t ql_symbiflow_user:v1.2.0 \
         -f Dockerfile.use-installer-user\
         .
```

The docker tag `ql_symbiflow_user:1.2.0` can be modified as per needs.
Ideally, it would be great if the Symbiflow Toolchain version can be `1.2.0` rather than `v1.2.0` so we can use the same for both the docker image tag, as well as the toolchain version.
This (example) build script is at: **docker-ql-symbiflow-build-with-current-user.sh**
For other versions, TAG and the docker -t value will change.

## Using the Docker image

For the most convenient method of using docker images as a "portable toolchain", while having the input sources on the host system, and the build outputs on the host system as well, we have a few things we set to make it painless:
1. we use bind mounts, to map the host system sources directory to the docker container.
2. we map the current user to the docker container, and run as the same user
3. we provide a method to directly pass in commands to the `docker run` so that the container spins up, executes the toolchain process, generates output and exits on its own

For our FPGA toolchain, as an example, assume that we have the FPGA designs in the following location:
`~/work/quicklogic/fpga`
we have 2 examples copied here, one from the toolchain tests, and one from qorc-sdk.
`counter_16bit`
`fpga_helloworldhw`
Both of these are in the **example_fpga_designs**

We need an entrypoint for the docker image, which is convenient to be defined as bash script:
```
#!/bin/bash

source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
conda activate

ql_symbiflow $@
```

This example entrypoint is at **docker-ql-symbiflow-entrypoint.sh**

Now, using this entrypoint, and adding bind mount + user mapping, we can do:
```
docker run -it --rm \
--volume="/home/$(id -un)/work:/home/$(id -un)/work:rw" \
--volume="/etc/group:/etc/group:ro" \
--volume="/etc/passwd:/etc/passwd:ro" \
--volume="/etc/shadow:/etc/shadow:ro" \
--user $(id -u):$(id -g) \
-e USER=$(id -un) \
-e HOME=/home/$(id -un) \
--entrypoint=./docker-ql-symbiflow-entrypoint.sh \
ql_symbiflow_user:v1.2.0 \
-compile -src work/quicklogic/fpga/fpga_helloworldhw -d ql-eos-s3 -P PU64 -v helloworldfpga.v -t helloworldfpga -p quickfeather.pcf -dump header
```

We can condense the fixed parts into a sh script like so
```
docker run -it --rm \
--volume="/home/$(id -un)/work:/home/$(id -un)/work:rw" \
--volume="/etc/group:/etc/group:ro" \
--volume="/etc/passwd:/etc/passwd:ro" \
--volume="/etc/shadow:/etc/shadow:ro" \
--user $(id -u):$(id -g) \
-e USER=$(id -un) \
-e HOME=/home/$(id -un) \
--entrypoint=./docker-ql-symbiflow-entrypoint.sh \
ql_symbiflow_user:v1.2.0 \
$@
```
This (example script) is at **docker-ql-symbiflow-run-compile.sh**

and use it to compile any FPGA design using :
```
docker-ql-symbiflow-run-compile.sh -compile -src work/quicklogic/fpga/fpga_helloworldhw -d ql-eos-s3 -P PU64 -v helloworldfpga.v -t helloworldfpga -p quickfeather.pcf -dump header
```
and
```
docker-ql-symbiflow-run-compile.sh -compile -src work/quicklogic/fpga/counter_16bit -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p counter_16bit.pcf -dump header
```
which is equivalent to when using the local installation.

There is more work needed to think about streamlining this process, to make it simpler for an end user to use.

As it is currently, an end user will do the following steps to setup:
1. clone the repo and cd into this directory
2. build the docker image using : `docker-ql-symbiflow-build-with-current-user.sh`
   change the TAG and the docker -t value to a different version as required (currently v1.2.0)
3. use the `docker-ql-symbiflow-run-compile.sh` to build FPGA designs
   change the bind mounts as needed
   currently, it binds ~/work of host to ~/work of the docker container
   examples:
`docker-ql-symbiflow-run-compile.sh -compile -src work/quicklogic/fpga/counter_16bit -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p counter_16bit.pcf -dump header`
4. the build output of the toolchain will be directly accessible in the host system, and the user can use these to flash the image etc.

## Test it out (has repetitions from the description)
You can take the current scripts for a test drive quickly and see the usability and possible improvements.
1. clone the repo, cd into this dir
2. build the docker image using : `docker-ql-symbiflow-build-with-current-user.sh`
3. copy the example fpga designs from `example_fpga_designs` to ~/work/quicklogic/fpga
   create the dir ~/work/quicklogic/fpga if it doesn't exist
4. compile the designs using:
```
docker-ql-symbiflow-run-compile.sh -compile -src work/quicklogic/fpga/fpga_helloworldhw -d ql-eos-s3 -P PU64 -v helloworldfpga.v -t helloworldfpga -p quickfeather.pcf -dump header
```
and
```
docker-ql-symbiflow-run-compile.sh -compile -src work/quicklogic/fpga/counter_16bit -d ql-eos-s3 -P pd64 -v counter_16bit.v -t top -p counter_16bit.pcf -dump header
```


## TODO
1. make the bind mounts easier/more dynamic to use with the help of environment variables
2. method to use the docker image like above to execute FPGA compilation, equivalent to the usage of a local installation of the ql_symbiflow toolchain in the qorc-sdk as a proof-of-possibility
3. ensure that the sh scripts can be invoked from other paths as well
