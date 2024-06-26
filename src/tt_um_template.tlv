\m5_TLV_version 1d: tl-x.org
\m5
   /**
   This template enables Tiny Tapeout modules to run in the Virtual FPGA Lab.
   It is specifically for Tiny Tapeout designs only.
   A different template should be used to develop Virtual FPGA Lab modules that are
   compatible with Tiny Tapeout (and all other boards supported by the Virtual FPGA Lab boards).
   **/
   
   use(m5-1.0)
   
   // ---SETTINGS---
   var(my_design, tt_um_template) /// Change tt_um_template to tt_um_<your-github-username>_<name-of-your-project>. (See README.md.)
   var(debounce_inputs, 1)        /// Set to 1 to provide synchronization and debouncing on all input signals.
                                  /// use "m5_neq(m5_MAKERCHIP, 1)" to debounce unless in Makerchip.
   // --------------
   
   // If debouncing, a user's module is within a wrapper, so it has a different name.
   var(user_module_name, m5_if(m5_debounce_inputs, my_design, m5_my_design))
   var(debounce_cnt, m5_if_eq(m5_MAKERCHIP, 1, 8'h03, 8'hff))
\SV
   // Include Tiny Tapeout Lab.
   m4_include_lib(['https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/84e7c389a63b4fbb5483238146168ed4188d1b8b/tlv_lib/tiny_tapeout_lib.tlv'])

   // Strict checking.
   `default_nettype none


\TLV my_design()
   
   // ============================================
   // If you are using TL-Verilog for your design,
   // your TL-Verilog logic goes here.
   // Also provide \viz_js here (for TL-Verilog or Verilog logic).
   // Tiny Tapeout inputs can be referenced as, e.g. *ui_in.
   // (Connect Tiny Tapeout outputs at the end of this template.)
   // ============================================
   
   // ...

\SV


// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

// Include the Makerchip module only in Makerchip. (Only because Yosys chokes on $urandom.)
m4_ifelse_block(m5_MAKERCHIP, 1, ['

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uio_in, uo_out, uio_out, uio_oe;
   logic [31:0] r;
   always @(posedge clk) r = $urandom();
   assign ui_in = r[7:0];
   assign uio_in = r[15:8];
   logic ena = 1'b0;
   logic rst_n = ! reset;
   
   /*
   // Or, to provide specific inputs at specific times...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         ui_in = 8'h0;
      #10 // Step past reset.
         ui_in = 8'hFF;
      // ...etc.
   end
   */
   
   // Instantiate the Tiny Tapeout module.
   m5_user_module_name tt(.*);
   
   assign passed = cyc_cnt > 100;
   assign failed = 1'b0;
endmodule

'])   /// end Makerchip-only

// Provide a wrapper module to debounce input signals if requested.
m5_if(m5_debounce_inputs, ['m5_tt_top(m5_my_design)'])
// The above macro expands to multiple lines. We enter a new \SV block to reset line tracking.
\SV


// The Tiny Tapeout module.
module m5_user_module_name (
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
   m5+board(/top, /fpga, 7, $, , my_design)
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (bottom-to-top).
   m5+tt_input_labels_viz(['"UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED", "UNUSED"'])
   
\SV_plus
   
   // =========================================
   // If you are using Verilog for your design,
   // your Verilog logic goes here.
   // =========================================
   
   // ...
   

   // Connect Tiny Tapeout outputs.
   // Note that my_design will be under /fpga_pins/fpga.
   assign uo_out = 8'b0;
   assign uio_out = 8'b0;
   assign uio_oe = 8'b0;
   
endmodule
