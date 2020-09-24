Welcome to QuickLogic-FPGA-Toolchain's documentation!
=====================================================


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

`Software Requirements <https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain>`_

.. toctree::
   :maxdepth: 3

   tutorial/InstallingSymbiflowonLinux
   tutorial/SymbiflowDesignflow
   tutorial/Rundesignflowonasimplecoun
   tutorial/HardwareLimitationsandOnline


S3B Hardmacro User Guide
========================
This provides the details of in-built RAMs/FIFOs and Multipliers in S3B and their usage in the user design.

.. toctree::
   :maxdepth: 3

   ram/S3BDeviceHardmacroResources
   ram/RAMUsage
   ram/FIFOUsage
   ram/MultiplierUsage
   ram/DesignexampleUsingSRAMs
   ram/DesignexampleUsingFIFOs



.. |BR| raw:: html

   <BR/>


.. |U12b| unicode:: U+0000C
   :trim:
.. |U13b| unicode:: U+0000D
   :trim:
.. |U174l| unicode:: U+000AE
   :ltrim:

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
