# example docker build invocation
# PW can be set to anything, our runtime config will override this

docker build --build-arg USER=$USER \
         --build-arg UID=$UID \
         --build-arg GID=$GID \
         --build-arg PW=password \
         --build-arg TAG=v1.2.0 \
         -t ql_symbiflow_user:v1.2.0 \
         -f Dockerfile.use-installer-user\
         .
