
.. index::
   single: Generate the Programming files

Generate the Programming Files  
===============================

The technology mapped netlist and packing/placement/routing results produced by VPR contain the information needed to generate a device programming bitstreams.
These bitstreams can be used to generated these programming files for configuring the qlf_k4n8 eFPGA device:

1. Bitstream File
2. FourByte File
3. Force bit File

Bitstream File
~~~~~~~~~~~~~~~

Bitstream file is the default generated file by Symbiflow.


Four Byte File
~~~~~~~~~~~~~~~~~~

4Byte file is generated from the bitstreams and this file is needed for use with FCB based simulation


Force Bit File
~~~~~~~~~~~~~~

Force bit file can be used to directly force the config bits in the device
