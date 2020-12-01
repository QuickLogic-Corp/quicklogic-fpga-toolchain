


.. index::
   single: FIFO Usage:

FIFO Usage
==========


The FIFO macros (FIFO_8K_BLK.v & FIFO_16K_BLK.v) are part of pp3_cells_sim.v at:
|br| *<Install_Path>*/conda/share/yosys/quicklogic

The examples of FIFOs are present at:
|br| *<Install_Path>*/quicklogic-arch-defs/tests/FIFO_Examples

The Design example using S3 FIFO block are present at:
|br| *<Install_Path>*/quicklogic-arch-defs/tests/fifo_test

Example 1: 1 8Kbits FIFO

  * FIFO 512 x 16
  * Asynchronous FIFO

.. code-block:: verilog

    module af512x16_512x16 (DIN,Fifo_Push_Flush,Fifo_Pop_Flush,PUSH,POP,Push_Clk,Pop_Clk,Push_Clk_En,Pop_Clk_En,Fifo_Dir,Async_Flush,Almost_Full,Almost_Empty,PUSH_FLAG,POP_FLAG,DOUT);
        input Fifo_Push_Flush,Fifo_Pop_Flush;
        input Push_Clk,Pop_Clk;
        input PUSH,POP;
        input [15:0] DIN;
        input Push_Clk_En,Pop_Clk_En,Fifo_Dir,Async_Flush;
        output [15:0] DOUT;
        output [3:0] PUSH_FLAG,POP_FLAG;
        output Almost_Full,Almost_Empty;

        parameter data_depth_int = 512;
        parameter data_width_int = 16;
        parameter reg_rd_int = 0;
        parameter sync_fifo_int = 0;

        FIFO_8K_BLK  # (.data_depth_int(data_depth_int),.data_width_int(data_width_int),.reg_rd_int(reg_rd_int),.sync_fifo_int(sync_fifo_int)
                 ) 
          FIFO_INST  ( .DIN(DIN), .PUSH(PUSH), .POP(POP), .Fifo_Push_Flush(Fifo_Push_Flush), .Fifo_Pop_Flush(Fifo_Pop_Flush), .Push_Clk(Push_Clk),
                .Pop_Clk(Pop_Clk),.PUSH_FLAG(PUSH_FLAG), .POP_FLAG(POP_FLAG), .Push_Clk_En(Push_Clk_En), .Pop_Clk_En(Pop_Clk_En),
                .Fifo_Dir(Fifo_Dir),  .Async_Flush(Async_Flush), .Almost_Full(Almost_Full), .Almost_Empty(Almost_Empty), .DOUT(DOUT));
    endmodule

|br| Example 2: Horizontal Concatenation
|br| |U9b| 

  * FIFO 512 x 32
  * Asynchronous FIFO

.. code-block:: verilog
      
    module af512x32_512x32 (DIN,Fifo_Push_Flush,Fifo_Pop_Flush,PUSH,POP,Push_Clk,Pop_Clk,Push_Clk_En,Pop_Clk_En,Fifo_Dir,Async_Flush,Almost_Full,Almost_Empty,PUSH_FLAG,POP_FLAG,DOUT);
        input Fifo_Push_Flush,Fifo_Pop_Flush;
        input Push_Clk,Pop_Clk;
        input PUSH,POP;
        input [31:0] DIN;
        input Push_Clk_En,Pop_Clk_En,Fifo_Dir,Async_Flush;
        output [31:0] DOUT;
        output [3:0] PUSH_FLAG,POP_FLAG;
        output Almost_Full,Almost_Empty;

        parameter data_depth_int = 512;
        parameter data_width_int = 32;
        parameter reg_rd_int = 0;
        parameter sync_fifo_int = 0;

        FIFO_16K_BLK  # (.data_depth_int(data_depth_int),.data_width_int(data_width_int),.reg_rd_int(reg_rd_int),.sync_fifo_int(sync_fifo_int)
        				 ) 
          FIFO_INST  ( .DIN(DIN), .PUSH(PUSH), .POP(POP), .Fifo_Push_Flush(Fifo_Push_Flush), .Fifo_Pop_Flush(Fifo_Pop_Flush), .Push_Clk(Push_Clk),
                .Pop_Clk(Pop_Clk), .PUSH_FLAG(PUSH_FLAG), .POP_FLAG(POP_FLAG), .Push_Clk_En(Push_Clk_En), .Pop_Clk_En(Pop_Clk_En), .Fifo_Dir(Fifo_Dir),
                .Async_Flush(Async_Flush), .Almost_Full(Almost_Full), .Almost_Empty(Almost_Empty), .DOUT(DOUT));

    endmodule



Example 3: Vertical Concatenation
|br| |U9b| 

  * FIFO 1024 x 16
  * Synchronous FIFO

.. code-block:: verilog

    module f1024x16_1024x16 (DIN,Fifo_Push_Flush,Fifo_Pop_Flush,PUSH,POP,Clk,Clk_En,Fifo_Dir,Async_Flush,Almost_Full,Almost_Empty,PUSH_FLAG,POP_FLAG,DOUT);
        input Fifo_Push_Flush,Fifo_Pop_Flush;
        input Clk;
        input PUSH,POP;
        input [15:0] DIN;
        input Clk_En,Fifo_Dir,Async_Flush;
        output [15:0] DOUT;
        output [3:0] PUSH_FLAG,POP_FLAG;
        output Almost_Full,Almost_Empty;

        parameter data_depth_int = 1024;
        parameter data_width_int = 16;
        parameter reg_rd_int = 0;
        parameter sync_fifo_int = 1;

        FIFO_16K_BLK  # (.data_depth_int(data_depth_int),.data_width_int(data_width_int),.reg_rd_int(reg_rd_int),.sync_fifo_int(sync_fifo_int)
        				 ) 
          FIFO_INST (.DIN(DIN), .PUSH(PUSH), .POP(POP), .Fifo_Push_Flush(Fifo_Push_Flush), .Fifo_Pop_Flush(Fifo_Pop_Flush), .Push_Clk(Clk),
                .Pop_Clk(Clk), .PUSH_FLAG(PUSH_FLAG), .POP_FLAG(POP_FLAG), .Push_Clk_En(Clk_En), .Pop_Clk_En(Clk_En), .Fifo_Dir(Fifo_Dir),
                .Async_Flush(Async_Flush), .Almost_Full(Almost_Full), .Almost_Empty(Almost_Empty), .DOUT(DOUT));
    endmodule





.. |BR| raw:: html

   <BR/>


.. |U9b| unicode:: U+00009
   :trim:
