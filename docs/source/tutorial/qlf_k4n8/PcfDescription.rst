


.. index::
   single: PCF sample 

PCF Sample 
==========
  
The PCF file is for fix placing the IO to a particular IO location on the device.  
For qlf_k4n8 device, user needs to create a pin mapping csv (as defined in Pin Mapping section). The user-defined pin names can then be specified in the pcf file for IO placement.
Below mentioned CSV file(not part of package) corresponds to a pin-mapping defined for 24x24 device size for qlf_k4n8.

.. toctree::
   :maxdepth: 2
   
   qlf_k4n8-qlf_k4n8_umc22_24x24.csv.rst


|br| **Syntax:**

    .. code-block:: none
      
      set_io <port_name> <Package IO>


For this csv file, the counter_16bit one can add these IO placements:

   .. code-block:: shell

      set_io enable A2F_GPIO2_15
      set_io reset A2F_GPIO2_14
      set_io count(0) F2A_GPIO2_8
      set_io count(1) F2A_GPIO2_9
      set_io count(2) F2A_GPIO2_10
      set_io count(3) F2A_GPIO2_11
      set_io count(4) F2A_GPIO2_12
      set_io count(5) F2A_GPIO2_13
      set_io count(6) F2A_GPIO2_14
      set_io count(7) F2A_GPIO2_15
      set_io count(8) F2A_GPIO2_16
      set_io count(9) F2A_GPIO2_17
      set_io count(10) F2A_GPIO2_18
      set_io count(11) F2A_GPIO2_19
      set_io count(12) F2A_GPIO2_20
      set_io count(13) F2A_GPIO2_21
      set_io count(14) F2A_GPIO2_22
      set_io count(15) F2A_GPIO2_23


.. |BR| raw:: html

   <BR/>


