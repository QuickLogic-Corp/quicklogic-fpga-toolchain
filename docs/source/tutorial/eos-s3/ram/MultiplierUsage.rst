


.. index::
   single: Multiplier Usage:

Multiplier Usage
================


The Multiplier macros are present at:
|br| *<Install_Path>*/conda/share/yosys/quicklogic

1. 32 x 32 Multiplier

  * Configured as 1 32x32 multiplier

.. code-block:: verilog

    module MULT_32BIT (Amult, Bmult, Valid_mult, Cmult);
        input [31:0] Amult;
        input [31:0] Bmult;
        input  Valid_mult;
        output [63:0] Cmult;

        wire [1:0] valit_int;

        assign valit_int = {Valid_mult,Valid_mult};

        //qlal4s3_mult_cell_macro
        qlal4s3_mult_cell_macro u_qlal4s3_mult_cell_macro (.Amult(Amult), .Bmult(Bmult), .Valid_mult(valit_int), .sel_mul_32x32(1'b1), .Cmult(Cmult));
    endmodule  
  
2. 16 x 16 Multiplier

  * Configured as 1 16x16 multiplier

.. code-block:: verilog

    module MULT_16BIT_X2 ( Amult1, Bmult1, Valid_mult1, Cmult1,
                           Amult2, Bmult2, Valid_mult2, Cmult2 );
        input [15:0] Amult1;
        input [15:0] Bmult1;
        input Valid_mult1;
        output [31:0] Cmult1;

        input [15:0] Amult2;
        input [15:0] Bmult2;
        input Valid_mult2;
        output [31:0] Cmult2;

        wire [31:0] amult_int;
        wire [31:0] bmult_int;
        wire [63:0] cmult_int;
        wire [1:0] valit_int;

        assign valit_int = {Valid_mult2,Valid_mult1};
        assign amult_int = {Amult2,Amult1};
        assign bmult_int = {Bmult2,Bmult1};
        assign Cmult1 = cmult_int[31:0];
        assign Cmult2 = cmult_int[63:32];

        //qlal4s3_mult_cell_macro
        qlal4s3_mult_cell_macro u_qlal4s3_mult_cell_macro (.Amult(amult_int), .Bmult(bmult_int), .Valid_mult(valit_int), .sel_mul_32x32(1'b0), .Cmult(cmult_int));
    endmodule





.. |BR| raw:: html

   <BR/>
