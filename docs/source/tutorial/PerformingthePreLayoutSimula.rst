


.. index::
   single: Performing the Pre-Layout Simulation

Performing the Pre-Layout Simulation
====================================


  To perform a pre-layout simulation:


  **Using Icarus Verilog:**


   To create the VCD output file that will be used to perform graphical analysis of the 
   |br| Design, the following lines are added in the TB:


    .. code-block:: verilog

        initial begin
         $dumpfile("counter_16bit_tb.vcd");
         $dumpvars(0,counter_16bit_tb);
         $display("\\t\\ttime,\\tclk,\\treset,\\tenable,\\tcount"); 
         $monitor("%d,\\t%b,\\t%b,\\t%b,\\t%d",$time, clk,reset,enable,count); 
        end

   
   The "iverilog" and "vvp" commands are the most important commands available to users of Icarus Verilog. The "iverilog" command is the compiler, and the "vvp" command is the simulation runtime engine.

    .. code-block:: shell
    
        cd <INSTALL_PATH>/quicklogic-arch-defs/tests/counter_16bit


   The "iverilog" command supports multi-file designs by two methods. The simplest is
   to list the files on the command line:

    
    .. code-block:: shell

        iverilog -o my_design counter_16bit.v counter_16bit_tb.v                     
        vvp my_design

   This command compiles the design, which is spread across two input files, and generates the compiled result into the "my_design" file.
   |br| Another technique is to use a commandfile, which lists the input files in a text file. For example, create a text file called "file_list.txt" with the files listed one per line:

    .. code-block:: shell

        #Inside file_list.txt 
        counter_16bit.v
        counter_16bit_tb.v

    .. code-block:: shell
    
        #Then compile and execute the design with command:
        iverilog -o my_design -c file_list.txt 
        vvp my_design
     
   VCD file is created, it can be viewed using GTKWave:

    .. code-block:: shell
   
        gtkwave testbench.vcd &

    .. image:: gtk_wave.png
      :width: 700
      :alt: Waveform
    

.. |BR| raw:: html

   <BR/>


.. |U9n| unicode:: U+00009
.. |U9r| unicode:: U+00009
   :rtrim:
.. |U9b| unicode:: U+00009
   :trim:
