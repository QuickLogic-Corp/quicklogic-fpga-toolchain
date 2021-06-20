Welcome to QuickLogic-FPGA-Toolchain's documentation for QuickLogic Devices!
============================================================================


Symbiflow Installation Guide and Tutorial
=========================================
This provides the details of the Symbiflow package installation and the various commands supported by the tool. 
It covers how to install Symbiflow on the Linux operating systems and the usage of the tool by going over a simple example.

|U12b| 
            

System Requirements

+------------------------+-------------------------------------------------+-----------------------------------------------+-----------------------------------------------+
|**Requirements** |U13b| |**Linux** |U13b|                                 |**CentOS** |U13b|                              |**Ubuntu** |U13b|                              |
+========================+=================================================+===============================================+===============================================+
|**Processor** |U13b|    |Intel Xeon |U174l|  or similar processors |U13b| |Intel Xeon or similar |U13b| processors |U13b| |Intel Xeon or similar |U13b| processors |U13b| |
+------------------------+-------------------------------------------------+-----------------------------------------------+-----------------------------------------------+


|br| Ram Size: 2 GB or more
|br| Free Hard-Disc space: 5GB or more

.. toctree::
   :maxdepth: 3

   tutorial/InstallingSymbiflowonLinux


QLF-K4N8/QLF-K6N10 Device
=========================
This provides details about running designs using qlf-k4n8/qlf-k6n10 device on Symbiflow

.. toctree::
   :maxdepth: 3
   
   tutorial/qlf_devices/SymbiflowDesignflow
   tutorial/qlf_devices/Commandssupported
   tutorial/qlf_devices/Rundesignflowonasimplecoun
   tutorial/qlf_devices/RAM_DSPinfer
   tutorial/qlf_devices/OnlineReferences


S3B Device
==========
This provides the details of running designs and in-built RAMs/FIFOs/Multipliers in S3B.

.. toctree::
   :maxdepth: 3

   tutorial/eos-s3/SymbiflowDesignflow
   tutorial/eos-s3/Rundesignflowonasimplecoun
   tutorial/eos-s3/HardwareLimitationsandOnline
   tutorial/eos-s3/ram/S3BDeviceHardmacroResources


.. |BR| raw:: html

   <BR/>

.. |U12b| unicode:: U+0000C
   :trim:
.. |U13b| unicode:: U+0000D
   :trim:
.. |U174l| unicode:: U+000AE
   :ltrim:


