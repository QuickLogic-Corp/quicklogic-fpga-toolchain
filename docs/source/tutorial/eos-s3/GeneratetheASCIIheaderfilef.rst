


.. index::
   single: Generate the ASCII header file format 

Generate the ASCII header file format 
======================================


  Ascii header file can be generated from the jlink or the .bit file.


    

   Syntax:

    .. code-block:: shell

        ql_symbiflow -compile -src <source complete path> -d <device> -t <top module name> -v <verilog files> -p <pcf file> -P <Package file> -s <SDC file> -dump header


   The output files dumped will be :
    |br| <TOP>_bit.h - *file generated from the bit file input*
    |br| 

    .. code-block:: shell

        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc  -dump header

    

   The generated header file can be used in M4 application program to load FPGA
    |br| 

   The output files can be dumped for all as: 

    .. code-block:: shell

        ql_symbiflow -compile -src $PWD -d ql-eos-s3 -t top -v counter_16bit.v -p chandalar.pcf -P PD64 -s counter_16bit.sdc  -dump header jlink post_verilog


.. |BR| raw:: html

   <BR/>


