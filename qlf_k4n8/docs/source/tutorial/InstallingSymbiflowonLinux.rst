


.. index::
   single: Installing Symbiflow on Linux

Installing Symbiflow on Linux
=============================

Download the required `Symbiflow Installer <https://github.com/QuickLogic-Corp/quicklogic-fpga-toolchain/releases/>`_

To install Symbiflow on Linux:

1. Set the execute permission for the .run file 

.. code-block:: shell

    chmod 755 Symbiflow*<version>*.gz.run


2. Set the *<INSTALL_DIR>:*  variable:

.. code-block:: shell

    export INSTALL_DIR=<Install path> 

3. Execute the .run file from the terminal:

.. code-block:: shell

    bash Symbiflow<*version*>.gz.run
 

.. |BR| raw:: html

   <BR/>


.. |U8221l| unicode:: U+0201D
   :ltrim:
.. |U8220r| unicode:: U+0201C
   :rtrim:
.. |U8221b| unicode:: U+0201D
   :trim:
