


.. index::
   single: S3B Device:

S3B Device
==========
 Hardmacro Resources

  * RAMs
    |br| - 8 blocks of 8K bits

  * FIFO
    |br| - 8 in-build FIFO controllers
    |br| - Can be configured into FIFOs using above RAM blocks

  * Multipliers
    |br| - 2 (32X32) in-built multipliers  


.. index::
   single: RAM Features:

RAM Features
------------

  * 8Kbits/RAM
  * X8, x16 and x32 data bus width 
  * Independent programmability of read and write data bus widths 
  * Asynchronous clocks
  * Supports 2 RAM block vertical or horizontal concatenation((i.e. 16Kbits RAM combining 2 8Kbits RAM Blocks)
  * Supports clock disabling during idle operation


.. index::
   single: FIFO Features:

FIFO Features
-------------

  * X8, x16 and x32 data bus width 
  * Configurable Synchronous/Asynchronous operation 
  * Supports 2 RAM block vertical or horizontal concatenation((i.e. 16Kbits RAM combining 2 - 8Kbits RAM Blocks)
  * Independent programmability of data bus width on PUSH and POP side
  * Switchable clock domain between PUSH and POP side during asynchronous operation
  * Supports clock disabling during idle operation
  * Asynchronous Reset (aside from the synchronous FLUSH) going to the pointers


.. index::
   single: Multiplier Features:

Multiplier Features
-------------------

  * 2 (32-bit) Multiplier
  * Can be configured as 4 16-bit multipliers
  * Signed multiplier
  * Supports Latched input

.. index::
   single: Macro Usage and examples:
  
Macro Usage and examples
------------------------


.. toctree::
   :maxdepth: 2

   RAMUsage
   FIFOUsage
   MultiplierUsage
   DesignexampleUsingSRAMs
   DesignexampleUsingFIFOs


.. |BR| raw:: html

   <BR/>
