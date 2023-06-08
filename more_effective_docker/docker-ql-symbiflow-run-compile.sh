#!/bin/bash


# this runs a docker image, replicating the user/group configuration of the host machine
# this resolves many of the perms settings while using the container.
# remember to:
# add mounted volumes for the source code etc.
# modify the image name to whatever you have on your host.

# -it interactive, tty
# --rm remove container once it exits, cleanup
# map the home dir for simplicity, can be removed but keeps it simpler to match container to host. we will revisit this soon.
# map the group, passwd and shadow files to reflect the user permissions on host system
# map the work folders as needed
# set the user in the container as the same one invoking the docker run
# set the env variable USER (required for android 7.x builds!)
# set the env variable HOME (not sure if this is needed, but good to define)
# finally pass in the args given to use, to the container to run $@
   
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



