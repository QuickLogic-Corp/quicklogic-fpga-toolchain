


.. index::
   single: Performing the Post-Layout Simulation (verifying the configuration bits)

Performing the Post-Layout Simulation (verifying the configuration bits)
========================================================================


    The testbench is present at:
    |br|        *<Install_Path>*/install/tests/counter_16bit/
    |br|  The post-layout design netlist is present at:
    |br|        *<Install_Path>*/install/counter_16bit/top_bit.v
    |br|  The primitive file library file is present at:
    |br|         *<Install_Path>*/conda/share/yosys/quicklogic/cells_sim.v

Performing the Post-Layout Timing Simulation (With SDF)
=======================================================

    The testbench is present at:
    |br|        *<Install_Path>*/install/tests/counter_16bit/
    |br| The post-layout design netlist is present at:
    |br|        *<Install_Path>*/install/counter_16bit/build/top_post_synthesis.v
    |br| The SDF file is present at:
    |br|         *<Install_Path>*/install/counter_16bit/build/top_post_synthesis.sdf
    |br|  The primitive file library file is present at:
    |br|         *<Install_Path>*/install/share/techmaps/quicklogic/techmap/cells_sim.v
    |br| The ram primitive file is present at:
    |br|         *<Install_Path>*/install/share/arch/ql-eos-s3_wlcsp/cells/ram_sim.v
    |br| 

 To perform a post-layout simulation:
 |br|
 |br| 1.Perform a post-layout simulation of the Verilog code using your HDL simulator of choice.
 |br| 2.View the simulation results in the Waveform/ Data Analyzer and verify.

.. |BR| raw:: html

   <BR/>


