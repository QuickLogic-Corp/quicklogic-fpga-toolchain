


.. index::
   single: Running Pack, Place and Route Tools

Running Pack, Place and Route Tools
===================================
    

   The eblif file generated during the synthesis is used for pack, place and route along with device information, pcf and the sdc file.
   |br| User needs to provide the csv, sdc and pcf file. These are optional input files. CSV and pcf file is not present in the test folder.
   |br|
   |br| Syntax:

    .. code-block:: none

     ql_symbiflow -compile -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package CSV file> -s <SDC file> -pnr_corner <fast/slow>

    
    The output files dumped will be:
    |br| *<TOP>*.net : Once packing is complete.
    |br| *<TOP>*.place : Placer file from VPR
    |br| *<TOP>*.route |U160l|  : Router file from VPR
    |br| 
    |br| One can refer to the pack.log, placer.log, router.log for more information related to each tool.

    
    .. code-block:: shell

        cd <INSTALL_PATH>/quicklogic-arch-defs/share/symbiflow/tests/counter_16bit
        ql_symbiflow -compile -src $PWD -d qlf_k4n8 -t top -v counter_16bit.v -s counter_16bit.sdc

   The above command will also run synthesis if it was not run before.

   If user wants to do IO fix placement, then pcf and csv files need to be specified in the following manner:

    .. code-block:: shell

        cd <INSTALL_PATH>/quicklogic-arch-defs/share/symbiflow/tests/counter_16bit
        ql_symbiflow -compile -src $PWD -d qlf_k4n8 -t top -v counter_16bit.v -s counter_16bit.sdc -pcf counter_16bit.pcf -P pinmap_qlf_k4n8_umc22.csv -pnr_corner fast


   The Timing analysis refer the files *report_timing.hold.rpt, report_timing.setup.rpt and top.log*  inside the build folder

    For the counter design below is the timing report from the top.log file:
    
    .. code-block:: none
    
        Hold Worst Negative Slack (hWNS):    0 ns
        Hold Total Negative Slack (hTNS):    0 ns
        Setup Worst Negative Slack (sWNS):   -2.91 ns
        Setup Total Negative Slack (sTNS):   -162.424 ns
        Final critical path: 2.91 ns, Fmax:  343.643 MHz

    .. note:: Options : -P, -s, -p, -pnr_corner are only available for **QLF_K4N8**
    
.. |BR| raw:: html

   <BR/>


.. |U160l| unicode:: U+000A0
   :ltrim:
