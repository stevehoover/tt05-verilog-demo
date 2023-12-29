\m5_TLV_version 1d: tl-x.org
\SV_plus

`default_nettype none

// A simple Makerchip test bench driving random stimulus.
m4_makerchip_module
   logic [7:0] ui_in, uio_in, uo_out, uio_out, uio_oe;
   assign m4_rand(ui_in, 7, 0)
   assign m4_rand(uio_in, 7, 0)
   logic ena = 1'b0;
   logic rst_n = reset;
   tt_um_template tt(.*);
endmodule

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
   // ...

\SV
endmodule
