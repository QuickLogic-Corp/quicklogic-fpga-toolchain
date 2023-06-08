#export INSTALL_DIR="/opt/symbiflow/eos-s3/v1.2.0"
#export PATH="$INSTALL_DIR/install/bin:$INSTALL_DIR/install/bin/python:$PATH"
source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
conda activate

# execute the help command to display the help
ql_symbiflow -h

# by default we are in the ~ dir.

#cd counter_16bit
ql_symbiflow 	
#cd -


#cd fpga_helloworldhw
ql_symbiflow -compile -src ~/fpga_helloworldhw -d ql-eos-s3 -P PU64 -v helloworldfpga.v -t helloworldfpga -p quickfeather.pcf -dump header
#cd -

conda deactivate

