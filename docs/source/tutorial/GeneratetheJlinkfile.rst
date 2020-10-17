


.. index::
   single: Generate the Jlink and OpenOCD file

Generate the Jlink and openOCD file
===================================


   JLINK file contains a script that can flash the board with the generated FPGA configuration via the JLink Connector
    |br| Syntax:

    .. code-block:: shell

        ql_symbiflow -compile -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package file> -s <SDC file> -dump jlink

    

   The output files dumped will be:
    |br| <TOP>.jlink ->jlink file.
    |br| 

    .. code-block:: shell

        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc -dump jlink
   |br| 
   |br| For details on how to configure the FPGA using the top.jlink file, refer to Download Binaries using Jlink SWD section in the `QuickFeather_UserGuide <https://github.com/QuickLogic-Corp/quick-feather-dev-board/blob/3b8566c83ed9df56282701710165a9afbb5c5a49/doc/QuickFeather_UserGuide.pdf>`_ pdf.
   |br| 

    openOCD is an on-chip debugger file
    |br| Syntax:

    .. code-block:: shell

        ql_symbiflow -compile -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package file> -s <SDC file> -dump openocd

    

   The output files dumped will be:
    |br| <TOP>.openocd ->openOCD file.
    |br| 

    .. code-block:: shell

        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc -dump openocd
   |br|    

.. |BR| raw:: html

   <BR/>


