//_\TLV_version 1d: tl-x.org, generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro
//_\source tt_um_calculator.tlv 9
//_\SV
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlv_lib/fpga_includes.tlv"
   // Included URL: "https://raw.githubusercontent.com/stevehoover/MEST_Course/53d95456e5d2f2e4bf6edb9d8f15d09f8c8c2151/tlv_lib/calculator_shell_lib.tlv"
//_\source tt_um_calculator.tlv 52


/*SV_plus*/

`default_nettype none

// A simple Makerchip Verilog test bench driving random stimulus.
module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */
   logic [7:0] ui_in, uio_in, uo_out, uio_out, uio_oe;
   assign ui_in[7:0] = RW_rand_vect[(0 + (0)) % 257 +: 8];
   assign uio_in[7:0] = RW_rand_vect[(124 + (0)) % 257 +: 8];
   logic ena = 1'b0;
   logic rst_n = ! reset;

   // Instantiate the Tiny Tapeout module.
   tt_um_calculator tt(.*);

   assign failed = cyc_cnt > 50;
endmodule

module tt_um_calculator (
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
// ---------- Generated Code Inlined Here (before 1st \TLV) ----------
// Generated by SandPiper(TM) 1.14-2022/10/10-beta-Pro from Redwood EDA, LLC.
// Redwood EDA, LLC does not claim intellectual property rights to this file and provides no warranty regarding its correctness or quality.


// For silencing unused signal messages.
`define BOGUS_USE(ignore)


genvar digit, leds, switch;


//
// Signals declared top-level.
//

// For $slideswitch.
logic [7:0] L0_slideswitch_a0;

// For $sseg_decimal_point_n.
logic L0_sseg_decimal_point_n_a0;

// For $sseg_digit_n.
logic [7:0] L0_sseg_digit_n_a0;

// For $sseg_segment_n.
logic [6:0] L0_sseg_segment_n_a0;

// For /fpga_pins/fpga|calc$diff.
logic [31:0] FpgaPins_Fpga_CALC_diff_a1,
             FpgaPins_Fpga_CALC_diff_a2;

// For /fpga_pins/fpga|calc$mem.
logic [31:0] FpgaPins_Fpga_CALC_mem_a2,
             FpgaPins_Fpga_CALC_mem_a3,
             FpgaPins_Fpga_CALC_mem_a4;

// For /fpga_pins/fpga|calc$op.
logic [2:0] FpgaPins_Fpga_CALC_op_a1,
            FpgaPins_Fpga_CALC_op_a2;

// For /fpga_pins/fpga|calc$out.
logic [31:0] FpgaPins_Fpga_CALC_out_a2,
             FpgaPins_Fpga_CALC_out_a3,
             FpgaPins_Fpga_CALC_out_a4;

// For /fpga_pins/fpga|calc$prod.
logic [31:0] FpgaPins_Fpga_CALC_prod_a1,
             FpgaPins_Fpga_CALC_prod_a2;

// For /fpga_pins/fpga|calc$quot.
logic [31:0] FpgaPins_Fpga_CALC_quot_a1,
             FpgaPins_Fpga_CALC_quot_a2;

// For /fpga_pins/fpga|calc$reset.
logic FpgaPins_Fpga_CALC_reset_a0,
      FpgaPins_Fpga_CALC_reset_a1,
      FpgaPins_Fpga_CALC_reset_a2;

// For /fpga_pins/fpga|calc$reset_or_valid.
logic FpgaPins_Fpga_CALC_reset_or_valid_a1,
      FpgaPins_Fpga_CALC_reset_or_valid_a2;

// For /fpga_pins/fpga|calc$sum.
logic [31:0] FpgaPins_Fpga_CALC_sum_a1,
             FpgaPins_Fpga_CALC_sum_a2;

// For /fpga_pins/fpga|calc$val1.
logic [31:0] FpgaPins_Fpga_CALC_val1_a1,
             FpgaPins_Fpga_CALC_val1_a2;

// For /fpga_pins/fpga|calc$val2.
logic [31:0] FpgaPins_Fpga_CALC_val2_a1;

// For /fpga_pins/fpga|calc$valid.
logic FpgaPins_Fpga_CALC_valid_a1,
      FpgaPins_Fpga_CALC_valid_a2;




   //
   // Scope: /fpga_pins
   //


      //
      // Scope: /fpga
      //


         //
         // Scope: |calc
         //

            // Staging of $diff.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_diff_a2[31:0] <= FpgaPins_Fpga_CALC_diff_a1[31:0];

            // Staging of $mem.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_mem_a3[31:0] <= FpgaPins_Fpga_CALC_mem_a2[31:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_mem_a4[31:0] <= FpgaPins_Fpga_CALC_mem_a3[31:0];

            // Staging of $op.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_op_a2[2:0] <= FpgaPins_Fpga_CALC_op_a1[2:0];

            // Staging of $out.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_out_a3[31:0] <= FpgaPins_Fpga_CALC_out_a2[31:0];
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_out_a4[31:0] <= FpgaPins_Fpga_CALC_out_a3[31:0];

            // Staging of $prod.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_prod_a2[31:0] <= FpgaPins_Fpga_CALC_prod_a1[31:0];

            // Staging of $quot.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_quot_a2[31:0] <= FpgaPins_Fpga_CALC_quot_a1[31:0];

            // Staging of $reset.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a1 <= FpgaPins_Fpga_CALC_reset_a0;
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_a2 <= FpgaPins_Fpga_CALC_reset_a1;

            // Staging of $reset_or_valid.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_reset_or_valid_a2 <= FpgaPins_Fpga_CALC_reset_or_valid_a1;

            // Staging of $sum.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_sum_a2[31:0] <= FpgaPins_Fpga_CALC_sum_a1[31:0];

            // Staging of $val1.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_val1_a2[31:0] <= FpgaPins_Fpga_CALC_val1_a1[31:0];

            // Staging of $valid.
            always_ff @(posedge clk) FpgaPins_Fpga_CALC_valid_a2 <= FpgaPins_Fpga_CALC_valid_a1;





// ---------- Generated Code Ends ----------
//_\TLV
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv 839   // Instantiated from tt_um_calculator.tlv, 87 as: m5+tt_connections()
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source
   //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv 304   // Instantiated from tt_um_calculator.tlv, 88 as: m5+board(/top, /fpga, 7, $, , fpga_calculator)
      
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv 352   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv, 306 as: m4+thanks(m5__l(306)m5_eval(m5_get(BOARD_THANKS_ARGS)))
         //_/thanks
            
      //_\end_source
      
   
      // Board VIZ.
   
      // Board Image.
      
      //_/fpga_pins
         
         //_/fpga
            //_\source tt_um_calculator.tlv 15   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv, 337 as: m4+fpga_calculator.
               //_|calc
                  //_@0
                     // Run artificially slow in the real FPGA.
                     //m5+fpga_heartbeat($refresh, 1, 50000000)
                     assign FpgaPins_Fpga_CALC_reset_a0 = reset;
                  //_@1
                     // Board inputs
                     assign FpgaPins_Fpga_CALC_op_a1[2:0] = ui_in[7:5];
                     assign FpgaPins_Fpga_CALC_val2_a1[31:0] = {27'b0, ui_in[4:0]};
            
                     assign FpgaPins_Fpga_CALC_val1_a1[31:0] = FpgaPins_Fpga_CALC_out_a3;
                     //$val2[31:0] = $rand2[3:0];
                     assign FpgaPins_Fpga_CALC_valid_a1 = FpgaPins_Fpga_CALC_reset_a1 ? 1'b0 : FpgaPins_Fpga_CALC_valid_a2 + 1'b1;
                     assign FpgaPins_Fpga_CALC_reset_or_valid_a1 = FpgaPins_Fpga_CALC_valid_a1 || FpgaPins_Fpga_CALC_reset_a1;
                  //_?$reset_or_valid
                     //_@1
                        assign FpgaPins_Fpga_CALC_sum_a1[31:0] = FpgaPins_Fpga_CALC_val1_a1 + FpgaPins_Fpga_CALC_val2_a1;
                        assign FpgaPins_Fpga_CALC_diff_a1[31:0] = FpgaPins_Fpga_CALC_val1_a1 - FpgaPins_Fpga_CALC_val2_a1;
                        assign FpgaPins_Fpga_CALC_prod_a1[31:0] = FpgaPins_Fpga_CALC_val1_a1 * FpgaPins_Fpga_CALC_val2_a1;
                        assign FpgaPins_Fpga_CALC_quot_a1[31:0] = FpgaPins_Fpga_CALC_val1_a1 / FpgaPins_Fpga_CALC_val2_a1;
                     //_@2
                        assign FpgaPins_Fpga_CALC_mem_a2[31:0] = FpgaPins_Fpga_CALC_reset_a2           ? 32'b0 :
                                        (FpgaPins_Fpga_CALC_op_a2[2:0] == 3'b101) ? FpgaPins_Fpga_CALC_val1_a2 :
                                                           FpgaPins_Fpga_CALC_mem_a4;
                        assign FpgaPins_Fpga_CALC_out_a2[31:0] = FpgaPins_Fpga_CALC_reset_a2           ? 32'b0 :
                                     (FpgaPins_Fpga_CALC_op_a2 == 3'b000) ? FpgaPins_Fpga_CALC_sum_a2  :
                                     (FpgaPins_Fpga_CALC_op_a2 == 3'b001) ? FpgaPins_Fpga_CALC_diff_a2 :
                                     (FpgaPins_Fpga_CALC_op_a2 == 3'b010) ? FpgaPins_Fpga_CALC_prod_a2 :
                                     (FpgaPins_Fpga_CALC_op_a2 == 3'b011) ? FpgaPins_Fpga_CALC_quot_a2 :
                                     (FpgaPins_Fpga_CALC_op_a2 == 3'b100) ? FpgaPins_Fpga_CALC_mem_a4 : FpgaPins_Fpga_CALC_out_a4;
                  //_@2
                     //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv 816   // Instantiated from tt_um_calculator.tlv, 47 as: m5+sseg_decoder(*uo_out, $out[3:0])
                        assign uo_out[6:0] =
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 0) ? 7'b1000000 : // '0'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 1) ? 7'b1001111 : // '1'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 2) ? 7'b0010010 : // '2'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 3) ? 7'b0000110 : // '3'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 4) ? 7'b0001101 : // '4'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 5) ? 7'b0100100 : // '5'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 6) ? 7'b0100000 : // '6'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 7) ? 7'b1001110 : // '7'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 8) ? 7'b0000000 : // '8'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 9) ? 7'b0000100 : // '9'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 10) ? 7'b0000010 : // 'a'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 11) ? 7'b0100001 : // 'b'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 12) ? 7'b1110000 : // 'c'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 13) ? 7'b0000011 : // 'd'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 14) ? 7'b0010000 : // 'e'
                             (FpgaPins_Fpga_CALC_out_a2[3:0] == 15) ? 7'b0111000 : // 'f'
                             7'b1111111 ;                // 'nothing'
                     //_\end_source
                     assign uo_out[7] = 1'b1;  // No decimal point.
               /*SV_plus*/
                  
                  
               //_\source /raw.githubusercontent.com/stevehoover/MESTCourse/53d95456e5d2f2e4bf6edb9d8f15d09f8c8c2151/tlvlib/calculatorshelllib.tlv 4   // Instantiated from tt_um_calculator.tlv, 52 as: m4+cal_viz(@2, /fpga)
                  // Only for Makerchip.
                  
               //_\end_source
            //_\end_source
   
      // LEDs.
      
   
      // 7-Segment
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv 392   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv, 343 as: m4+fpga_sseg.
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            
            for (leds = 0; leds <= 7; leds++) begin : L2_Leds //_/leds

               // For $viz_lit.
               logic L2_viz_lit_a0;

               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               
            end
         end
      //_\end_source
   
      // slideswitches
      //_\source /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv 442   // Instantiated from /raw.githubusercontent.com/osfpga/VirtualFPGALab/9216ec3ddb2ead1a2b2eee93c334927b500af330/tlvlib/fpgaincludes.tlv, 346 as: m4+fpga_switch.
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch //_/switch

            // For $viz_switch.
            logic L1_viz_switch_a0;

            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            
         end
      //_\end_source
   
      // pushbuttons
      
   //_\end_source   // 3rd arg selects the board.

//_\SV
   endmodule


// Undefine macros defined by SandPiper.
`undef BOGUS_USE
