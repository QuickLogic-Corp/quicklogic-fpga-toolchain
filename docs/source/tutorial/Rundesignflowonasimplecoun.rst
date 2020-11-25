


.. index::
   single: Run design flow on a simple counter design

Run design flow on a simple counter design
==========================================



Setup environment


 To run any example, perform these steps once.

    .. code-block:: shell

        export INSTALL_DIR="specify the installpath"
        #adding symbiflow toolchain binaries to PATH
        export PATH="$INSTALL_DIR/quicklogic-arch-defs/bin:$INSTALL_DIR/quicklogic-arch-defs/bin/python:$PATH"
        source "$INSTALL_DIR/conda/etc/profile.d/conda.sh"
        conda activate

   Entering an HDL Design:

    1.Write a Verilog code for the design using any text editor.
    |br| 2.Verify the syntax.
    |br| 3.Create the simulation stimuli using any text editor.

   The code and testbench for the example design are present at:
   |br| *<Install_Path>*/quicklogic-arch-defs/tests/counter_16bit/


.. toctree::
   :maxdepth: 2

   PerformingthePreLayoutSimula
   PerformingDesignSynthesis
   RunningpackPlaceandRouteto
   PerformingthePostLayoutSimul
   GeneratetheJlinkfile
   GeneratetheASCIIheaderfilef
   GeneratetheBinaryFile
   PcfDescription

.. |BR| raw:: html

   <BR/>


