



.. index::
   single: BRAM and DSP Inference(qlf_k6n10)

BRAM and DSP(QLF_K6N10)
=======================


   To infer BRAM:

    In SymbiFlow, the synthesis of Verilog files is performed with Yosys which infers the BRAM.

   Syntax:

    .. code-block:: shell

        ql_symbiflow -synth -src <source complete path> -d <device> -t <top module name> -v <verilog files>


   Output files for synthesis are present in 'build' folder: 

   <TOP>.eblif : netlist file for the design
   |br| <TOP>_synth.log : synthesis log information, refer this file for any issues during synthesis 
      
      Resource utilization in the top_synth.log of the BRAM design: 
      
      .. code-block:: none
         
         io             : 42
          inpad         : 26
          outpad        : 16
         clb            : 2
           fle          : 2
            lut5inter   : 2
             ble5       : 2
              flut5     : 2
               lut5     : 2
                lut     : 2
          memory        : 1
            mem_16K_dp  : 1      

      All the output log files will be dumped in {source path}/build folder

      .. code-block:: verilog
        
        //Verilog code for the BRAM configuration of 16x1024
        module BRAM_16x1024_TOP( clk, rce, ra, rq, wce, wa, wd);

        parameter AWIDTH = 10;
        parameter DWIDTH = 16;
        input  clk;
        input  rce;
        input  [AWIDTH-1:0] ra;
        input  wce;
        input  [AWIDTH-1:0] wa;
        input  [DWIDTH-1:0] wd;
        output [DWIDTH-1:0] rq;

                BRAM #(.AWIDTH(AWIDTH), .DWIDTH(DWIDTH)) BRAM_16x1024 (.clk(clk), .rce(rce), .ra(ra), .rq(rq), .wce(wce), .wa(wa), .wd(wd));

        endmodule

        module BRAM #(parameter AWIDTH = 9,
        parameter DWIDTH = 32)(	clk, rce, ra, rq, wce, wa, wd);

        input  clk;
        input  rce;
        input  wce;
        input  [AWIDTH-1:0] ra;
        input  [AWIDTH-1:0] wa;
        input  [DWIDTH-1:0] wd;
        output reg [DWIDTH-1:0] rq;
        reg    [DWIDTH-1:0] memory[0:AWIDTH-1];

        always @(posedge clk) begin
        	if (rce)
                	rq <= memory[ra];
        	if (wce)
        		memory[wa] <= wd;
        end

        integer i;
        initial
           begin
        	for(i = 0; i < AWIDTH-1; i = i + 1)
        		memory[i] = 0;
           end
        endmodule

   
   The various configuration of the BRAMS can be configured by changing the AWIDTH and DWIDTH parameters as shown below.
    | BRAM 4x4096 : AWIDTH=12, DWIDTH=4
    | BRAM 8x2048 : AWIDTH=11, DWIDTH=8
    | BRAM 32x512 : AWIDTH=10, DWIDTH=16

   To infer DSP:
     To infer the DSP block for multiplier, refer the mac_16 verilog example.

     Resource utilization in the top_synth.log of the MAC_16 design: 
      
    .. code-block:: none
         
         io              : 64
          inpad          : 48
          outpad         : 16
         clb             : 1
           fle           : 1
            lut5inter    : 1
             ble5        : 1
              flut5      : 1
               lut5      : 1
                lut      : 1
          QL_DSP         : 1
            QL_DSP_slice : 1      

    All the output log files will be dumped in {source path}/build folder

    .. code-block:: verilog

        //Verilog code for the multiplier+adder block
        module mac_16(a, b, c, out);

        parameter DATA_WIDTH = 16;
        input [DATA_WIDTH - 1 : 0] a, b, c;
        output [DATA_WIDTH - 1 : 0] out;

        assign out = a * b + c;

        endmodule


|U160b| 

.. |BR| raw:: html

   <BR/>


.. |U160b| unicode:: U+000A0
   :trim:
