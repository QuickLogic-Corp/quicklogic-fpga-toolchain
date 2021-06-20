


.. index::
   single: Performing the Post-Layout Simulation (verifying the configuration bits)

Performing the Post-Layout Simulation (verifying the configuration bits)
========================================================================
 Post layout Simulation using the configuration bits, uses the device configuration bit file *top_bit.v*

    The testbench for the counter design is present at:
    |br|        *<Install_Path>*/quicklogic-arch-defs/tests/counter_16bit/
    |br|
    |br|  The post-layout design netlist is present at:
    |br|        *<Install_Path>*/quicklogic-arch-defs/counter_16bit/top_bit.v
    |br|
    |br|  The primitive file library file is present at:
    |br|         *<Install_Path>*/conda/share/yosys/quicklogic/cells_sim.v

    .. note::  cells_sim.v : This file has the definition for predefined macros


Performing the Post-Layout Timing Simulation
============================================
 Post layout Timing simulation uses the SDF(Standard Delay Format) file.

    The testbench for the counter design is present at:
    |br|        *<Install_Path>*/quicklogic-arch-defs/tests/counter_16bit/
    |br|
    |br| The post-layout design netlist is present at:
    |br|        *<Install_Path>*/quicklogic-arch-defs/counter_16bit/build/top_post_synthesis.v
    |br|
    |br| The SDF file is present at:
    |br|         *<Install_Path>*/quicklogic-arch-defs/counter_16bit/build/top_post_synthesis.sdf
    |br|
    |br|  The primitive file library file is present at:
    |br|         *<Install_Path>*/quicklogic-arch-defs/share/techmaps/quicklogic/techmap/cells_sim.v
    |br|
    |br| The ram primitive file is present at:
    |br|         *<Install_Path>*/quicklogic-arch-defs/share/arch/ql-eos-s3_wlcsp/cells/ram_sim.v
    |br| 

 To perform a post-layout simulation:
    |br| - Perform a post-layout simulation of the Verilog code use iverilog. 
    |br| - View the simulation results in the Waveform/ Data Analyzer and verify.

    .. note::  cells_sim.v : This file has the definition for technology mapped macros
      |br| ram_sim.v : Has the ram definition


.. |BR| raw:: html

   <BR/>


