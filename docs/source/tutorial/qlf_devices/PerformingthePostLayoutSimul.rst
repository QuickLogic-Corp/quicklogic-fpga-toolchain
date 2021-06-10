


.. index::
   single: Performing the Post-Layout Simulation (verify the post layout verilog file)


Performing the Post-Layout Timing Simulation
============================================

 Post layout Timing simulation uses the SDF(Standard Delay Format) file.

    The testbench for the counter design is present at:
    |br|        *<Install_Path>*/quicklogic-arch-defs/share/symbiflow/tests/counter_16bit/
    |br|
    |br| The post-layout design netlist is present at:
    |br|        *<Install_Path>*/quicklogic-arch-defs/share/symbiflow/counter_16bit/build/top_post_synthesis.v
    |br|
    |br| The SDF file is present at:
    |br|         *<Install_Path>*/quicklogic-qrch-defs/share/symbiflow/counter_16bit/build/top_post_synthesis.sdf
    |br|
    |br|  The primitive file library file is present at:
    |br|         *<Install_Path>*/quicklogic-arch-defs/share/symbiflow/techmaps/quicklogic/techmaps/*<Family>*/cells_sim.v
    |br|
    |br| 

 To perform a post-layout simulation:
    |br| - Perform a post-layout simulation of the Verilog code use iverilog. 
    |br| - View the simulation results in the Waveform/ Data Analyzer and verify.

    .. note:: > cells_sim.v : This file has the definition for technology mapped macros
      |br|    > Supported only for qlf_k4n8



.. |BR| raw:: html

   <BR/>


