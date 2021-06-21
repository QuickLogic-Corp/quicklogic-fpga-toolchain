


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

To set constraint for the IO
    .. code-block:: none
      
      set_io <port_name> <Package IO>

To set constraint for the clock port
    .. code-block:: none
      
      set_clk <clk_name> <port_name> 

clock names supported: clk[0], clk[1], clk[2], clk[3]      


For this csv file, the counter_16bit one can add these IO placements:

   .. code-block:: shell

      set_io enable user_IN_T[0]
      set_io reset user_IN_T[1]
      set_clk clk[0] clk
      set_io count[0] user_OUT_T[8]
      set_io count[1] user_OUT_T[9]
      set_io count[2] user_OUT_T[10]
      set_io count[3] user_OUT_T[11]
      set_io count[4] user_OUT_T[12]
      set_io count[5] user_OUT_T[13]
      set_io count[6] user_OUT_T[14]
      set_io count[7] user_OUT_T[15]
      set_io count[8] user_OUT_T[16]
      set_io count[9] user_OUT_T[17]
      set_io count[10] user_OUT_T[18]
      set_io count[11] user_OUT_T[19]
      set_io count[12] user_OUT_T[20]
      set_io count[13] user_OUT_T[21]
      set_io count[14] user_OUT_T[22]
      set_io count[15] user_OUT_T[23]


.. note:: > The pcf file support is only supported for the **QLF_K4N8**

.. |BR| raw:: html

   <BR/>


