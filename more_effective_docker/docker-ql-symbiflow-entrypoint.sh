#!/bin/bash

#export INSTALL_DIR="/opt/symbiflow/eos-s3/v1.2.0"
#export PATH="$INSTALL_DIR/install/bin:$INSTALL_DIR/install/bin/python:$PATH"
source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
conda activate

# execute the help command to display the help
#ql_symbiflow -h

ql_symbiflow $@
