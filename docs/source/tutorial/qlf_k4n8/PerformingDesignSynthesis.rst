



.. index::
   single: Performing Design Synthesis

Performing Design Synthesis
===========================


   To perform a design synthesis:

    In SymbiFlow, the synthesis of Verilog files is performed with Yosys. Yosys parses Verilog files, applies basic optimizations, performs technological mapping to FPGA blocks, and generates JSON and EBLIF files for the place and route tool.

   Syntax:

    .. code-block:: shell

        ql_symbiflow -synth -src <source complete path> -d <device> -t <top module name> -v <verilog files>


    .. code-block:: shell

        cd <INSTALL_PATH>/quicklogic-arch-defs/share/symbiflow/tests/counter_16bit
    
   and run the below command:
   |br| 

    .. code-block:: shell

        ql_symbiflow -synth -d qlf_k4n8 -t top -v counter_16bit.v
   
   Output files for synthesis are:
   |br| <TOP>.eblif : netlist file for the design
   |br| <TOP>_synth.log : synthesis log information, refer this file for any issues during synthesis 
   |br| 
      |br|  Resource utilization in the top_synth.log of the counter:
      |br|
      |br|  *Number of wires:                23*
      |br|  *Number of wire bits:            68*
      |br|  *Number of public wires:         23*
      |br|  *Number of public wire bits:     68*
      |br|  *Number of memories:              0*
      |br|  *Number of memory bits:           0*
      |br|  *Number of processes:             0*
      |br|  *Number of cells:                48*
      |br|   *$_DFF_P_L                      16*
      |br|   *$lut:                          16*
      |br|   *adder_lut4:                    16*

    .. note:: > All the output log files will be dumped in {source path}/build folder
      |br| > -src command is optional if run from the same directory where source files are present.
 


|U160b| 

.. |BR| raw:: html

   <BR/>


.. |U160b| unicode:: U+000A0
   :trim:
