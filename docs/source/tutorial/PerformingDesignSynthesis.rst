


.. index::
   single: Performing Design Synthesis

Performing Design Synthesis
===========================


   To perform a design synthesis:

    In SymbiFlow, the synthesis of Verilog files is performed with Yosys. Yosys parses Verilog files, applies basic optimizations, performs technological mapping to FPGA blocks, and generates JSON and EBLIF files for the place and route tool.

   Syntax:

    .. code-block:: shell

        ql_symbiflow -synth -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package file> -s <SDC file>


    .. code-block:: shell

        cd <INSTALL_PATH>/quicklogic-arch-defs/tests/counter_16bit
    
   and run the below command:
   |br| 

    .. code-block:: shell

        ql_symbiflow -synth -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64
   
   Output files for synthesis are:
   |br| <TOP>.eblif : netlist file for the design
   |br| <TOP>_synth.log : synthesis log information, refer this file for any issues during synthesis 
   |br| 
    |br|  Resource utilization in the top_synth.log of the counter:
    |br|
    |br|  *Number of wires:                384*
    |br|  *Number of wire bits:            384*
    |br|  *Number of public wires:         382*
    |br|  *Number of public wire bits:     382*
    |br|  *Number of memories:               0*
    |br|  *Number of memory bits:            0*
    |br|  *Number of processes:              0*
    |br|  *Number of cells:                 67*
    |br|   *BIDIR_CELL                     18*
    |br|   *CLOCK_CELL                      1*
    |br|   *C_FRAG                          4*
    |br|   *GMUX_IP                         1*
    |br|   *Q_FRAG                         16*
    |br|   *T_FRAG                         27*


    .. note:: > All the output log files will be dumped in {source path}/build folder
      |br| > For pcf related information, please refer pcf sample
      |br| > -src command is optional if run from the same directory where source files are present.
 


|U160b| 

.. |BR| raw:: html

   <BR/>


.. |U160b| unicode:: U+000A0
   :trim:
