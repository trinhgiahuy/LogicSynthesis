// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Jan 21 02:20:00 2019
// Host        : WS-11695-PC running 64-bit major release  (build 9200)
// Command     : write_verilog S:/81401_TIE-50206/S18/logsyn-reference-project/verilog/i2c_config.v
// Design      : i2c_config
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* i2c_freq_g = "20000" *) (* n_leds_g = "4" *) (* n_params_g = "15" *) 
(* ref_clk_freq_g = "50000000" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module i2c_config
   (clk,
    rst_n,
    sdat_inout,
    sclk_out,
    param_status_out,
    finished_out);
  input clk;
  input rst_n;
  inout sdat_inout;
  output sclk_out;
  output [3:0]param_status_out;
  output finished_out;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_sequential_curr_state_r[0]_i_1_n_0 ;
  wire \FSM_sequential_curr_state_r[1]_i_1_n_0 ;
  wire \FSM_sequential_curr_state_r[2]_i_1_n_0 ;
  wire \FSM_sequential_curr_state_r[2]_i_2_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_1_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_2_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_3_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_4_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_6_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_7_n_0 ;
  wire \FSM_sequential_curr_state_r[3]_i_8_n_0 ;
  wire bit_counter_r;
  wire \bit_counter_r[0]_i_1_n_0 ;
  wire \bit_counter_r[1]_i_1_n_0 ;
  wire \bit_counter_r[2]_i_1_n_0 ;
  wire \bit_counter_r[3]_i_1_n_0 ;
  wire \bit_counter_r[4]_i_1_n_0 ;
  wire \bit_counter_r[4]_i_2_n_0 ;
  wire \bit_counter_r[4]_i_4_n_0 ;
  wire \bit_counter_r[4]_i_5_n_0 ;
  wire \bit_counter_r_reg_n_0_[0] ;
  wire \bit_counter_r_reg_n_0_[1] ;
  wire \bit_counter_r_reg_n_0_[2] ;
  wire \bit_counter_r_reg_n_0_[3] ;
  wire \bit_counter_r_reg_n_0_[4] ;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [0:0]clk_divider_r;
  wire \clk_divider_r[0]_i_1_n_0 ;
  wire \clk_divider_r[0]_i_3_n_0 ;
  wire \clk_divider_r[0]_i_4_n_0 ;
  wire \clk_divider_r[10]_i_1_n_0 ;
  wire \clk_divider_r[10]_i_2_n_0 ;
  wire \clk_divider_r[10]_i_3_n_0 ;
  wire \clk_divider_r[10]_i_4_n_0 ;
  wire \clk_divider_r[10]_i_5_n_0 ;
  wire \clk_divider_r[10]_i_6_n_0 ;
  wire \clk_divider_r[1]_i_1_n_0 ;
  wire \clk_divider_r[1]_i_2_n_0 ;
  wire \clk_divider_r[2]_i_1_n_0 ;
  wire \clk_divider_r[3]_i_1_n_0 ;
  wire \clk_divider_r[4]_i_1_n_0 ;
  wire \clk_divider_r[4]_i_2_n_0 ;
  wire \clk_divider_r[5]_i_1_n_0 ;
  wire \clk_divider_r[5]_i_2_n_0 ;
  wire \clk_divider_r[6]_i_1_n_0 ;
  wire \clk_divider_r[6]_i_2_n_0 ;
  wire \clk_divider_r[7]_i_1_n_0 ;
  wire \clk_divider_r[7]_i_2_n_0 ;
  wire \clk_divider_r[8]_i_1_n_0 ;
  wire \clk_divider_r[8]_i_2_n_0 ;
  wire \clk_divider_r[9]_i_1_n_0 ;
  wire \clk_divider_r[9]_i_2_n_0 ;
  wire \clk_divider_r_reg_n_0_[0] ;
  wire \clk_divider_r_reg_n_0_[10] ;
  wire \clk_divider_r_reg_n_0_[1] ;
  wire \clk_divider_r_reg_n_0_[2] ;
  wire \clk_divider_r_reg_n_0_[3] ;
  wire \clk_divider_r_reg_n_0_[4] ;
  wire \clk_divider_r_reg_n_0_[5] ;
  wire \clk_divider_r_reg_n_0_[6] ;
  wire \clk_divider_r_reg_n_0_[7] ;
  wire \clk_divider_r_reg_n_0_[8] ;
  wire \clk_divider_r_reg_n_0_[9] ;
  wire curr_state_r;
  (* RTL_KEEP = "yes" *) wire [3:0]curr_state_r__0;
  wire \data_r[18]_i_1_n_0 ;
  wire \data_r[18]_i_2_n_0 ;
  wire \data_r[18]_i_3_n_0 ;
  wire \data_r_reg_n_0_[0] ;
  wire \data_r_reg_n_0_[10] ;
  wire \data_r_reg_n_0_[11] ;
  wire \data_r_reg_n_0_[12] ;
  wire \data_r_reg_n_0_[13] ;
  wire \data_r_reg_n_0_[14] ;
  wire \data_r_reg_n_0_[18] ;
  wire \data_r_reg_n_0_[1] ;
  wire \data_r_reg_n_0_[2] ;
  wire \data_r_reg_n_0_[3] ;
  wire \data_r_reg_n_0_[4] ;
  wire \data_r_reg_n_0_[5] ;
  wire \data_r_reg_n_0_[7] ;
  wire \data_r_reg_n_0_[8] ;
  wire \data_r_reg_n_0_[9] ;
  wire finished_out;
  wire finished_out_OBUF;
  wire finished_out_i_1_n_0;
  wire finished_out_i_2_n_0;
  wire [3:0]p_0_in;
  wire \param_counter_r[3]_i_1_n_0 ;
  wire [3:0]param_counter_r_reg;
  wire [3:0]param_status_out;
  wire \param_status_out[3]_i_1_n_0 ;
  wire \param_status_out[3]_i_3_n_0 ;
  wire [3:0]param_status_out_OBUF;
  wire [14:0]rom_data_r;
  wire \rom_data_r[4]_i_1_n_0 ;
  wire \rom_data_r_reg_n_0_[0] ;
  wire \rom_data_r_reg_n_0_[10] ;
  wire \rom_data_r_reg_n_0_[11] ;
  wire \rom_data_r_reg_n_0_[12] ;
  wire \rom_data_r_reg_n_0_[13] ;
  wire \rom_data_r_reg_n_0_[14] ;
  wire \rom_data_r_reg_n_0_[1] ;
  wire \rom_data_r_reg_n_0_[2] ;
  wire \rom_data_r_reg_n_0_[3] ;
  wire \rom_data_r_reg_n_0_[4] ;
  wire \rom_data_r_reg_n_0_[5] ;
  wire \rom_data_r_reg_n_0_[7] ;
  wire \rom_data_r_reg_n_0_[8] ;
  wire \rom_data_r_reg_n_0_[9] ;
  wire rst_n;
  wire rst_n_IBUF;
  wire sclk_en_r_i_1_n_0;
  wire sclk_en_r_i_2_n_0;
  wire sclk_en_r_reg_n_0;
  wire sclk_force_r_i_1_n_0;
  wire sclk_force_r_i_2_n_0;
  wire sclk_force_r_reg_n_0;
  wire sclk_out;
  wire sclk_out0;
  wire sclk_out_OBUF;
  wire sclk_r;
  wire sclk_r_i_1_n_0;
  wire sclk_r_i_3_n_0;
  wire sclk_r_reg_n_0;
  wire sdat_inout;
  wire sdat_inout_IBUF;
  wire sdat_inout_IOBUF_inst_i_2_n_0;
  wire sdat_inout_IOBUF_inst_i_3_n_0;
  wire sdat_inout_IOBUF_inst_i_4_n_0;
  wire sdat_inout_OBUF;
  wire sdat_inout_TRI;
  wire sdat_inout_retimed_i_10_n_0;
  wire sdat_inout_retimed_i_11_n_0;
  wire sdat_inout_retimed_i_12_n_0;
  wire sdat_inout_retimed_i_13_n_0;
  wire sdat_inout_retimed_i_1_n_0;
  wire sdat_inout_retimed_i_2_n_0;
  wire sdat_inout_retimed_i_3_n_0;
  wire sdat_inout_retimed_i_4_n_0;
  wire sdat_inout_retimed_i_5_n_0;
  wire sdat_inout_retimed_i_6_n_0;
  wire sdat_inout_retimed_i_7_n_0;
  wire sdat_inout_retimed_i_8_n_0;
  wire sdat_inout_retimed_i_9_n_0;

  LUT6 #(
    .INIT(64'h0010555500005555)) 
    \FSM_sequential_curr_state_r[0]_i_1 
       (.I0(curr_state_r__0[3]),
        .I1(curr_state_r__0[1]),
        .I2(curr_state_r__0[2]),
        .I3(sdat_inout_IBUF),
        .I4(curr_state_r__0[0]),
        .I5(\FSM_sequential_curr_state_r[2]_i_2_n_0 ),
        .O(\FSM_sequential_curr_state_r[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0F70)) 
    \FSM_sequential_curr_state_r[1]_i_1 
       (.I0(sdat_inout_IBUF),
        .I1(curr_state_r__0[2]),
        .I2(curr_state_r__0[0]),
        .I3(curr_state_r__0[1]),
        .O(\FSM_sequential_curr_state_r[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0F1FC0C0)) 
    \FSM_sequential_curr_state_r[2]_i_1 
       (.I0(sdat_inout_IBUF),
        .I1(curr_state_r__0[1]),
        .I2(curr_state_r__0[0]),
        .I3(\FSM_sequential_curr_state_r[2]_i_2_n_0 ),
        .I4(curr_state_r__0[2]),
        .O(\FSM_sequential_curr_state_r[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_sequential_curr_state_r[2]_i_2 
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(\bit_counter_r_reg_n_0_[3] ),
        .I2(\bit_counter_r_reg_n_0_[4] ),
        .I3(\bit_counter_r_reg_n_0_[2] ),
        .I4(\bit_counter_r_reg_n_0_[1] ),
        .O(\FSM_sequential_curr_state_r[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \FSM_sequential_curr_state_r[3]_i_1 
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(curr_state_r),
        .I2(\clk_divider_r_reg_n_0_[2] ),
        .I3(\clk_divider_r_reg_n_0_[4] ),
        .I4(\clk_divider_r_reg_n_0_[7] ),
        .O(\FSM_sequential_curr_state_r[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \FSM_sequential_curr_state_r[3]_i_2 
       (.I0(curr_state_r__0[0]),
        .I1(curr_state_r__0[1]),
        .I2(\FSM_sequential_curr_state_r[3]_i_6_n_0 ),
        .I3(curr_state_r__0[2]),
        .I4(curr_state_r__0[3]),
        .O(\FSM_sequential_curr_state_r[3]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_curr_state_r[3]_i_3 
       (.I0(rst_n_IBUF),
        .O(\FSM_sequential_curr_state_r[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00000800)) 
    \FSM_sequential_curr_state_r[3]_i_4 
       (.I0(\FSM_sequential_curr_state_r[3]_i_7_n_0 ),
        .I1(\clk_divider_r_reg_n_0_[6] ),
        .I2(\clk_divider_r_reg_n_0_[10] ),
        .I3(\clk_divider_r_reg_n_0_[9] ),
        .I4(\clk_divider_r_reg_n_0_[1] ),
        .O(\FSM_sequential_curr_state_r[3]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h555955D555595515)) 
    \FSM_sequential_curr_state_r[3]_i_5 
       (.I0(sclk_r_reg_n_0),
        .I1(curr_state_r__0[0]),
        .I2(curr_state_r__0[1]),
        .I3(curr_state_r__0[3]),
        .I4(curr_state_r__0[2]),
        .I5(\FSM_sequential_curr_state_r[3]_i_8_n_0 ),
        .O(curr_state_r));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \FSM_sequential_curr_state_r[3]_i_6 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[2]),
        .I2(param_counter_r_reg[0]),
        .I3(param_counter_r_reg[1]),
        .O(\FSM_sequential_curr_state_r[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0040)) 
    \FSM_sequential_curr_state_r[3]_i_7 
       (.I0(\clk_divider_r_reg_n_0_[8] ),
        .I1(\clk_divider_r_reg_n_0_[0] ),
        .I2(\clk_divider_r_reg_n_0_[5] ),
        .I3(\clk_divider_r_reg_n_0_[3] ),
        .O(\FSM_sequential_curr_state_r[3]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010101)) 
    \FSM_sequential_curr_state_r[3]_i_8 
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(\bit_counter_r_reg_n_0_[1] ),
        .I2(\bit_counter_r_reg_n_0_[2] ),
        .I3(\bit_counter_r_reg_n_0_[3] ),
        .I4(\bit_counter_r_reg_n_0_[4] ),
        .I5(sclk_r_reg_n_0),
        .O(\FSM_sequential_curr_state_r[3]_i_8_n_0 ));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\FSM_sequential_curr_state_r[0]_i_1_n_0 ),
        .Q(curr_state_r__0[0]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\FSM_sequential_curr_state_r[1]_i_1_n_0 ),
        .Q(curr_state_r__0[1]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\FSM_sequential_curr_state_r[2]_i_1_n_0 ),
        .Q(curr_state_r__0[2]));
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_curr_state_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\FSM_sequential_curr_state_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\FSM_sequential_curr_state_r[3]_i_2_n_0 ),
        .Q(curr_state_r__0[3]));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT3 #(
    .INIT(8'h13)) 
    \bit_counter_r[0]_i_1 
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(curr_state_r__0[3]),
        .I2(curr_state_r__0[1]),
        .O(\bit_counter_r[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h090F)) 
    \bit_counter_r[1]_i_1 
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(\bit_counter_r_reg_n_0_[1] ),
        .I2(curr_state_r__0[3]),
        .I3(curr_state_r__0[1]),
        .O(\bit_counter_r[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00E100FF)) 
    \bit_counter_r[2]_i_1 
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(\bit_counter_r_reg_n_0_[1] ),
        .I2(\bit_counter_r_reg_n_0_[2] ),
        .I3(curr_state_r__0[3]),
        .I4(curr_state_r__0[1]),
        .O(\bit_counter_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4444444000000004)) 
    \bit_counter_r[3]_i_1 
       (.I0(curr_state_r__0[3]),
        .I1(curr_state_r__0[1]),
        .I2(\bit_counter_r_reg_n_0_[2] ),
        .I3(\bit_counter_r_reg_n_0_[1] ),
        .I4(\bit_counter_r_reg_n_0_[0] ),
        .I5(\bit_counter_r_reg_n_0_[3] ),
        .O(\bit_counter_r[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \bit_counter_r[4]_i_1 
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(bit_counter_r),
        .I2(\clk_divider_r_reg_n_0_[2] ),
        .I3(\clk_divider_r_reg_n_0_[4] ),
        .I4(\clk_divider_r_reg_n_0_[7] ),
        .O(\bit_counter_r[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h009A00FF)) 
    \bit_counter_r[4]_i_2 
       (.I0(\bit_counter_r_reg_n_0_[4] ),
        .I1(\bit_counter_r_reg_n_0_[3] ),
        .I2(\bit_counter_r[4]_i_4_n_0 ),
        .I3(curr_state_r__0[3]),
        .I4(curr_state_r__0[1]),
        .O(\bit_counter_r[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000D000000000F0)) 
    \bit_counter_r[4]_i_3 
       (.I0(\bit_counter_r[4]_i_5_n_0 ),
        .I1(\bit_counter_r_reg_n_0_[4] ),
        .I2(\data_r[18]_i_2_n_0 ),
        .I3(curr_state_r__0[0]),
        .I4(sclk_r_reg_n_0),
        .I5(curr_state_r__0[1]),
        .O(bit_counter_r));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \bit_counter_r[4]_i_4 
       (.I0(\bit_counter_r_reg_n_0_[2] ),
        .I1(\bit_counter_r_reg_n_0_[1] ),
        .I2(\bit_counter_r_reg_n_0_[0] ),
        .O(\bit_counter_r[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \bit_counter_r[4]_i_5 
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(\bit_counter_r_reg_n_0_[1] ),
        .I2(\bit_counter_r_reg_n_0_[2] ),
        .I3(\bit_counter_r_reg_n_0_[3] ),
        .O(\bit_counter_r[4]_i_5_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_counter_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter_r[4]_i_1_n_0 ),
        .D(\bit_counter_r[0]_i_1_n_0 ),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(\bit_counter_r_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_counter_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter_r[4]_i_1_n_0 ),
        .D(\bit_counter_r[1]_i_1_n_0 ),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(\bit_counter_r_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_counter_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter_r[4]_i_1_n_0 ),
        .D(\bit_counter_r[2]_i_1_n_0 ),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(\bit_counter_r_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \bit_counter_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter_r[4]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\bit_counter_r[3]_i_1_n_0 ),
        .Q(\bit_counter_r_reg_n_0_[3] ));
  FDPE #(
    .INIT(1'b1)) 
    \bit_counter_r_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\bit_counter_r[4]_i_1_n_0 ),
        .D(\bit_counter_r[4]_i_2_n_0 ),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(\bit_counter_r_reg_n_0_[4] ));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT6 #(
    .INIT(64'h00007000FFFFFFFF)) 
    \clk_divider_r[0]_i_1 
       (.I0(\clk_divider_r_reg_n_0_[4] ),
        .I1(\clk_divider_r_reg_n_0_[3] ),
        .I2(clk_divider_r),
        .I3(\clk_divider_r_reg_n_0_[5] ),
        .I4(\clk_divider_r[0]_i_3_n_0 ),
        .I5(\clk_divider_r_reg_n_0_[0] ),
        .O(\clk_divider_r[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0303030203020333)) 
    \clk_divider_r[0]_i_2 
       (.I0(sclk_r_reg_n_0),
        .I1(\clk_divider_r_reg_n_0_[0] ),
        .I2(curr_state_r__0[3]),
        .I3(curr_state_r__0[2]),
        .I4(curr_state_r__0[1]),
        .I5(curr_state_r__0[0]),
        .O(clk_divider_r));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFB)) 
    \clk_divider_r[0]_i_3 
       (.I0(\clk_divider_r[0]_i_4_n_0 ),
        .I1(\clk_divider_r_reg_n_0_[4] ),
        .I2(\clk_divider_r_reg_n_0_[8] ),
        .I3(\clk_divider_r_reg_n_0_[7] ),
        .I4(\clk_divider_r_reg_n_0_[2] ),
        .I5(\clk_divider_r_reg_n_0_[1] ),
        .O(\clk_divider_r[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \clk_divider_r[0]_i_4 
       (.I0(\clk_divider_r_reg_n_0_[6] ),
        .I1(\clk_divider_r_reg_n_0_[10] ),
        .I2(\clk_divider_r_reg_n_0_[9] ),
        .O(\clk_divider_r[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[10]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[10]_i_5_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hABAAAAAA)) 
    \clk_divider_r[10]_i_2 
       (.I0(sclk_r),
        .I1(\clk_divider_r[0]_i_3_n_0 ),
        .I2(\clk_divider_r_reg_n_0_[3] ),
        .I3(\clk_divider_r_reg_n_0_[5] ),
        .I4(\clk_divider_r_reg_n_0_[0] ),
        .O(\clk_divider_r[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    \clk_divider_r[10]_i_3 
       (.I0(\clk_divider_r_reg_n_0_[0] ),
        .I1(\clk_divider_r_reg_n_0_[5] ),
        .I2(\clk_divider_r_reg_n_0_[3] ),
        .I3(\clk_divider_r[0]_i_3_n_0 ),
        .O(\clk_divider_r[10]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h5543)) 
    \clk_divider_r[10]_i_4 
       (.I0(curr_state_r__0[3]),
        .I1(curr_state_r__0[1]),
        .I2(curr_state_r__0[0]),
        .I3(curr_state_r__0[2]),
        .O(\clk_divider_r[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAAAA6AAAAAAAAAAA)) 
    \clk_divider_r[10]_i_5 
       (.I0(\clk_divider_r_reg_n_0_[10] ),
        .I1(\clk_divider_r_reg_n_0_[8] ),
        .I2(\clk_divider_r_reg_n_0_[6] ),
        .I3(\clk_divider_r_reg_n_0_[7] ),
        .I4(\clk_divider_r[8]_i_2_n_0 ),
        .I5(\clk_divider_r_reg_n_0_[9] ),
        .O(\clk_divider_r[10]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h0110)) 
    \clk_divider_r[10]_i_6 
       (.I0(curr_state_r__0[3]),
        .I1(curr_state_r__0[2]),
        .I2(curr_state_r__0[1]),
        .I3(curr_state_r__0[0]),
        .O(\clk_divider_r[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[1]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[1]_i_2_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \clk_divider_r[1]_i_2 
       (.I0(\clk_divider_r_reg_n_0_[0] ),
        .I1(\clk_divider_r_reg_n_0_[1] ),
        .O(\clk_divider_r[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \clk_divider_r[2]_i_1 
       (.I0(\clk_divider_r_reg_n_0_[2] ),
        .I1(\clk_divider_r_reg_n_0_[1] ),
        .I2(\clk_divider_r_reg_n_0_[0] ),
        .O(\clk_divider_r[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \clk_divider_r[3]_i_1 
       (.I0(\clk_divider_r_reg_n_0_[3] ),
        .I1(\clk_divider_r_reg_n_0_[2] ),
        .I2(\clk_divider_r_reg_n_0_[0] ),
        .I3(\clk_divider_r_reg_n_0_[1] ),
        .O(\clk_divider_r[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[4]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[4]_i_2_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \clk_divider_r[4]_i_2 
       (.I0(\clk_divider_r_reg_n_0_[4] ),
        .I1(\clk_divider_r_reg_n_0_[1] ),
        .I2(\clk_divider_r_reg_n_0_[0] ),
        .I3(\clk_divider_r_reg_n_0_[2] ),
        .I4(\clk_divider_r_reg_n_0_[3] ),
        .O(\clk_divider_r[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[5]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[5]_i_2_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \clk_divider_r[5]_i_2 
       (.I0(\clk_divider_r_reg_n_0_[5] ),
        .I1(\clk_divider_r_reg_n_0_[1] ),
        .I2(\clk_divider_r_reg_n_0_[0] ),
        .I3(\clk_divider_r_reg_n_0_[2] ),
        .I4(\clk_divider_r_reg_n_0_[3] ),
        .I5(\clk_divider_r_reg_n_0_[4] ),
        .O(\clk_divider_r[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[6]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[6]_i_2_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[6]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \clk_divider_r[6]_i_2 
       (.I0(\clk_divider_r[8]_i_2_n_0 ),
        .I1(\clk_divider_r_reg_n_0_[6] ),
        .O(\clk_divider_r[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[7]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[7]_i_2_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \clk_divider_r[7]_i_2 
       (.I0(\clk_divider_r_reg_n_0_[7] ),
        .I1(\clk_divider_r[8]_i_2_n_0 ),
        .I2(\clk_divider_r_reg_n_0_[6] ),
        .O(\clk_divider_r[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hBF40)) 
    \clk_divider_r[8]_i_1 
       (.I0(\clk_divider_r[8]_i_2_n_0 ),
        .I1(\clk_divider_r_reg_n_0_[7] ),
        .I2(\clk_divider_r_reg_n_0_[6] ),
        .I3(\clk_divider_r_reg_n_0_[8] ),
        .O(\clk_divider_r[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \clk_divider_r[8]_i_2 
       (.I0(\clk_divider_r_reg_n_0_[5] ),
        .I1(\clk_divider_r_reg_n_0_[1] ),
        .I2(\clk_divider_r_reg_n_0_[0] ),
        .I3(\clk_divider_r_reg_n_0_[2] ),
        .I4(\clk_divider_r_reg_n_0_[3] ),
        .I5(\clk_divider_r_reg_n_0_[4] ),
        .O(\clk_divider_r[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h7700750075007500)) 
    \clk_divider_r[9]_i_1 
       (.I0(\clk_divider_r[10]_i_2_n_0 ),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(\clk_divider_r[10]_i_4_n_0 ),
        .I3(\clk_divider_r[9]_i_2_n_0 ),
        .I4(sclk_r_reg_n_0),
        .I5(\clk_divider_r[10]_i_6_n_0 ),
        .O(\clk_divider_r[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h9AAAAAAA)) 
    \clk_divider_r[9]_i_2 
       (.I0(\clk_divider_r_reg_n_0_[9] ),
        .I1(\clk_divider_r[8]_i_2_n_0 ),
        .I2(\clk_divider_r_reg_n_0_[7] ),
        .I3(\clk_divider_r_reg_n_0_[6] ),
        .I4(\clk_divider_r_reg_n_0_[8] ),
        .O(\clk_divider_r[9]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[0]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[10]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[1]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[2]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[3]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[4]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[5]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[6]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[7]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[8]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \clk_divider_r_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\clk_divider_r[9]_i_1_n_0 ),
        .Q(\clk_divider_r_reg_n_0_[9] ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \data_r[18]_i_1 
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(sclk_r_reg_n_0),
        .I2(curr_state_r__0[1]),
        .I3(curr_state_r__0[0]),
        .I4(\data_r[18]_i_2_n_0 ),
        .I5(\data_r[18]_i_3_n_0 ),
        .O(\data_r[18]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \data_r[18]_i_2 
       (.I0(curr_state_r__0[2]),
        .I1(curr_state_r__0[3]),
        .O(\data_r[18]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \data_r[18]_i_3 
       (.I0(\clk_divider_r_reg_n_0_[2] ),
        .I1(\clk_divider_r_reg_n_0_[4] ),
        .I2(\clk_divider_r_reg_n_0_[7] ),
        .O(\data_r[18]_i_3_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[0] ),
        .Q(\data_r_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[10] ),
        .Q(\data_r_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[11] ),
        .Q(\data_r_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[12] ),
        .Q(\data_r_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[13] ),
        .Q(\data_r_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[14] ),
        .Q(\data_r_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\<const1> ),
        .Q(\data_r_reg_n_0_[18] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[1] ),
        .Q(\data_r_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[2] ),
        .Q(\data_r_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[3] ),
        .Q(\data_r_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[4] ),
        .Q(\data_r_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[5] ),
        .Q(\data_r_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[7] ),
        .Q(\data_r_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[8] ),
        .Q(\data_r_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \data_r_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_r[18]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\rom_data_r_reg_n_0_[9] ),
        .Q(\data_r_reg_n_0_[9] ));
  OBUF finished_out_OBUF_inst
       (.I(finished_out_OBUF),
        .O(finished_out));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    finished_out_i_1
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(curr_state_r__0[1]),
        .I2(curr_state_r__0[3]),
        .I3(curr_state_r__0[2]),
        .I4(finished_out_i_2_n_0),
        .I5(\data_r[18]_i_3_n_0 ),
        .O(finished_out_i_1_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    finished_out_i_2
       (.I0(sclk_r_reg_n_0),
        .I1(curr_state_r__0[0]),
        .O(finished_out_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    finished_out_reg
       (.C(clk_IBUF_BUFG),
        .CE(finished_out_i_1_n_0),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(\<const1> ),
        .Q(finished_out_OBUF));
  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \param_counter_r[3]_i_1 
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(curr_state_r__0[2]),
        .I2(sclk_r_reg_n_0),
        .I3(\FSM_sequential_curr_state_r[3]_i_6_n_0 ),
        .I4(\param_status_out[3]_i_3_n_0 ),
        .I5(\data_r[18]_i_3_n_0 ),
        .O(\param_counter_r[3]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \param_counter_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_counter_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[0]),
        .Q(param_counter_r_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \param_counter_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_counter_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[1]),
        .Q(param_counter_r_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \param_counter_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_counter_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[2]),
        .Q(param_counter_r_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \param_counter_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_counter_r[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[3]),
        .Q(param_counter_r_reg[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \param_status_out[0]_i_1 
       (.I0(param_counter_r_reg[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \param_status_out[1]_i_1 
       (.I0(param_counter_r_reg[0]),
        .I1(param_counter_r_reg[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \param_status_out[2]_i_1 
       (.I0(param_counter_r_reg[2]),
        .I1(param_counter_r_reg[1]),
        .I2(param_counter_r_reg[0]),
        .O(p_0_in[2]));
  LUT5 #(
    .INIT(32'h00002000)) 
    \param_status_out[3]_i_1 
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(sclk_r_reg_n_0),
        .I2(curr_state_r__0[2]),
        .I3(\param_status_out[3]_i_3_n_0 ),
        .I4(\data_r[18]_i_3_n_0 ),
        .O(\param_status_out[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \param_status_out[3]_i_2 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[0]),
        .I2(param_counter_r_reg[1]),
        .I3(param_counter_r_reg[2]),
        .O(p_0_in[3]));
  LUT3 #(
    .INIT(8'h40)) 
    \param_status_out[3]_i_3 
       (.I0(curr_state_r__0[3]),
        .I1(curr_state_r__0[1]),
        .I2(curr_state_r__0[0]),
        .O(\param_status_out[3]_i_3_n_0 ));
  OBUF \param_status_out_OBUF[0]_inst 
       (.I(param_status_out_OBUF[0]),
        .O(param_status_out[0]));
  OBUF \param_status_out_OBUF[1]_inst 
       (.I(param_status_out_OBUF[1]),
        .O(param_status_out[1]));
  OBUF \param_status_out_OBUF[2]_inst 
       (.I(param_status_out_OBUF[2]),
        .O(param_status_out[2]));
  OBUF \param_status_out_OBUF[3]_inst 
       (.I(param_status_out_OBUF[3]),
        .O(param_status_out[3]));
  FDCE #(
    .INIT(1'b0)) 
    \param_status_out_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_status_out[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[0]),
        .Q(param_status_out_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \param_status_out_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_status_out[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[1]),
        .Q(param_status_out_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \param_status_out_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_status_out[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[2]),
        .Q(param_status_out_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \param_status_out_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\param_status_out[3]_i_1_n_0 ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(p_0_in[3]),
        .Q(param_status_out_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hE314)) 
    \rom_data_r[0]_i_1 
       (.I0(param_counter_r_reg[0]),
        .I1(param_counter_r_reg[3]),
        .I2(param_counter_r_reg[2]),
        .I3(param_counter_r_reg[1]),
        .O(rom_data_r[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h48AD)) 
    \rom_data_r[10]_i_1 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[0]),
        .I2(param_counter_r_reg[2]),
        .I3(param_counter_r_reg[1]),
        .O(rom_data_r[10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h1FED)) 
    \rom_data_r[11]_i_1 
       (.I0(param_counter_r_reg[0]),
        .I1(param_counter_r_reg[3]),
        .I2(param_counter_r_reg[1]),
        .I3(param_counter_r_reg[2]),
        .O(rom_data_r[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8801)) 
    \rom_data_r[12]_i_1 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[1]),
        .I2(param_counter_r_reg[0]),
        .I3(param_counter_r_reg[2]),
        .O(rom_data_r[12]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0F7E)) 
    \rom_data_r[13]_i_1 
       (.I0(param_counter_r_reg[2]),
        .I1(param_counter_r_reg[0]),
        .I2(param_counter_r_reg[1]),
        .I3(param_counter_r_reg[3]),
        .O(rom_data_r[13]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hEEEC)) 
    \rom_data_r[14]_i_1 
       (.I0(param_counter_r_reg[2]),
        .I1(param_counter_r_reg[3]),
        .I2(param_counter_r_reg[0]),
        .I3(param_counter_r_reg[1]),
        .O(rom_data_r[14]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \rom_data_r[1]_i_1 
       (.I0(param_counter_r_reg[0]),
        .I1(param_counter_r_reg[1]),
        .I2(param_counter_r_reg[3]),
        .I3(param_counter_r_reg[2]),
        .O(rom_data_r[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0004)) 
    \rom_data_r[2]_i_1 
       (.I0(param_counter_r_reg[1]),
        .I1(param_counter_r_reg[0]),
        .I2(param_counter_r_reg[3]),
        .I3(param_counter_r_reg[2]),
        .O(rom_data_r[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0BEA)) 
    \rom_data_r[3]_i_1 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[0]),
        .I2(param_counter_r_reg[2]),
        .I3(param_counter_r_reg[1]),
        .O(rom_data_r[3]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \rom_data_r[4]_i_1 
       (.I0(param_counter_r_reg[2]),
        .I1(param_counter_r_reg[1]),
        .I2(param_counter_r_reg[3]),
        .O(\rom_data_r[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'hE000)) 
    \rom_data_r[5]_i_1 
       (.I0(param_counter_r_reg[0]),
        .I1(param_counter_r_reg[3]),
        .I2(param_counter_r_reg[1]),
        .I3(param_counter_r_reg[2]),
        .O(rom_data_r[5]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hC88D)) 
    \rom_data_r[7]_i_1 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[2]),
        .I2(param_counter_r_reg[1]),
        .I3(param_counter_r_reg[0]),
        .O(rom_data_r[7]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hF19B)) 
    \rom_data_r[8]_i_1 
       (.I0(param_counter_r_reg[3]),
        .I1(param_counter_r_reg[1]),
        .I2(param_counter_r_reg[2]),
        .I3(param_counter_r_reg[0]),
        .O(rom_data_r[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h279C)) 
    \rom_data_r[9]_i_1 
       (.I0(param_counter_r_reg[2]),
        .I1(param_counter_r_reg[3]),
        .I2(param_counter_r_reg[0]),
        .I3(param_counter_r_reg[1]),
        .O(rom_data_r[9]));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[0]),
        .Q(\rom_data_r_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[10]),
        .Q(\rom_data_r_reg_n_0_[10] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[11]),
        .Q(\rom_data_r_reg_n_0_[11] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[12]),
        .Q(\rom_data_r_reg_n_0_[12] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[13]),
        .Q(\rom_data_r_reg_n_0_[13] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[14]),
        .Q(\rom_data_r_reg_n_0_[14] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[1]),
        .Q(\rom_data_r_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[2]),
        .Q(\rom_data_r_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[3]),
        .Q(\rom_data_r_reg_n_0_[3] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(\rom_data_r[4]_i_1_n_0 ),
        .Q(\rom_data_r_reg_n_0_[4] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[5]),
        .Q(\rom_data_r_reg_n_0_[5] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[7]),
        .Q(\rom_data_r_reg_n_0_[7] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[8]),
        .Q(\rom_data_r_reg_n_0_[8] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \rom_data_r_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(rom_data_r[9]),
        .Q(\rom_data_r_reg_n_0_[9] ),
        .R(\<const0> ));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  LUT6 #(
    .INIT(64'hFFFF23FF00002300)) 
    sclk_en_r_i_1
       (.I0(curr_state_r__0[1]),
        .I1(curr_state_r__0[3]),
        .I2(curr_state_r__0[2]),
        .I3(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I4(sclk_en_r_i_2_n_0),
        .I5(sclk_en_r_reg_n_0),
        .O(sclk_en_r_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFEFBFBFFFFFE)) 
    sclk_en_r_i_2
       (.I0(\data_r[18]_i_3_n_0 ),
        .I1(curr_state_r__0[2]),
        .I2(curr_state_r__0[3]),
        .I3(curr_state_r__0[0]),
        .I4(sclk_r_reg_n_0),
        .I5(curr_state_r__0[1]),
        .O(sclk_en_r_i_2_n_0));
  FDPE #(
    .INIT(1'b1)) 
    sclk_en_r_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(sclk_en_r_i_1_n_0),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(sclk_en_r_reg_n_0));
  LUT6 #(
    .INIT(64'h0F0BFFFF0F0B0000)) 
    sclk_force_r_i_1
       (.I0(curr_state_r__0[2]),
        .I1(curr_state_r__0[1]),
        .I2(curr_state_r__0[3]),
        .I3(sclk_r_reg_n_0),
        .I4(sclk_force_r_i_2_n_0),
        .I5(sclk_force_r_reg_n_0),
        .O(sclk_force_r_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000A02)) 
    sclk_force_r_i_2
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(curr_state_r__0[2]),
        .I2(curr_state_r__0[3]),
        .I3(curr_state_r__0[1]),
        .I4(sclk_r_reg_n_0),
        .I5(\data_r[18]_i_3_n_0 ),
        .O(sclk_force_r_i_2_n_0));
  FDPE #(
    .INIT(1'b1)) 
    sclk_force_r_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(sclk_force_r_i_1_n_0),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(sclk_force_r_reg_n_0));
  OBUF sclk_out_OBUF_inst
       (.I(sclk_out_OBUF),
        .O(sclk_out));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hEA)) 
    sclk_out_i_1
       (.I0(sclk_force_r_reg_n_0),
        .I1(sclk_en_r_reg_n_0),
        .I2(sclk_r_reg_n_0),
        .O(sclk_out0));
  FDCE #(
    .INIT(1'b0)) 
    sclk_out_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(sclk_out0),
        .Q(sclk_out_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    sclk_r_i_1
       (.I0(sclk_r),
        .I1(sclk_r_reg_n_0),
        .O(sclk_r_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000200)) 
    sclk_r_i_2
       (.I0(\FSM_sequential_curr_state_r[3]_i_7_n_0 ),
        .I1(sclk_r_i_3_n_0),
        .I2(\clk_divider_r_reg_n_0_[9] ),
        .I3(\clk_divider_r_reg_n_0_[10] ),
        .I4(\clk_divider_r_reg_n_0_[4] ),
        .O(sclk_r));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    sclk_r_i_3
       (.I0(\clk_divider_r_reg_n_0_[7] ),
        .I1(\clk_divider_r_reg_n_0_[6] ),
        .I2(\clk_divider_r_reg_n_0_[1] ),
        .I3(\clk_divider_r_reg_n_0_[2] ),
        .O(sclk_r_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sclk_r_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(sclk_r_i_1_n_0),
        .Q(sclk_r_reg_n_0));
  IOBUF sdat_inout_IOBUF_inst
       (.I(sdat_inout_OBUF),
        .IO(sdat_inout),
        .O(sdat_inout_IBUF),
        .T(sdat_inout_TRI));
  FDCE #(
    .INIT(1'b0)) 
    sdat_inout_IOBUF_inst_i_1
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .D(sdat_inout_IOBUF_inst_i_2_n_0),
        .Q(sdat_inout_TRI));
  LUT1 #(
    .INIT(2'h1)) 
    sdat_inout_IOBUF_inst_i_2
       (.I0(sdat_inout_IOBUF_inst_i_3_n_0),
        .O(sdat_inout_IOBUF_inst_i_2_n_0));
  LUT4 #(
    .INIT(16'h2F20)) 
    sdat_inout_IOBUF_inst_i_3
       (.I0(sdat_inout_retimed_i_10_n_0),
        .I1(\clk_divider_r[10]_i_3_n_0 ),
        .I2(sdat_inout_retimed_i_5_n_0),
        .I3(sdat_inout_IOBUF_inst_i_4_n_0),
        .O(sdat_inout_IOBUF_inst_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    sdat_inout_IOBUF_inst_i_4
       (.I0(sdat_inout_TRI),
        .O(sdat_inout_IOBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFF4FFFFFFF40000)) 
    sdat_inout_retimed_i_1
       (.I0(curr_state_r__0[0]),
        .I1(sdat_inout_retimed_i_2_n_0),
        .I2(sdat_inout_retimed_i_3_n_0),
        .I3(sdat_inout_retimed_i_4_n_0),
        .I4(sdat_inout_retimed_i_5_n_0),
        .I5(sdat_inout_OBUF),
        .O(sdat_inout_retimed_i_1_n_0));
  LUT4 #(
    .INIT(16'h0031)) 
    sdat_inout_retimed_i_10
       (.I0(curr_state_r__0[2]),
        .I1(curr_state_r__0[3]),
        .I2(curr_state_r__0[1]),
        .I3(sclk_r_reg_n_0),
        .O(sdat_inout_retimed_i_10_n_0));
  LUT5 #(
    .INIT(32'hE2CCE200)) 
    sdat_inout_retimed_i_11
       (.I0(\data_r_reg_n_0_[9] ),
        .I1(\bit_counter_r_reg_n_0_[1] ),
        .I2(\data_r_reg_n_0_[11] ),
        .I3(\bit_counter_r_reg_n_0_[0] ),
        .I4(\data_r_reg_n_0_[10] ),
        .O(sdat_inout_retimed_i_11_n_0));
  LUT6 #(
    .INIT(64'h000A02A2A0AA02A2)) 
    sdat_inout_retimed_i_12
       (.I0(\bit_counter_r_reg_n_0_[2] ),
        .I1(\data_r_reg_n_0_[4] ),
        .I2(\bit_counter_r_reg_n_0_[0] ),
        .I3(\data_r_reg_n_0_[5] ),
        .I4(\bit_counter_r_reg_n_0_[1] ),
        .I5(\data_r_reg_n_0_[7] ),
        .O(sdat_inout_retimed_i_12_n_0));
  LUT6 #(
    .INIT(64'h05F5030305F5F3F3)) 
    sdat_inout_retimed_i_13
       (.I0(\data_r_reg_n_0_[1] ),
        .I1(\data_r_reg_n_0_[0] ),
        .I2(\bit_counter_r_reg_n_0_[1] ),
        .I3(\data_r_reg_n_0_[3] ),
        .I4(\bit_counter_r_reg_n_0_[0] ),
        .I5(\data_r_reg_n_0_[2] ),
        .O(sdat_inout_retimed_i_13_n_0));
  LUT3 #(
    .INIT(8'h23)) 
    sdat_inout_retimed_i_2
       (.I0(sclk_r_reg_n_0),
        .I1(curr_state_r__0[3]),
        .I2(curr_state_r__0[1]),
        .O(sdat_inout_retimed_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFF200F200000000)) 
    sdat_inout_retimed_i_3
       (.I0(sdat_inout_retimed_i_6_n_0),
        .I1(sdat_inout_retimed_i_7_n_0),
        .I2(sdat_inout_retimed_i_8_n_0),
        .I3(\bit_counter_r_reg_n_0_[4] ),
        .I4(sdat_inout_retimed_i_9_n_0),
        .I5(\param_status_out[3]_i_3_n_0 ),
        .O(sdat_inout_retimed_i_3_n_0));
  LUT5 #(
    .INIT(32'h0C0A000A)) 
    sdat_inout_retimed_i_4
       (.I0(sclk_r_reg_n_0),
        .I1(curr_state_r__0[2]),
        .I2(curr_state_r__0[3]),
        .I3(curr_state_r__0[1]),
        .I4(curr_state_r__0[0]),
        .O(sdat_inout_retimed_i_4_n_0));
  LUT6 #(
    .INIT(64'h00000000AAAA0002)) 
    sdat_inout_retimed_i_5
       (.I0(\FSM_sequential_curr_state_r[3]_i_4_n_0 ),
        .I1(curr_state_r__0[3]),
        .I2(sclk_r_reg_n_0),
        .I3(curr_state_r__0[0]),
        .I4(sdat_inout_retimed_i_10_n_0),
        .I5(\data_r[18]_i_3_n_0 ),
        .O(sdat_inout_retimed_i_5_n_0));
  LUT6 #(
    .INIT(64'hA8A8A8AAA8A8A8A8)) 
    sdat_inout_retimed_i_6
       (.I0(\bit_counter_r_reg_n_0_[3] ),
        .I1(sdat_inout_retimed_i_11_n_0),
        .I2(\bit_counter_r_reg_n_0_[2] ),
        .I3(\bit_counter_r_reg_n_0_[0] ),
        .I4(\bit_counter_r_reg_n_0_[1] ),
        .I5(\data_r_reg_n_0_[8] ),
        .O(sdat_inout_retimed_i_6_n_0));
  LUT6 #(
    .INIT(64'hA0A002A2AAAA02A2)) 
    sdat_inout_retimed_i_7
       (.I0(\bit_counter_r_reg_n_0_[2] ),
        .I1(\data_r_reg_n_0_[12] ),
        .I2(\bit_counter_r_reg_n_0_[0] ),
        .I3(\data_r_reg_n_0_[13] ),
        .I4(\bit_counter_r_reg_n_0_[1] ),
        .I5(\data_r_reg_n_0_[14] ),
        .O(sdat_inout_retimed_i_7_n_0));
  LUT4 #(
    .INIT(16'h1011)) 
    sdat_inout_retimed_i_8
       (.I0(sdat_inout_retimed_i_12_n_0),
        .I1(\bit_counter_r_reg_n_0_[3] ),
        .I2(\bit_counter_r_reg_n_0_[2] ),
        .I3(sdat_inout_retimed_i_13_n_0),
        .O(sdat_inout_retimed_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000C40)) 
    sdat_inout_retimed_i_9
       (.I0(\bit_counter_r_reg_n_0_[0] ),
        .I1(\data_r_reg_n_0_[18] ),
        .I2(\bit_counter_r_reg_n_0_[1] ),
        .I3(\bit_counter_r_reg_n_0_[2] ),
        .I4(\bit_counter_r_reg_n_0_[3] ),
        .O(sdat_inout_retimed_i_9_n_0));
  FDPE #(
    .INIT(1'b1)) 
    sdat_inout_retimed_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(sdat_inout_retimed_i_1_n_0),
        .PRE(\FSM_sequential_curr_state_r[3]_i_3_n_0 ),
        .Q(sdat_inout_OBUF));
endmodule
