


.. index::
   single: Design flow

Design flow 
===========



Setup environment

To run the counter_16bit or any example, perform these steps once. Design flow will be covered using the counter_16bit design which is avaiable in the package. We will use the device QLF_K4N8 for this run. However the flow for the device QLF_K6N10 is similar except that it is supported only till place and route.

   .. code-block:: shell

      export INSTALL_DIR="specify the installpath"
      cd $INSTALL_DIR; source setup.sh
      
      OR

      #adding symbiflow toolchain binaries to PATH
      export PATH="$INSTALL_DIR/quicklogic-arch-defs/bin:$INSTALL_DIR/quicklogic-arch-defs/bin/python:$PATH"
      source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
      conda activate

   Entering an HDL Design:

    1. Write a Verilog code for the design using any text editor.
    |br| 2. Verify the syntax.
    |br| 3. Create the simulation stimuli using any text editor.

   The code and testbench for the example design are present at:
   |br| *<Install_Path>*/quicklogic-arch-defs/share/symbiflow/tests/counter_16bit/


.. toctree::
   :maxdepth: 2

   PerformingthePreLayoutSimula
   PerformingDesignSynthesis
   Pin-mapping
   RunningpackPlaceandRouteto
   PerformingthePostLayoutSimul
   GenerateProgrammingFiles
   PcfDescription

.. |BR| raw:: html

   <BR/>


