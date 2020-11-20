


.. index::
   single: RAM Usage:

RAM Usage
=========


The RAM macros (RAM_8K_BLK.v & RAM_16K_BLK.v) are part of pp3_cells_sim.v at:
|br| *<Install_Path>*/conda/share/yosys/quicklogic

The examples of RAMs are present at:
|br| *<Install_Path>*/quicklogic-arch-defs/tests/RAM_Examples

The Design example using S3 SRAM block are present at:
|br| *<Install_Path>*/quicklogic-arch-defs/tests/ram_test

  1. RAM_8K_BLK RAM macro is 8K bits block which can be configured as:

  * 1 independent 8Kbits RAM block
  * RAM can be initialized through INIT or INIT_FILE

  2. RAM_16K_BLK RAM macro is a 16K bits block which can be configured as:

  * A horizontal concatenated block (16Kbits)
  * A vertical concatenated block (16Kbits)
  * RAM can be initialized through INIT or INIT_FILE

        

Example 1: 1 8Kbits RAM
|br| |U9b| 

.. code-block:: verilog

    module r512x16_512x16 (WA,RA,WD,WClk,RClk,WClk_En,RClk_En,WEN,RD);
        input [8:0] WA;
        input [8:0] RA;
        input WClk,RClk;
        input WClk_En,RClk_En;
        input [1:0] WEN;
        input [15:0] WD;
        output [15:0] RD;

        parameter [16383:0] INIT = 16384'b0;
        parameter INIT_FILE="init_512x16.hex";	

        parameter addr_int = 9 ;
        parameter data_depth_int = 512;
        parameter data_width_int = 16;
        parameter wr_enable_int = 2;
        parameter reg_rd_int = 0;

        RAM_8K_BLK #(.addr_int(addr_int),.data_depth_int(data_depth_int),.data_width_int(data_width_int),.wr_enable_int(wr_enable_int),.reg_rd_int(reg_rd_int),
        			  .INIT(INIT),.INIT_FILE(INIT_FILE)
        			  )
        RAM_INST (	.WA(WA), .RA(RA), .WD(WD), .WClk(WClk),	.RClk(RClk), .WClk_En(WClk_En), .RClk_En(RClk_En), .WEN(WEN), .RD(RD));
    endmodule


Example 2: Horizontal Concatenation
|br| |U9b| 

  * 512x32 RAM (16 Kbits)
  * RAM can be initialized through INIT or INIT_FILE

.. code-block:: verilog

    module r512x32_512x32 (WA,RA,WD,WClk,RClk,WClk_En,RClk_En,WEN,RD);
        input [8:0] WA;
        input [8:0] RA;
        input WClk,RClk;
        input WClk_En,RClk_En;
        input [3:0] WEN;
        input [31:0] WD;
        output [31:0] RD;

        parameter [16383:0] INIT = 16384'b0;
        parameter INIT_FILE="init_512x32.hex";	

        parameter addr_int = 9 ;
        parameter data_depth_int = 512;
        parameter data_width_int = 32;
        parameter wr_enable_int = 4;
        parameter reg_rd_int = 0;

        RAM_16K_BLK #(.addr_int(addr_int),.data_depth_int(data_depth_int),.data_width_int(data_width_int),.wr_enable_int(wr_enable_int),.reg_rd_int(reg_rd_int),
        			  .INIT(INIT),.INIT_FILE(INIT_FILE)
        			  )
        RAM_INST (	.WA(WA), .RA(RA), .WD(WD), .WClk(WClk),	.RClk(RClk), .WClk_En(WClk_En),	.RClk_En(RClk_En), .WEN(WEN), .RD(RD));
    endmodule


Example 3: Vertical Concatenation
|br| |U9b| 

  * 2048 x 8 RAM (16 Kbits)
  * RAM can be initialized through INIT or INIT_FILE

.. code-block:: verilog

    module r2048x8_2048x8 (WA,RA,WD,WClk,RClk,WClk_En,RClk_En,WEN,RD);
        input [10:0] WA;
        input [10:0] RA;
        input WClk,RClk;
        input WClk_En,RClk_En;
        input WEN;
        input [7:0] WD;
        output [7:0] RD;

        parameter [16383:0] INIT = 16384'b0;
        parameter INIT_FILE="init_2048x8.hex";	

        parameter addr_int = 11 ;
        parameter data_depth_int = 2048;
        parameter data_width_int = 8;
        parameter wr_enable_int = 1;
        parameter reg_rd_int = 0;


        RAM_16K_BLK #(.addr_int(addr_int),.data_depth_int(data_depth_int),.data_width_int(data_width_int),.wr_enable_int(wr_enable_int),.reg_rd_int(reg_rd_int),
                            .INIT(INIT),.INIT_FILE(INIT_FILE)
        			  )
        RAM_INST (	.WA(WA), .RA(RA), .WD(WD), .WClk(WClk),	.RClk(RClk), .WClk_En(WClk_En),	.RClk_En(RClk_En), .WEN(WEN), .RD(RD));
    endmodule





.. |BR| raw:: html

   <BR/>


.. |U9b| unicode:: U+00009
   :trim:
