\m5_TLV_version 1d: tl-x.org
\m5
   /**
   This template enables Tiny Tapeout modules to run in the Virtual FPGA Lab.
   It is specifically for Tiny Tapeout designs only.
   A different template should be used to develop Virtual FPGA Lab modules that are
   compatible with Tiny Tapeout (and all other boards supported by the Virtual FPGA Lab boards).
   **/
   use(m5-1.0)
\SV
   m4_include_lib(['https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/7335edd12fe1b39521e855e526cc337b853e035f/tlv_lib/fpga_includes.tlv'])

`default_nettype none

\TLV my_design()
   
   // ============================================
   // If you are using TL-Verilog for your design,
   // your TL-Verilog logic goes here.
   // Inputs can be referenced as, e.g. *ui_in.
   // ============================================
   
   // ...

\SV

// A simple Makerchip Verilog test bench driving random stimulus.

// Comment out the Makerchip module if not using Makerchip. (Only because Yosys chokes on $urandom.)
m5_if_defined_as(MAKERCHIP, 1, [''], ['/']['*'])
module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);
   logic [7:0] ui_in, uio_in, uo_out, uio_out, uio_oe;
   logic [31:0] r = $urandom();
   assign ui_in = r[7:0];
   assign uio_in = r[15:8];
   logic ena = 1'b0;
   logic rst_n = ! reset;
   
   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);
   
   assign passed = cyc_cnt > 100;
   assign failed = 1'b0;
endmodule
// End comment block.
m5_if_defined_as(MAKERCHIP, 1, [''], ['*']['/'])

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

   wire reset = ! rst_n;
   
\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   m5+tt_connections()
   
   // Instantiate the Virtual FPGA Lab.
   m5+board(/top, /fpga, 7, $, , my_design)   // 3rd arg selects the board.
\SV
   // =========================================
   // If you are using Verilog for your design,
   // your Verilog logic goes here.
   // (You may use /viz_js here, as well.)
   // =========================================
   
   // ...
   

   // Connect outputs.
   // Note that my_design will be under /fpga_pins/fpga.
   assign uo_out = 8'b0;
   assign uio_out = 8'b0;
   assign uio_oe = 8'b0;
   
endmodule
