


.. index::
   single: Running pack, Place and Route tools

Running pack, Place and Route tools
===================================
    

   The eblif file generated during the synthesis is used for pack, place and route along with device information, pcf and the sdc file.
    |br| Syntax:

    .. code-block:: none

        ql_symbiflow -compile -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package file> -s <SDC file>


   The output files dumped will be:
    |br| *<TOP>*.net : Once packing is complete.
    |br| *<TOP>*.place : Placer file from VPR
    |br| *<TOP>*.route |U160l|  : Router file from VPR
    |br| 
    |br| One can refer to the pack.log, placer.log, router.log for more information related to each tool.

    
    .. code-block:: shell

        cd <INSTALL_PATH>/quicklogic-arch-defs/tests/counter_16bit
        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc

   The above command will also run synthesis if it was not run before.

   To Generate Various files during compile, use the below options
   Common command with just output file change:

    .. code-block:: shell

        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc -dump jlink/post_verilog/header


   To Generate the Post-Layout Verilog file


    This is the Verilog file used for the functional simulation to verify the Place and Route output.
    |br| 
    |br| Syntax:

    .. code-block:: shell

        ql_symbiflow -compile -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package file> -s <SDC file> -dump post_verilog


   The output files dumped will be:

    top_bit.v : Post layout Verilog file (for verifying the configuration bits)
    |br| top_post_synthesis.v : Post layout Verilog file (for timing simulation)
    |br| top_post_synthesis.sdf : SDF file (for timing simulation)

    
    .. code-block:: shell

        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc -dump post_verilog


   The Timing analysis refer the files *report_timing.hold.rpt, report_timing.setup.rpt and top.log*  inside the build folder

    For the counter design below is the timing report from the top.log file:
    |br|
    |br| *Hold Worst Negative Slack (hWNS): 0 ns*
    |br| *Hold Total Negative Slack (hTNS): 0 ns*
    |br| *Setup Worst Negative Slack (sWNS): -35.2295 ns*
    |br| *Setup Total Negative Slack (sTNS): -1062.29 ns*
    |br| *Final critical path: 35.2295 ns, Fmax: 28.3853 MHz*

.. |BR| raw:: html

   <BR/>


.. |U160l| unicode:: U+000A0
   :ltrim:
