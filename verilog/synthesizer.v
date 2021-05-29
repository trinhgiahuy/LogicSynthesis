// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Fri Jul 20 14:39:07 2018
// Host        : WS-11695-PC running 64-bit major release  (build 9200)
// Command     : write_verilog P:/pynq/proj/synth_premade/synthesizer.v
// Design      : synthesizer
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module adder
   (S,
    Q,
    \counter_r_reg[14] ,
    \counter_r_reg[6] ,
    \counter_r_reg[10] ,
    \counter_r_reg[14]_0 ,
    \counter_r_reg[15] ,
    \counter_r_reg[15]_0 ,
    \result_r_reg[16]_0 ,
    CLK,
    rst_n,
    D);
  output [0:0]S;
  output [13:0]Q;
  input [11:0]\counter_r_reg[14] ;
  input [3:0]\counter_r_reg[6] ;
  input [3:0]\counter_r_reg[10] ;
  input [3:0]\counter_r_reg[14]_0 ;
  input [0:0]\counter_r_reg[15] ;
  input [0:0]\counter_r_reg[15]_0 ;
  input [0:0]\result_r_reg[16]_0 ;
  input CLK;
  input rst_n;
  input [1:0]D;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [1:0]D;
  wire [13:0]Q;
  wire [0:0]S;
  wire [3:0]\counter_r_reg[10] ;
  wire [11:0]\counter_r_reg[14] ;
  wire [3:0]\counter_r_reg[14]_0 ;
  wire [0:0]\counter_r_reg[15] ;
  wire [0:0]\counter_r_reg[15]_0 ;
  wire [3:0]\counter_r_reg[6] ;
  wire [16:4]p_0_in;
  wire [16:16]result_r;
  wire result_r0__0_carry__0_n_0;
  wire result_r0__0_carry__0_n_1;
  wire result_r0__0_carry__0_n_2;
  wire result_r0__0_carry__0_n_3;
  wire result_r0__0_carry__1_n_0;
  wire result_r0__0_carry__1_n_1;
  wire result_r0__0_carry__1_n_2;
  wire result_r0__0_carry__1_n_3;
  wire result_r0__0_carry__2_n_3;
  wire result_r0__0_carry_n_0;
  wire result_r0__0_carry_n_1;
  wire result_r0__0_carry_n_2;
  wire result_r0__0_carry_n_3;
  wire [0:0]\result_r_reg[16]_0 ;
  wire rst_n;
  wire [3:0]NLW_result_r0__0_carry_O_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  CARRY4 result_r0__0_carry
       (.CI(\<const0> ),
        .CO({result_r0__0_carry_n_0,result_r0__0_carry_n_1,result_r0__0_carry_n_2,result_r0__0_carry_n_3}),
        .CYINIT(\<const0> ),
        .DI(\counter_r_reg[14] [3:0]),
        .O({p_0_in[6:4],NLW_result_r0__0_carry_O_UNCONNECTED[0]}),
        .S(\counter_r_reg[6] ));
  CARRY4 result_r0__0_carry__0
       (.CI(result_r0__0_carry_n_0),
        .CO({result_r0__0_carry__0_n_0,result_r0__0_carry__0_n_1,result_r0__0_carry__0_n_2,result_r0__0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI(\counter_r_reg[14] [7:4]),
        .O(p_0_in[10:7]),
        .S(\counter_r_reg[10] ));
  CARRY4 result_r0__0_carry__1
       (.CI(result_r0__0_carry__0_n_0),
        .CO({result_r0__0_carry__1_n_0,result_r0__0_carry__1_n_1,result_r0__0_carry__1_n_2,result_r0__0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI(\counter_r_reg[14] [11:8]),
        .O(p_0_in[14:11]),
        .S(\counter_r_reg[14]_0 ));
  CARRY4 result_r0__0_carry__2
       (.CI(result_r0__0_carry__1_n_0),
        .CO(result_r0__0_carry__2_n_3),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\counter_r_reg[15] }),
        .O(p_0_in[16:15]),
        .S({\<const0> ,\<const0> ,\<const1> ,\counter_r_reg[15]_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[16]_i_2 
       (.I0(result_r),
        .I1(\result_r_reg[16]_0 ),
        .O(S));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[10]),
        .Q(Q[8]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[11]),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[12]),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[13]),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[14]),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[15]),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[16] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[16]),
        .Q(result_r));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(D[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(D[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[4]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[5]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[6]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[7]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[8]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(p_0_in[9]),
        .Q(Q[7]));
endmodule

(* ORIG_REF_NAME = "adder" *) 
module adder_0
   (\result_r_reg[16]_0 ,
    Q,
    \counter_r_reg[14] ,
    S,
    \counter_r_reg[8] ,
    \counter_r_reg[12] ,
    DI,
    \counter_r_reg[15] ,
    rst_n_IBUF,
    CLK,
    \counter_r_reg[1] );
  output \result_r_reg[16]_0 ;
  output [15:0]Q;
  input [13:0]\counter_r_reg[14] ;
  input [3:0]S;
  input [3:0]\counter_r_reg[8] ;
  input [3:0]\counter_r_reg[12] ;
  input [0:0]DI;
  input [2:0]\counter_r_reg[15] ;
  input rst_n_IBUF;
  input CLK;
  input [0:0]\counter_r_reg[1] ;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [0:0]DI;
  wire [15:0]Q;
  wire [3:0]S;
  wire [3:0]\counter_r_reg[12] ;
  wire [13:0]\counter_r_reg[14] ;
  wire [2:0]\counter_r_reg[15] ;
  wire [0:0]\counter_r_reg[1] ;
  wire [3:0]\counter_r_reg[8] ;
  wire result_r0__0_carry__0_n_0;
  wire result_r0__0_carry__0_n_1;
  wire result_r0__0_carry__0_n_2;
  wire result_r0__0_carry__0_n_3;
  wire result_r0__0_carry__0_n_4;
  wire result_r0__0_carry__0_n_5;
  wire result_r0__0_carry__0_n_6;
  wire result_r0__0_carry__0_n_7;
  wire result_r0__0_carry__1_n_0;
  wire result_r0__0_carry__1_n_1;
  wire result_r0__0_carry__1_n_2;
  wire result_r0__0_carry__1_n_3;
  wire result_r0__0_carry__1_n_4;
  wire result_r0__0_carry__1_n_5;
  wire result_r0__0_carry__1_n_6;
  wire result_r0__0_carry__1_n_7;
  wire result_r0__0_carry__2_n_1;
  wire result_r0__0_carry__2_n_2;
  wire result_r0__0_carry__2_n_3;
  wire result_r0__0_carry__2_n_4;
  wire result_r0__0_carry__2_n_5;
  wire result_r0__0_carry__2_n_6;
  wire result_r0__0_carry__2_n_7;
  wire result_r0__0_carry_n_0;
  wire result_r0__0_carry_n_1;
  wire result_r0__0_carry_n_2;
  wire result_r0__0_carry_n_3;
  wire result_r0__0_carry_n_4;
  wire result_r0__0_carry_n_5;
  wire result_r0__0_carry_n_6;
  wire \result_r_reg[16]_0 ;
  wire rst_n_IBUF;
  wire [3:0]NLW_result_r0__0_carry_O_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT1 #(
    .INIT(2'h1)) 
    \aud_bclk_div_r[1]_i_2 
       (.I0(rst_n_IBUF),
        .O(\result_r_reg[16]_0 ));
  CARRY4 result_r0__0_carry
       (.CI(\<const0> ),
        .CO({result_r0__0_carry_n_0,result_r0__0_carry_n_1,result_r0__0_carry_n_2,result_r0__0_carry_n_3}),
        .CYINIT(\<const0> ),
        .DI(\counter_r_reg[14] [3:0]),
        .O({result_r0__0_carry_n_4,result_r0__0_carry_n_5,result_r0__0_carry_n_6,NLW_result_r0__0_carry_O_UNCONNECTED[0]}),
        .S(S));
  CARRY4 result_r0__0_carry__0
       (.CI(result_r0__0_carry_n_0),
        .CO({result_r0__0_carry__0_n_0,result_r0__0_carry__0_n_1,result_r0__0_carry__0_n_2,result_r0__0_carry__0_n_3}),
        .CYINIT(\<const0> ),
        .DI(\counter_r_reg[14] [7:4]),
        .O({result_r0__0_carry__0_n_4,result_r0__0_carry__0_n_5,result_r0__0_carry__0_n_6,result_r0__0_carry__0_n_7}),
        .S(\counter_r_reg[8] ));
  CARRY4 result_r0__0_carry__1
       (.CI(result_r0__0_carry__0_n_0),
        .CO({result_r0__0_carry__1_n_0,result_r0__0_carry__1_n_1,result_r0__0_carry__1_n_2,result_r0__0_carry__1_n_3}),
        .CYINIT(\<const0> ),
        .DI(\counter_r_reg[14] [11:8]),
        .O({result_r0__0_carry__1_n_4,result_r0__0_carry__1_n_5,result_r0__0_carry__1_n_6,result_r0__0_carry__1_n_7}),
        .S(\counter_r_reg[12] ));
  CARRY4 result_r0__0_carry__2
       (.CI(result_r0__0_carry__1_n_0),
        .CO({result_r0__0_carry__2_n_1,result_r0__0_carry__2_n_2,result_r0__0_carry__2_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,DI,\counter_r_reg[14] [13:12]}),
        .O({result_r0__0_carry__2_n_4,result_r0__0_carry__2_n_5,result_r0__0_carry__2_n_6,result_r0__0_carry__2_n_7}),
        .S({\<const1> ,\counter_r_reg[15] }));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__1_n_6),
        .Q(Q[9]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__1_n_5),
        .Q(Q[10]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__1_n_4),
        .Q(Q[11]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__2_n_7),
        .Q(Q[12]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__2_n_6),
        .Q(Q[13]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__2_n_5),
        .Q(Q[14]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[16] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__2_n_4),
        .Q(Q[15]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(\counter_r_reg[1] ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry_n_6),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry_n_5),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry_n_4),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__0_n_7),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__0_n_6),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__0_n_5),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__0_n_4),
        .Q(Q[7]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(\result_r_reg[16]_0 ),
        .D(result_r0__0_carry__1_n_7),
        .Q(Q[8]));
endmodule

(* ORIG_REF_NAME = "adder" *) 
module adder__parameterized2
   (\locked_input_r_reg[15] ,
    result_r0_in,
    S,
    Q,
    CLK,
    rst_n);
  output [15:0]\locked_input_r_reg[15] ;
  input [13:0]result_r0_in;
  input [0:0]S;
  input [14:0]Q;
  input CLK;
  input rst_n;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [14:0]Q;
  wire [0:0]S;
  wire [15:0]\locked_input_r_reg[15] ;
  wire [13:0]result_r0_in;
  wire \result_r[13]_i_2_n_0 ;
  wire \result_r[13]_i_3_n_0 ;
  wire \result_r[13]_i_4_n_0 ;
  wire \result_r[13]_i_5_n_0 ;
  wire \result_r[16]_i_3_n_0 ;
  wire \result_r[16]_i_4_n_0 ;
  wire \result_r[2]_i_1_n_0 ;
  wire \result_r[5]_i_2_n_0 ;
  wire \result_r[5]_i_3_n_0 ;
  wire \result_r[5]_i_4_n_0 ;
  wire \result_r[5]_i_5_n_0 ;
  wire \result_r[9]_i_2_n_0 ;
  wire \result_r[9]_i_3_n_0 ;
  wire \result_r[9]_i_4_n_0 ;
  wire \result_r[9]_i_5_n_0 ;
  wire \result_r_reg[13]_i_1_n_0 ;
  wire \result_r_reg[13]_i_1_n_1 ;
  wire \result_r_reg[13]_i_1_n_2 ;
  wire \result_r_reg[13]_i_1_n_3 ;
  wire \result_r_reg[13]_i_1_n_4 ;
  wire \result_r_reg[13]_i_1_n_5 ;
  wire \result_r_reg[13]_i_1_n_6 ;
  wire \result_r_reg[13]_i_1_n_7 ;
  wire \result_r_reg[16]_i_1_n_2 ;
  wire \result_r_reg[16]_i_1_n_3 ;
  wire \result_r_reg[16]_i_1_n_5 ;
  wire \result_r_reg[16]_i_1_n_6 ;
  wire \result_r_reg[16]_i_1_n_7 ;
  wire \result_r_reg[5]_i_1_n_0 ;
  wire \result_r_reg[5]_i_1_n_1 ;
  wire \result_r_reg[5]_i_1_n_2 ;
  wire \result_r_reg[5]_i_1_n_3 ;
  wire \result_r_reg[5]_i_1_n_4 ;
  wire \result_r_reg[5]_i_1_n_5 ;
  wire \result_r_reg[5]_i_1_n_6 ;
  wire \result_r_reg[9]_i_1_n_0 ;
  wire \result_r_reg[9]_i_1_n_1 ;
  wire \result_r_reg[9]_i_1_n_2 ;
  wire \result_r_reg[9]_i_1_n_3 ;
  wire \result_r_reg[9]_i_1_n_4 ;
  wire \result_r_reg[9]_i_1_n_5 ;
  wire \result_r_reg[9]_i_1_n_6 ;
  wire \result_r_reg[9]_i_1_n_7 ;
  wire rst_n;
  wire [3:0]\NLW_result_r_reg[5]_i_1_O_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[13]_i_2 
       (.I0(result_r0_in[11]),
        .I1(Q[12]),
        .O(\result_r[13]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[13]_i_3 
       (.I0(result_r0_in[10]),
        .I1(Q[11]),
        .O(\result_r[13]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[13]_i_4 
       (.I0(result_r0_in[9]),
        .I1(Q[10]),
        .O(\result_r[13]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[13]_i_5 
       (.I0(result_r0_in[8]),
        .I1(Q[9]),
        .O(\result_r[13]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[16]_i_3 
       (.I0(result_r0_in[13]),
        .I1(Q[14]),
        .O(\result_r[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[16]_i_4 
       (.I0(result_r0_in[12]),
        .I1(Q[13]),
        .O(\result_r[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[2]_i_1 
       (.I0(result_r0_in[0]),
        .I1(Q[1]),
        .O(\result_r[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[5]_i_2 
       (.I0(result_r0_in[3]),
        .I1(Q[4]),
        .O(\result_r[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[5]_i_3 
       (.I0(result_r0_in[2]),
        .I1(Q[3]),
        .O(\result_r[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[5]_i_4 
       (.I0(result_r0_in[1]),
        .I1(Q[2]),
        .O(\result_r[5]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[5]_i_5 
       (.I0(result_r0_in[0]),
        .I1(Q[1]),
        .O(\result_r[5]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[9]_i_2 
       (.I0(result_r0_in[7]),
        .I1(Q[8]),
        .O(\result_r[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[9]_i_3 
       (.I0(result_r0_in[6]),
        .I1(Q[7]),
        .O(\result_r[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[9]_i_4 
       (.I0(result_r0_in[5]),
        .I1(Q[6]),
        .O(\result_r[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[9]_i_5 
       (.I0(result_r0_in[4]),
        .I1(Q[5]),
        .O(\result_r[9]_i_5_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[13]_i_1_n_7 ),
        .Q(\locked_input_r_reg[15] [9]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[13]_i_1_n_6 ),
        .Q(\locked_input_r_reg[15] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[13]_i_1_n_5 ),
        .Q(\locked_input_r_reg[15] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[13]_i_1_n_4 ),
        .Q(\locked_input_r_reg[15] [12]));
  CARRY4 \result_r_reg[13]_i_1 
       (.CI(\result_r_reg[9]_i_1_n_0 ),
        .CO({\result_r_reg[13]_i_1_n_0 ,\result_r_reg[13]_i_1_n_1 ,\result_r_reg[13]_i_1_n_2 ,\result_r_reg[13]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI(result_r0_in[11:8]),
        .O({\result_r_reg[13]_i_1_n_4 ,\result_r_reg[13]_i_1_n_5 ,\result_r_reg[13]_i_1_n_6 ,\result_r_reg[13]_i_1_n_7 }),
        .S({\result_r[13]_i_2_n_0 ,\result_r[13]_i_3_n_0 ,\result_r[13]_i_4_n_0 ,\result_r[13]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[16]_i_1_n_7 ),
        .Q(\locked_input_r_reg[15] [13]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[16]_i_1_n_6 ),
        .Q(\locked_input_r_reg[15] [14]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[16] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[16]_i_1_n_5 ),
        .Q(\locked_input_r_reg[15] [15]));
  CARRY4 \result_r_reg[16]_i_1 
       (.CI(\result_r_reg[13]_i_1_n_0 ),
        .CO({\result_r_reg[16]_i_1_n_2 ,\result_r_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,result_r0_in[13:12]}),
        .O({\result_r_reg[16]_i_1_n_5 ,\result_r_reg[16]_i_1_n_6 ,\result_r_reg[16]_i_1_n_7 }),
        .S({\<const0> ,S,\result_r[16]_i_3_n_0 ,\result_r[16]_i_4_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(Q[0]),
        .Q(\locked_input_r_reg[15] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r[2]_i_1_n_0 ),
        .Q(\locked_input_r_reg[15] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[5]_i_1_n_6 ),
        .Q(\locked_input_r_reg[15] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[5]_i_1_n_5 ),
        .Q(\locked_input_r_reg[15] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[5]_i_1_n_4 ),
        .Q(\locked_input_r_reg[15] [4]));
  CARRY4 \result_r_reg[5]_i_1 
       (.CI(\<const0> ),
        .CO({\result_r_reg[5]_i_1_n_0 ,\result_r_reg[5]_i_1_n_1 ,\result_r_reg[5]_i_1_n_2 ,\result_r_reg[5]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI(result_r0_in[3:0]),
        .O({\result_r_reg[5]_i_1_n_4 ,\result_r_reg[5]_i_1_n_5 ,\result_r_reg[5]_i_1_n_6 ,\NLW_result_r_reg[5]_i_1_O_UNCONNECTED [0]}),
        .S({\result_r[5]_i_2_n_0 ,\result_r[5]_i_3_n_0 ,\result_r[5]_i_4_n_0 ,\result_r[5]_i_5_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[9]_i_1_n_7 ),
        .Q(\locked_input_r_reg[15] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[9]_i_1_n_6 ),
        .Q(\locked_input_r_reg[15] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[9]_i_1_n_5 ),
        .Q(\locked_input_r_reg[15] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \result_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\result_r_reg[9]_i_1_n_4 ),
        .Q(\locked_input_r_reg[15] [8]));
  CARRY4 \result_r_reg[9]_i_1 
       (.CI(\result_r_reg[5]_i_1_n_0 ),
        .CO({\result_r_reg[9]_i_1_n_0 ,\result_r_reg[9]_i_1_n_1 ,\result_r_reg[9]_i_1_n_2 ,\result_r_reg[9]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI(result_r0_in[7:4]),
        .O({\result_r_reg[9]_i_1_n_4 ,\result_r_reg[9]_i_1_n_5 ,\result_r_reg[9]_i_1_n_6 ,\result_r_reg[9]_i_1_n_7 }),
        .S({\result_r[9]_i_2_n_0 ,\result_r[9]_i_3_n_0 ,\result_r[9]_i_4_n_0 ,\result_r[9]_i_5_n_0 }));
endmodule

module audio_ctrl
   (aud_bclk_out_OBUF,
    aud_lrclk_out_OBUF,
    Q,
    CLK,
    rst_n,
    \result_r_reg[16] );
  output aud_bclk_out_OBUF;
  output aud_lrclk_out_OBUF;
  output [0:0]Q;
  input CLK;
  input rst_n;
  input [15:0]\result_r_reg[16] ;

  wire \<const1> ;
  wire CLK;
  wire [0:0]Q;
  wire [1:0]aud_bclk_div_r;
  wire \aud_bclk_div_r[0]_i_1_n_0 ;
  wire \aud_bclk_div_r[1]_i_1_n_0 ;
  wire aud_bclk_out_OBUF;
  wire aud_bclk_r_i_1_n_0;
  wire aud_lrclk_out_OBUF;
  wire aud_lrclk_r__0;
  wire aud_lrclk_r_i_1_n_0;
  wire [30:0]locked_input_r;
  wire locked_input_r1__3;
  wire \locked_input_r[0]_i_1_n_0 ;
  wire \locked_input_r[10]_i_1_n_0 ;
  wire \locked_input_r[11]_i_1_n_0 ;
  wire \locked_input_r[12]_i_1_n_0 ;
  wire \locked_input_r[13]_i_1_n_0 ;
  wire \locked_input_r[14]_i_1_n_0 ;
  wire \locked_input_r[15]_i_1_n_0 ;
  wire \locked_input_r[16]_i_1_n_0 ;
  wire \locked_input_r[17]_i_1_n_0 ;
  wire \locked_input_r[18]_i_1_n_0 ;
  wire \locked_input_r[19]_i_1_n_0 ;
  wire \locked_input_r[1]_i_1_n_0 ;
  wire \locked_input_r[20]_i_1_n_0 ;
  wire \locked_input_r[21]_i_1_n_0 ;
  wire \locked_input_r[22]_i_1_n_0 ;
  wire \locked_input_r[23]_i_1_n_0 ;
  wire \locked_input_r[24]_i_1_n_0 ;
  wire \locked_input_r[25]_i_1_n_0 ;
  wire \locked_input_r[26]_i_1_n_0 ;
  wire \locked_input_r[27]_i_1_n_0 ;
  wire \locked_input_r[28]_i_1_n_0 ;
  wire \locked_input_r[29]_i_1_n_0 ;
  wire \locked_input_r[2]_i_1_n_0 ;
  wire \locked_input_r[30]_i_1_n_0 ;
  wire \locked_input_r[31]_i_1_n_0 ;
  wire \locked_input_r[3]_i_1_n_0 ;
  wire \locked_input_r[4]_i_1_n_0 ;
  wire \locked_input_r[5]_i_1_n_0 ;
  wire \locked_input_r[6]_i_1_n_0 ;
  wire \locked_input_r[7]_i_1_n_0 ;
  wire \locked_input_r[8]_i_1_n_0 ;
  wire \locked_input_r[9]_i_1_n_0 ;
  wire [15:0]\result_r_reg[16] ;
  wire rst_n;
  wire sel_counter_r;
  wire \sel_counter_r[0]_i_1_n_0 ;
  wire \sel_counter_r[1]_i_1_n_0 ;
  wire \sel_counter_r[2]_i_1_n_0 ;
  wire \sel_counter_r[3]_i_2_n_0 ;
  wire \sel_counter_r_reg_n_0_[0] ;
  wire \sel_counter_r_reg_n_0_[1] ;
  wire \sel_counter_r_reg_n_0_[2] ;
  wire \sel_counter_r_reg_n_0_[3] ;

  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \aud_bclk_div_r[0]_i_1 
       (.I0(aud_bclk_div_r[0]),
        .O(\aud_bclk_div_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \aud_bclk_div_r[1]_i_1 
       (.I0(aud_bclk_div_r[1]),
        .I1(aud_bclk_div_r[0]),
        .O(\aud_bclk_div_r[1]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \aud_bclk_div_r_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\aud_bclk_div_r[0]_i_1_n_0 ),
        .Q(aud_bclk_div_r[0]));
  FDCE #(
    .INIT(1'b0)) 
    \aud_bclk_div_r_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\aud_bclk_div_r[1]_i_1_n_0 ),
        .Q(aud_bclk_div_r[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    aud_bclk_r_i_1
       (.I0(aud_bclk_div_r[1]),
        .I1(aud_bclk_div_r[0]),
        .I2(aud_bclk_out_OBUF),
        .O(aud_bclk_r_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    aud_bclk_r_reg
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(aud_bclk_r_i_1_n_0),
        .Q(aud_bclk_out_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    aud_lrclk_r_i_1
       (.I0(aud_lrclk_r__0),
        .I1(aud_bclk_out_OBUF),
        .I2(aud_bclk_div_r[0]),
        .I3(aud_bclk_div_r[1]),
        .I4(aud_lrclk_out_OBUF),
        .O(aud_lrclk_r_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    aud_lrclk_r_i_2
       (.I0(\sel_counter_r_reg_n_0_[3] ),
        .I1(\sel_counter_r_reg_n_0_[2] ),
        .I2(\sel_counter_r_reg_n_0_[0] ),
        .I3(\sel_counter_r_reg_n_0_[1] ),
        .O(aud_lrclk_r__0));
  FDCE #(
    .INIT(1'b0)) 
    aud_lrclk_r_reg
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(aud_lrclk_r_i_1_n_0),
        .Q(aud_lrclk_out_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[0]_i_1 
       (.I0(\result_r_reg[16] [0]),
        .I1(locked_input_r1__3),
        .I2(Q),
        .O(\locked_input_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[10]_i_1 
       (.I0(\result_r_reg[16] [10]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[9]),
        .O(\locked_input_r[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[11]_i_1 
       (.I0(\result_r_reg[16] [11]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[10]),
        .O(\locked_input_r[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[12]_i_1 
       (.I0(\result_r_reg[16] [12]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[11]),
        .O(\locked_input_r[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[13]_i_1 
       (.I0(\result_r_reg[16] [13]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[12]),
        .O(\locked_input_r[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[14]_i_1 
       (.I0(\result_r_reg[16] [14]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[13]),
        .O(\locked_input_r[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[15]_i_1 
       (.I0(\result_r_reg[16] [15]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[14]),
        .O(\locked_input_r[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[16]_i_1 
       (.I0(\result_r_reg[16] [0]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[15]),
        .O(\locked_input_r[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[17]_i_1 
       (.I0(\result_r_reg[16] [1]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[16]),
        .O(\locked_input_r[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[18]_i_1 
       (.I0(\result_r_reg[16] [2]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[17]),
        .O(\locked_input_r[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[19]_i_1 
       (.I0(\result_r_reg[16] [3]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[18]),
        .O(\locked_input_r[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[1]_i_1 
       (.I0(\result_r_reg[16] [1]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[0]),
        .O(\locked_input_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[20]_i_1 
       (.I0(\result_r_reg[16] [4]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[19]),
        .O(\locked_input_r[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[21]_i_1 
       (.I0(\result_r_reg[16] [5]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[20]),
        .O(\locked_input_r[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[22]_i_1 
       (.I0(\result_r_reg[16] [6]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[21]),
        .O(\locked_input_r[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[23]_i_1 
       (.I0(\result_r_reg[16] [7]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[22]),
        .O(\locked_input_r[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[24]_i_1 
       (.I0(\result_r_reg[16] [8]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[23]),
        .O(\locked_input_r[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[25]_i_1 
       (.I0(\result_r_reg[16] [9]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[24]),
        .O(\locked_input_r[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[26]_i_1 
       (.I0(\result_r_reg[16] [10]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[25]),
        .O(\locked_input_r[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[27]_i_1 
       (.I0(\result_r_reg[16] [11]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[26]),
        .O(\locked_input_r[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[28]_i_1 
       (.I0(\result_r_reg[16] [12]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[27]),
        .O(\locked_input_r[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[29]_i_1 
       (.I0(\result_r_reg[16] [13]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[28]),
        .O(\locked_input_r[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[2]_i_1 
       (.I0(\result_r_reg[16] [2]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[1]),
        .O(\locked_input_r[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[30]_i_1 
       (.I0(\result_r_reg[16] [14]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[29]),
        .O(\locked_input_r[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[31]_i_1 
       (.I0(\result_r_reg[16] [15]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[30]),
        .O(\locked_input_r[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \locked_input_r[31]_i_2 
       (.I0(aud_lrclk_out_OBUF),
        .I1(\sel_counter_r_reg_n_0_[0] ),
        .I2(\sel_counter_r_reg_n_0_[3] ),
        .I3(\sel_counter_r_reg_n_0_[2] ),
        .I4(\sel_counter_r_reg_n_0_[1] ),
        .O(locked_input_r1__3));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[3]_i_1 
       (.I0(\result_r_reg[16] [3]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[2]),
        .O(\locked_input_r[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[4]_i_1 
       (.I0(\result_r_reg[16] [4]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[3]),
        .O(\locked_input_r[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[5]_i_1 
       (.I0(\result_r_reg[16] [5]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[4]),
        .O(\locked_input_r[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[6]_i_1 
       (.I0(\result_r_reg[16] [6]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[5]),
        .O(\locked_input_r[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[7]_i_1 
       (.I0(\result_r_reg[16] [7]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[6]),
        .O(\locked_input_r[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[8]_i_1 
       (.I0(\result_r_reg[16] [8]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[7]),
        .O(\locked_input_r[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \locked_input_r[9]_i_1 
       (.I0(\result_r_reg[16] [9]),
        .I1(locked_input_r1__3),
        .I2(locked_input_r[8]),
        .O(\locked_input_r[9]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[0] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[0]_i_1_n_0 ),
        .Q(locked_input_r[0]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[10] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[10]_i_1_n_0 ),
        .Q(locked_input_r[10]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[11] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[11]_i_1_n_0 ),
        .Q(locked_input_r[11]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[12] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[12]_i_1_n_0 ),
        .Q(locked_input_r[12]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[13] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[13]_i_1_n_0 ),
        .Q(locked_input_r[13]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[14] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[14]_i_1_n_0 ),
        .Q(locked_input_r[14]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[15] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[15]_i_1_n_0 ),
        .Q(locked_input_r[15]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[16] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[16]_i_1_n_0 ),
        .Q(locked_input_r[16]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[17] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[17]_i_1_n_0 ),
        .Q(locked_input_r[17]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[18] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[18]_i_1_n_0 ),
        .Q(locked_input_r[18]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[19] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[19]_i_1_n_0 ),
        .Q(locked_input_r[19]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[1] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[1]_i_1_n_0 ),
        .Q(locked_input_r[1]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[20] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[20]_i_1_n_0 ),
        .Q(locked_input_r[20]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[21] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[21]_i_1_n_0 ),
        .Q(locked_input_r[21]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[22] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[22]_i_1_n_0 ),
        .Q(locked_input_r[22]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[23] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[23]_i_1_n_0 ),
        .Q(locked_input_r[23]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[24] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[24]_i_1_n_0 ),
        .Q(locked_input_r[24]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[25] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[25]_i_1_n_0 ),
        .Q(locked_input_r[25]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[26] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[26]_i_1_n_0 ),
        .Q(locked_input_r[26]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[27] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[27]_i_1_n_0 ),
        .Q(locked_input_r[27]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[28] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[28]_i_1_n_0 ),
        .Q(locked_input_r[28]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[29] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[29]_i_1_n_0 ),
        .Q(locked_input_r[29]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[2] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[2]_i_1_n_0 ),
        .Q(locked_input_r[2]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[30] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[30]_i_1_n_0 ),
        .Q(locked_input_r[30]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[31] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[31]_i_1_n_0 ),
        .Q(Q));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[3] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[3]_i_1_n_0 ),
        .Q(locked_input_r[3]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[4] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[4]_i_1_n_0 ),
        .Q(locked_input_r[4]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[5] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[5]_i_1_n_0 ),
        .Q(locked_input_r[5]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[6] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[6]_i_1_n_0 ),
        .Q(locked_input_r[6]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[7] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[7]_i_1_n_0 ),
        .Q(locked_input_r[7]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[8] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[8]_i_1_n_0 ),
        .Q(locked_input_r[8]));
  FDCE #(
    .INIT(1'b0)) 
    \locked_input_r_reg[9] 
       (.C(CLK),
        .CE(sel_counter_r),
        .CLR(rst_n),
        .D(\locked_input_r[9]_i_1_n_0 ),
        .Q(locked_input_r[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \sel_counter_r[0]_i_1 
       (.I0(\sel_counter_r_reg_n_0_[0] ),
        .O(\sel_counter_r[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \sel_counter_r[1]_i_1 
       (.I0(\sel_counter_r_reg_n_0_[1] ),
        .I1(\sel_counter_r_reg_n_0_[0] ),
        .O(\sel_counter_r[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \sel_counter_r[2]_i_1 
       (.I0(\sel_counter_r_reg_n_0_[1] ),
        .I1(\sel_counter_r_reg_n_0_[0] ),
        .I2(\sel_counter_r_reg_n_0_[2] ),
        .O(\sel_counter_r[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \sel_counter_r[3]_i_1 
       (.I0(aud_bclk_div_r[1]),
        .I1(aud_bclk_div_r[0]),
        .I2(aud_bclk_out_OBUF),
        .O(sel_counter_r));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \sel_counter_r[3]_i_2 
       (.I0(\sel_counter_r_reg_n_0_[1] ),
        .I1(\sel_counter_r_reg_n_0_[0] ),
        .I2(\sel_counter_r_reg_n_0_[2] ),
        .I3(\sel_counter_r_reg_n_0_[3] ),
        .O(\sel_counter_r[3]_i_2_n_0 ));
  FDPE #(
    .INIT(1'b1)) 
    \sel_counter_r_reg[0] 
       (.C(CLK),
        .CE(sel_counter_r),
        .D(\sel_counter_r[0]_i_1_n_0 ),
        .PRE(rst_n),
        .Q(\sel_counter_r_reg_n_0_[0] ));
  FDPE #(
    .INIT(1'b1)) 
    \sel_counter_r_reg[1] 
       (.C(CLK),
        .CE(sel_counter_r),
        .D(\sel_counter_r[1]_i_1_n_0 ),
        .PRE(rst_n),
        .Q(\sel_counter_r_reg_n_0_[1] ));
  FDPE #(
    .INIT(1'b1)) 
    \sel_counter_r_reg[2] 
       (.C(CLK),
        .CE(sel_counter_r),
        .D(\sel_counter_r[2]_i_1_n_0 ),
        .PRE(rst_n),
        .Q(\sel_counter_r_reg_n_0_[2] ));
  FDPE #(
    .INIT(1'b1)) 
    \sel_counter_r_reg[3] 
       (.C(CLK),
        .CE(sel_counter_r),
        .D(\sel_counter_r[3]_i_2_n_0 ),
        .PRE(rst_n),
        .Q(\sel_counter_r_reg_n_0_[3] ));
endmodule

module multi_port_adder
   (\result_r_reg[16] ,
    Q,
    \counter_r_reg[14] ,
    S,
    \counter_r_reg[8] ,
    \counter_r_reg[12] ,
    DI,
    \counter_r_reg[15] ,
    D,
    \counter_r_reg[14]_0 ,
    \counter_r_reg[6] ,
    \counter_r_reg[10] ,
    \counter_r_reg[14]_1 ,
    \counter_r_reg[15]_0 ,
    \counter_r_reg[15]_1 ,
    rst_n_IBUF,
    CLK,
    \counter_r_reg[1] );
  output \result_r_reg[16] ;
  output [15:0]Q;
  input [13:0]\counter_r_reg[14] ;
  input [3:0]S;
  input [3:0]\counter_r_reg[8] ;
  input [3:0]\counter_r_reg[12] ;
  input [0:0]DI;
  input [2:0]\counter_r_reg[15] ;
  input [1:0]D;
  input [11:0]\counter_r_reg[14]_0 ;
  input [3:0]\counter_r_reg[6] ;
  input [3:0]\counter_r_reg[10] ;
  input [3:0]\counter_r_reg[14]_1 ;
  input [0:0]\counter_r_reg[15]_0 ;
  input [0:0]\counter_r_reg[15]_1 ;
  input rst_n_IBUF;
  input CLK;
  input [0:0]\counter_r_reg[1] ;

  wire CLK;
  wire [1:0]D;
  wire [0:0]DI;
  wire [15:0]Q;
  wire [3:0]S;
  wire [3:0]\counter_r_reg[10] ;
  wire [3:0]\counter_r_reg[12] ;
  wire [13:0]\counter_r_reg[14] ;
  wire [11:0]\counter_r_reg[14]_0 ;
  wire [3:0]\counter_r_reg[14]_1 ;
  wire [2:0]\counter_r_reg[15] ;
  wire [0:0]\counter_r_reg[15]_0 ;
  wire [0:0]\counter_r_reg[15]_1 ;
  wire [0:0]\counter_r_reg[1] ;
  wire [3:0]\counter_r_reg[6] ;
  wire [3:0]\counter_r_reg[8] ;
  wire i_adder_1_n_0;
  wire i_adder_2_n_1;
  wire i_adder_2_n_10;
  wire i_adder_2_n_11;
  wire i_adder_2_n_12;
  wire i_adder_2_n_13;
  wire i_adder_2_n_14;
  wire i_adder_2_n_15;
  wire i_adder_2_n_16;
  wire i_adder_2_n_2;
  wire i_adder_2_n_3;
  wire i_adder_2_n_4;
  wire i_adder_2_n_5;
  wire i_adder_2_n_6;
  wire i_adder_2_n_7;
  wire i_adder_2_n_8;
  wire i_adder_2_n_9;
  wire [15:2]result_r;
  wire \result_r_reg[16] ;
  wire rst_n_IBUF;

  adder i_adder_1
       (.CLK(CLK),
        .D(D),
        .Q(result_r),
        .S(i_adder_1_n_0),
        .\counter_r_reg[10] (\counter_r_reg[10] ),
        .\counter_r_reg[14] (\counter_r_reg[14]_0 ),
        .\counter_r_reg[14]_0 (\counter_r_reg[14]_1 ),
        .\counter_r_reg[15] (\counter_r_reg[15]_0 ),
        .\counter_r_reg[15]_0 (\counter_r_reg[15]_1 ),
        .\counter_r_reg[6] (\counter_r_reg[6] ),
        .\result_r_reg[16]_0 (i_adder_2_n_1),
        .rst_n(\result_r_reg[16] ));
  adder_0 i_adder_2
       (.CLK(CLK),
        .DI(DI),
        .Q({i_adder_2_n_1,i_adder_2_n_2,i_adder_2_n_3,i_adder_2_n_4,i_adder_2_n_5,i_adder_2_n_6,i_adder_2_n_7,i_adder_2_n_8,i_adder_2_n_9,i_adder_2_n_10,i_adder_2_n_11,i_adder_2_n_12,i_adder_2_n_13,i_adder_2_n_14,i_adder_2_n_15,i_adder_2_n_16}),
        .S(S),
        .\counter_r_reg[12] (\counter_r_reg[12] ),
        .\counter_r_reg[14] (\counter_r_reg[14] ),
        .\counter_r_reg[15] (\counter_r_reg[15] ),
        .\counter_r_reg[1] (\counter_r_reg[1] ),
        .\counter_r_reg[8] (\counter_r_reg[8] ),
        .\result_r_reg[16]_0 (\result_r_reg[16] ),
        .rst_n_IBUF(rst_n_IBUF));
  adder__parameterized2 i_adder_3
       (.CLK(CLK),
        .Q({i_adder_2_n_2,i_adder_2_n_3,i_adder_2_n_4,i_adder_2_n_5,i_adder_2_n_6,i_adder_2_n_7,i_adder_2_n_8,i_adder_2_n_9,i_adder_2_n_10,i_adder_2_n_11,i_adder_2_n_12,i_adder_2_n_13,i_adder_2_n_14,i_adder_2_n_15,i_adder_2_n_16}),
        .S(i_adder_1_n_0),
        .\locked_input_r_reg[15] (Q),
        .result_r0_in(result_r),
        .rst_n(\result_r_reg[16] ));
endmodule

(* clk_freq_g = "12288000" *) (* data_width_g = "16" *) (* n_keys_g = "4" *) 
(* sample_rate_g = "48000" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module synthesizer
   (clk,
    rst_n,
    keys_in,
    aud_bclk_out,
    aud_lrclk_out,
    aud_data_out);
  input clk;
  input rst_n;
  input [3:0]keys_in;
  output aud_bclk_out;
  output aud_lrclk_out;
  output aud_data_out;

  wire aud_bclk_out;
  wire aud_bclk_out_OBUF;
  wire aud_data_out;
  wire aud_data_out_OBUF;
  wire aud_lrclk_out;
  wire aud_lrclk_out_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \g_wave_gens[1].i_wave_gen_n_14 ;
  wire \g_wave_gens[1].i_wave_gen_n_15 ;
  wire \g_wave_gens[1].i_wave_gen_n_16 ;
  wire \g_wave_gens[1].i_wave_gen_n_17 ;
  wire \g_wave_gens[1].i_wave_gen_n_18 ;
  wire \g_wave_gens[1].i_wave_gen_n_19 ;
  wire \g_wave_gens[1].i_wave_gen_n_20 ;
  wire \g_wave_gens[1].i_wave_gen_n_21 ;
  wire \g_wave_gens[1].i_wave_gen_n_22 ;
  wire \g_wave_gens[1].i_wave_gen_n_23 ;
  wire \g_wave_gens[1].i_wave_gen_n_24 ;
  wire \g_wave_gens[1].i_wave_gen_n_25 ;
  wire \g_wave_gens[1].i_wave_gen_n_26 ;
  wire \g_wave_gens[1].i_wave_gen_n_27 ;
  wire \g_wave_gens[1].i_wave_gen_n_28 ;
  wire \g_wave_gens[1].i_wave_gen_n_29 ;
  wire \g_wave_gens[1].i_wave_gen_n_30 ;
  wire \g_wave_gens[3].i_wave_gen_n_12 ;
  wire \g_wave_gens[3].i_wave_gen_n_14 ;
  wire \g_wave_gens[3].i_wave_gen_n_15 ;
  wire \g_wave_gens[3].i_wave_gen_n_16 ;
  wire \g_wave_gens[3].i_wave_gen_n_17 ;
  wire \g_wave_gens[3].i_wave_gen_n_18 ;
  wire \g_wave_gens[3].i_wave_gen_n_19 ;
  wire \g_wave_gens[3].i_wave_gen_n_20 ;
  wire \g_wave_gens[3].i_wave_gen_n_21 ;
  wire \g_wave_gens[3].i_wave_gen_n_22 ;
  wire \g_wave_gens[3].i_wave_gen_n_23 ;
  wire \g_wave_gens[3].i_wave_gen_n_24 ;
  wire \g_wave_gens[3].i_wave_gen_n_25 ;
  wire \g_wave_gens[3].i_wave_gen_n_26 ;
  wire i_multi_port_adder_n_0;
  wire i_multi_port_adder_n_1;
  wire i_multi_port_adder_n_10;
  wire i_multi_port_adder_n_11;
  wire i_multi_port_adder_n_12;
  wire i_multi_port_adder_n_13;
  wire i_multi_port_adder_n_14;
  wire i_multi_port_adder_n_15;
  wire i_multi_port_adder_n_16;
  wire i_multi_port_adder_n_2;
  wire i_multi_port_adder_n_3;
  wire i_multi_port_adder_n_4;
  wire i_multi_port_adder_n_5;
  wire i_multi_port_adder_n_6;
  wire i_multi_port_adder_n_7;
  wire i_multi_port_adder_n_8;
  wire i_multi_port_adder_n_9;
  wire [3:0]keys_in;
  wire [3:0]keys_in_IBUF;
  wire [3:3]p_0_in;
  wire rst_n;
  wire rst_n_IBUF;
  wire [2:2]sel0;
  wire [15:1]sel0__0;
  wire [14:1]sel0__0__0;
  wire [15:3]sel0__1;
  wire [14:3]sel0__2;

  OBUF aud_bclk_out_OBUF_inst
       (.I(aud_bclk_out_OBUF),
        .O(aud_bclk_out));
  OBUF aud_data_out_OBUF_inst
       (.I(aud_data_out_OBUF),
        .O(aud_data_out));
  OBUF aud_lrclk_out_OBUF_inst
       (.I(aud_lrclk_out_OBUF),
        .O(aud_lrclk_out));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  wave_gen \g_wave_gens[0].i_wave_gen 
       (.CLK(clk_IBUF_BUFG),
        .keys_in_IBUF(keys_in_IBUF[0]),
        .rst_n(i_multi_port_adder_n_0),
        .sel0__0(sel0__0));
  wave_gen__parameterized1 \g_wave_gens[1].i_wave_gen 
       (.CLK(clk_IBUF_BUFG),
        .D(\g_wave_gens[1].i_wave_gen_n_15 ),
        .DI(\g_wave_gens[1].i_wave_gen_n_14 ),
        .S({\g_wave_gens[1].i_wave_gen_n_16 ,\g_wave_gens[1].i_wave_gen_n_17 ,\g_wave_gens[1].i_wave_gen_n_18 ,\g_wave_gens[1].i_wave_gen_n_19 }),
        .keys_in_IBUF(keys_in_IBUF[1]),
        .\result_r_reg[12] ({\g_wave_gens[1].i_wave_gen_n_24 ,\g_wave_gens[1].i_wave_gen_n_25 ,\g_wave_gens[1].i_wave_gen_n_26 ,\g_wave_gens[1].i_wave_gen_n_27 }),
        .\result_r_reg[16] (sel0__0__0),
        .\result_r_reg[16]_0 ({\g_wave_gens[1].i_wave_gen_n_28 ,\g_wave_gens[1].i_wave_gen_n_29 ,\g_wave_gens[1].i_wave_gen_n_30 }),
        .\result_r_reg[8] ({\g_wave_gens[1].i_wave_gen_n_20 ,\g_wave_gens[1].i_wave_gen_n_21 ,\g_wave_gens[1].i_wave_gen_n_22 ,\g_wave_gens[1].i_wave_gen_n_23 }),
        .rst_n(i_multi_port_adder_n_0),
        .sel0__0(sel0__0));
  wave_gen__parameterized3 \g_wave_gens[2].i_wave_gen 
       (.CLK(clk_IBUF_BUFG),
        .keys_in_IBUF(keys_in_IBUF[2]),
        .rst_n(i_multi_port_adder_n_0),
        .sel0(sel0),
        .sel0__1(sel0__1));
  wave_gen__parameterized5 \g_wave_gens[3].i_wave_gen 
       (.CLK(clk_IBUF_BUFG),
        .D(p_0_in),
        .DI(\g_wave_gens[3].i_wave_gen_n_12 ),
        .S({\g_wave_gens[3].i_wave_gen_n_14 ,\g_wave_gens[3].i_wave_gen_n_15 ,\g_wave_gens[3].i_wave_gen_n_16 ,\g_wave_gens[3].i_wave_gen_n_17 }),
        .keys_in_IBUF(keys_in_IBUF[3]),
        .\result_r_reg[10] ({\g_wave_gens[3].i_wave_gen_n_18 ,\g_wave_gens[3].i_wave_gen_n_19 ,\g_wave_gens[3].i_wave_gen_n_20 ,\g_wave_gens[3].i_wave_gen_n_21 }),
        .\result_r_reg[14] (sel0__2),
        .\result_r_reg[14]_0 ({\g_wave_gens[3].i_wave_gen_n_22 ,\g_wave_gens[3].i_wave_gen_n_23 ,\g_wave_gens[3].i_wave_gen_n_24 ,\g_wave_gens[3].i_wave_gen_n_25 }),
        .\result_r_reg[16] (\g_wave_gens[3].i_wave_gen_n_26 ),
        .rst_n(i_multi_port_adder_n_0),
        .sel0__1(sel0__1));
  audio_ctrl i_audio_ctrl
       (.CLK(clk_IBUF_BUFG),
        .Q(aud_data_out_OBUF),
        .aud_bclk_out_OBUF(aud_bclk_out_OBUF),
        .aud_lrclk_out_OBUF(aud_lrclk_out_OBUF),
        .\result_r_reg[16] ({i_multi_port_adder_n_1,i_multi_port_adder_n_2,i_multi_port_adder_n_3,i_multi_port_adder_n_4,i_multi_port_adder_n_5,i_multi_port_adder_n_6,i_multi_port_adder_n_7,i_multi_port_adder_n_8,i_multi_port_adder_n_9,i_multi_port_adder_n_10,i_multi_port_adder_n_11,i_multi_port_adder_n_12,i_multi_port_adder_n_13,i_multi_port_adder_n_14,i_multi_port_adder_n_15,i_multi_port_adder_n_16}),
        .rst_n(i_multi_port_adder_n_0));
  multi_port_adder i_multi_port_adder
       (.CLK(clk_IBUF_BUFG),
        .D({p_0_in,sel0}),
        .DI(\g_wave_gens[1].i_wave_gen_n_14 ),
        .Q({i_multi_port_adder_n_1,i_multi_port_adder_n_2,i_multi_port_adder_n_3,i_multi_port_adder_n_4,i_multi_port_adder_n_5,i_multi_port_adder_n_6,i_multi_port_adder_n_7,i_multi_port_adder_n_8,i_multi_port_adder_n_9,i_multi_port_adder_n_10,i_multi_port_adder_n_11,i_multi_port_adder_n_12,i_multi_port_adder_n_13,i_multi_port_adder_n_14,i_multi_port_adder_n_15,i_multi_port_adder_n_16}),
        .S({\g_wave_gens[1].i_wave_gen_n_16 ,\g_wave_gens[1].i_wave_gen_n_17 ,\g_wave_gens[1].i_wave_gen_n_18 ,\g_wave_gens[1].i_wave_gen_n_19 }),
        .\counter_r_reg[10] ({\g_wave_gens[3].i_wave_gen_n_18 ,\g_wave_gens[3].i_wave_gen_n_19 ,\g_wave_gens[3].i_wave_gen_n_20 ,\g_wave_gens[3].i_wave_gen_n_21 }),
        .\counter_r_reg[12] ({\g_wave_gens[1].i_wave_gen_n_24 ,\g_wave_gens[1].i_wave_gen_n_25 ,\g_wave_gens[1].i_wave_gen_n_26 ,\g_wave_gens[1].i_wave_gen_n_27 }),
        .\counter_r_reg[14] (sel0__0__0),
        .\counter_r_reg[14]_0 (sel0__2),
        .\counter_r_reg[14]_1 ({\g_wave_gens[3].i_wave_gen_n_22 ,\g_wave_gens[3].i_wave_gen_n_23 ,\g_wave_gens[3].i_wave_gen_n_24 ,\g_wave_gens[3].i_wave_gen_n_25 }),
        .\counter_r_reg[15] ({\g_wave_gens[1].i_wave_gen_n_28 ,\g_wave_gens[1].i_wave_gen_n_29 ,\g_wave_gens[1].i_wave_gen_n_30 }),
        .\counter_r_reg[15]_0 (\g_wave_gens[3].i_wave_gen_n_12 ),
        .\counter_r_reg[15]_1 (\g_wave_gens[3].i_wave_gen_n_26 ),
        .\counter_r_reg[1] (\g_wave_gens[1].i_wave_gen_n_15 ),
        .\counter_r_reg[6] ({\g_wave_gens[3].i_wave_gen_n_14 ,\g_wave_gens[3].i_wave_gen_n_15 ,\g_wave_gens[3].i_wave_gen_n_16 ,\g_wave_gens[3].i_wave_gen_n_17 }),
        .\counter_r_reg[8] ({\g_wave_gens[1].i_wave_gen_n_20 ,\g_wave_gens[1].i_wave_gen_n_21 ,\g_wave_gens[1].i_wave_gen_n_22 ,\g_wave_gens[1].i_wave_gen_n_23 }),
        .\result_r_reg[16] (i_multi_port_adder_n_0),
        .rst_n_IBUF(rst_n_IBUF));
  IBUF \keys_in_IBUF[0]_inst 
       (.I(keys_in[0]),
        .O(keys_in_IBUF[0]));
  IBUF \keys_in_IBUF[1]_inst 
       (.I(keys_in[1]),
        .O(keys_in_IBUF[1]));
  IBUF \keys_in_IBUF[2]_inst 
       (.I(keys_in[2]),
        .O(keys_in_IBUF[2]));
  IBUF \keys_in_IBUF[3]_inst 
       (.I(keys_in[3]),
        .O(keys_in_IBUF[3]));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
endmodule

module wave_gen
   (sel0__0,
    CLK,
    rst_n,
    keys_in_IBUF);
  output [14:0]sel0__0;
  input CLK;
  input rst_n;
  input [0:0]keys_in_IBUF;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire \counter_r[0]_i_2_n_0 ;
  wire \counter_r[0]_i_3_n_0 ;
  wire \counter_r[0]_i_4_n_0 ;
  wire \counter_r[0]_i_5_n_0 ;
  wire \counter_r[0]_i_6_n_0 ;
  wire \counter_r[0]_i_7_n_0 ;
  wire \counter_r[0]_i_8_n_0 ;
  wire \counter_r[12]_i_2_n_0 ;
  wire \counter_r[12]_i_3_n_0 ;
  wire \counter_r[12]_i_4_n_0 ;
  wire \counter_r[12]_i_5_n_0 ;
  wire \counter_r[12]_i_6_n_0 ;
  wire \counter_r[12]_i_7_n_0 ;
  wire \counter_r[12]_i_8_n_0 ;
  wire \counter_r[4]_i_2_n_0 ;
  wire \counter_r[4]_i_3_n_0 ;
  wire \counter_r[4]_i_4_n_0 ;
  wire \counter_r[4]_i_5_n_0 ;
  wire \counter_r[4]_i_6_n_0 ;
  wire \counter_r[4]_i_7_n_0 ;
  wire \counter_r[4]_i_8_n_0 ;
  wire \counter_r[4]_i_9_n_0 ;
  wire \counter_r[8]_i_2_n_0 ;
  wire \counter_r[8]_i_3_n_0 ;
  wire \counter_r[8]_i_4_n_0 ;
  wire \counter_r[8]_i_5_n_0 ;
  wire \counter_r[8]_i_6_n_0 ;
  wire \counter_r[8]_i_7_n_0 ;
  wire \counter_r[8]_i_8_n_0 ;
  wire \counter_r[8]_i_9_n_0 ;
  wire \counter_r_reg[0]_i_1_n_0 ;
  wire \counter_r_reg[0]_i_1_n_1 ;
  wire \counter_r_reg[0]_i_1_n_2 ;
  wire \counter_r_reg[0]_i_1_n_3 ;
  wire \counter_r_reg[0]_i_1_n_4 ;
  wire \counter_r_reg[0]_i_1_n_5 ;
  wire \counter_r_reg[0]_i_1_n_6 ;
  wire \counter_r_reg[0]_i_1_n_7 ;
  wire \counter_r_reg[12]_i_1_n_1 ;
  wire \counter_r_reg[12]_i_1_n_2 ;
  wire \counter_r_reg[12]_i_1_n_3 ;
  wire \counter_r_reg[12]_i_1_n_4 ;
  wire \counter_r_reg[12]_i_1_n_5 ;
  wire \counter_r_reg[12]_i_1_n_6 ;
  wire \counter_r_reg[12]_i_1_n_7 ;
  wire \counter_r_reg[4]_i_1_n_0 ;
  wire \counter_r_reg[4]_i_1_n_1 ;
  wire \counter_r_reg[4]_i_1_n_2 ;
  wire \counter_r_reg[4]_i_1_n_3 ;
  wire \counter_r_reg[4]_i_1_n_4 ;
  wire \counter_r_reg[4]_i_1_n_5 ;
  wire \counter_r_reg[4]_i_1_n_6 ;
  wire \counter_r_reg[4]_i_1_n_7 ;
  wire \counter_r_reg[8]_i_1_n_0 ;
  wire \counter_r_reg[8]_i_1_n_1 ;
  wire \counter_r_reg[8]_i_1_n_2 ;
  wire \counter_r_reg[8]_i_1_n_3 ;
  wire \counter_r_reg[8]_i_1_n_4 ;
  wire \counter_r_reg[8]_i_1_n_5 ;
  wire \counter_r_reg[8]_i_1_n_6 ;
  wire \counter_r_reg[8]_i_1_n_7 ;
  wire \counter_r_reg_n_0_[0] ;
  wire [1:1]in;
  wire \increment_r[1]_i_1_n_0 ;
  wire \increment_r[1]_i_2_n_0 ;
  wire \increment_r[1]_i_3_n_0 ;
  wire \increment_r[1]_i_4_n_0 ;
  wire \increment_r[1]_i_5_n_0 ;
  wire \increment_r[1]_i_6_n_0 ;
  wire \increment_r[1]_i_7_n_0 ;
  wire \increment_r[1]_i_8_n_0 ;
  wire \increment_r[1]_i_9_n_0 ;
  wire [0:0]keys_in_IBUF;
  wire rst_n;
  wire [14:0]sel0__0;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[0]_i_2 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[0]_i_3 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[0]_i_4 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[0]_i_5 
       (.I0(in),
        .I1(sel0__0[2]),
        .I2(keys_in_IBUF),
        .O(\counter_r[0]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[0]_i_6 
       (.I0(in),
        .I1(sel0__0[1]),
        .I2(keys_in_IBUF),
        .O(\counter_r[0]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[0]_i_7 
       (.I0(in),
        .I1(sel0__0[0]),
        .I2(keys_in_IBUF),
        .O(\counter_r[0]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[0]_i_8 
       (.I0(\counter_r_reg_n_0_[0] ),
        .I1(keys_in_IBUF),
        .O(\counter_r[0]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[12]_i_2 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[12]_i_3 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[12]_i_4 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[12]_i_5 
       (.I0(in),
        .I1(sel0__0[14]),
        .I2(keys_in_IBUF),
        .O(\counter_r[12]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[12]_i_6 
       (.I0(in),
        .I1(sel0__0[13]),
        .I2(keys_in_IBUF),
        .O(\counter_r[12]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[12]_i_7 
       (.I0(in),
        .I1(sel0__0[12]),
        .I2(keys_in_IBUF),
        .O(\counter_r[12]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[12]_i_8 
       (.I0(in),
        .I1(sel0__0[11]),
        .I2(keys_in_IBUF),
        .O(\counter_r[12]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_2 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_3 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_4 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_5 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[4]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_6 
       (.I0(in),
        .I1(sel0__0[6]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_7 
       (.I0(in),
        .I1(sel0__0[5]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_8 
       (.I0(in),
        .I1(sel0__0[4]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_9 
       (.I0(in),
        .I1(sel0__0[3]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[8]_i_2 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[8]_i_3 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[8]_i_4 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[8]_i_5 
       (.I0(keys_in_IBUF),
        .I1(in),
        .O(\counter_r[8]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[8]_i_6 
       (.I0(in),
        .I1(sel0__0[10]),
        .I2(keys_in_IBUF),
        .O(\counter_r[8]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[8]_i_7 
       (.I0(in),
        .I1(sel0__0[9]),
        .I2(keys_in_IBUF),
        .O(\counter_r[8]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[8]_i_8 
       (.I0(in),
        .I1(sel0__0[8]),
        .I2(keys_in_IBUF),
        .O(\counter_r[8]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[8]_i_9 
       (.I0(in),
        .I1(sel0__0[7]),
        .I2(keys_in_IBUF),
        .O(\counter_r[8]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[0] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[0]_i_1_n_7 ),
        .Q(\counter_r_reg_n_0_[0] ));
  CARRY4 \counter_r_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\counter_r_reg[0]_i_1_n_0 ,\counter_r_reg[0]_i_1_n_1 ,\counter_r_reg[0]_i_1_n_2 ,\counter_r_reg[0]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[0]_i_2_n_0 ,\counter_r[0]_i_3_n_0 ,\counter_r[0]_i_4_n_0 ,keys_in_IBUF}),
        .O({\counter_r_reg[0]_i_1_n_4 ,\counter_r_reg[0]_i_1_n_5 ,\counter_r_reg[0]_i_1_n_6 ,\counter_r_reg[0]_i_1_n_7 }),
        .S({\counter_r[0]_i_5_n_0 ,\counter_r[0]_i_6_n_0 ,\counter_r[0]_i_7_n_0 ,\counter_r[0]_i_8_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[8]_i_1_n_5 ),
        .Q(sel0__0[9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[8]_i_1_n_4 ),
        .Q(sel0__0[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[12]_i_1_n_7 ),
        .Q(sel0__0[11]));
  CARRY4 \counter_r_reg[12]_i_1 
       (.CI(\counter_r_reg[8]_i_1_n_0 ),
        .CO({\counter_r_reg[12]_i_1_n_1 ,\counter_r_reg[12]_i_1_n_2 ,\counter_r_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\counter_r[12]_i_2_n_0 ,\counter_r[12]_i_3_n_0 ,\counter_r[12]_i_4_n_0 }),
        .O({\counter_r_reg[12]_i_1_n_4 ,\counter_r_reg[12]_i_1_n_5 ,\counter_r_reg[12]_i_1_n_6 ,\counter_r_reg[12]_i_1_n_7 }),
        .S({\counter_r[12]_i_5_n_0 ,\counter_r[12]_i_6_n_0 ,\counter_r[12]_i_7_n_0 ,\counter_r[12]_i_8_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[12]_i_1_n_6 ),
        .Q(sel0__0[12]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[12]_i_1_n_5 ),
        .Q(sel0__0[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[12]_i_1_n_4 ),
        .Q(sel0__0[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[0]_i_1_n_6 ),
        .Q(sel0__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[0]_i_1_n_5 ),
        .Q(sel0__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[0]_i_1_n_4 ),
        .Q(sel0__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1_n_7 ),
        .Q(sel0__0[3]));
  CARRY4 \counter_r_reg[4]_i_1 
       (.CI(\counter_r_reg[0]_i_1_n_0 ),
        .CO({\counter_r_reg[4]_i_1_n_0 ,\counter_r_reg[4]_i_1_n_1 ,\counter_r_reg[4]_i_1_n_2 ,\counter_r_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[4]_i_2_n_0 ,\counter_r[4]_i_3_n_0 ,\counter_r[4]_i_4_n_0 ,\counter_r[4]_i_5_n_0 }),
        .O({\counter_r_reg[4]_i_1_n_4 ,\counter_r_reg[4]_i_1_n_5 ,\counter_r_reg[4]_i_1_n_6 ,\counter_r_reg[4]_i_1_n_7 }),
        .S({\counter_r[4]_i_6_n_0 ,\counter_r[4]_i_7_n_0 ,\counter_r[4]_i_8_n_0 ,\counter_r[4]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1_n_6 ),
        .Q(sel0__0[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1_n_5 ),
        .Q(sel0__0[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1_n_4 ),
        .Q(sel0__0[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[8]_i_1_n_7 ),
        .Q(sel0__0[7]));
  CARRY4 \counter_r_reg[8]_i_1 
       (.CI(\counter_r_reg[4]_i_1_n_0 ),
        .CO({\counter_r_reg[8]_i_1_n_0 ,\counter_r_reg[8]_i_1_n_1 ,\counter_r_reg[8]_i_1_n_2 ,\counter_r_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[8]_i_2_n_0 ,\counter_r[8]_i_3_n_0 ,\counter_r[8]_i_4_n_0 ,\counter_r[8]_i_5_n_0 }),
        .O({\counter_r_reg[8]_i_1_n_4 ,\counter_r_reg[8]_i_1_n_5 ,\counter_r_reg[8]_i_1_n_6 ,\counter_r_reg[8]_i_1_n_7 }),
        .S({\counter_r[8]_i_6_n_0 ,\counter_r[8]_i_7_n_0 ,\counter_r[8]_i_8_n_0 ,\counter_r[8]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[8]_i_1_n_6 ),
        .Q(sel0__0[8]));
  LUT5 #(
    .INIT(32'hEEAE22A2)) 
    \increment_r[1]_i_1 
       (.I0(\increment_r[1]_i_2_n_0 ),
        .I1(keys_in_IBUF),
        .I2(\increment_r[1]_i_3_n_0 ),
        .I3(\increment_r[1]_i_4_n_0 ),
        .I4(in),
        .O(\increment_r[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \increment_r[1]_i_2 
       (.I0(\increment_r[1]_i_5_n_0 ),
        .I1(\increment_r[1]_i_6_n_0 ),
        .I2(\increment_r[1]_i_7_n_0 ),
        .I3(sel0__0[14]),
        .I4(sel0__0[7]),
        .I5(sel0__0[8]),
        .O(\increment_r[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000002)) 
    \increment_r[1]_i_3 
       (.I0(\increment_r[1]_i_8_n_0 ),
        .I1(sel0__0[5]),
        .I2(sel0__0[4]),
        .I3(sel0__0[3]),
        .I4(sel0__0[7]),
        .I5(sel0__0[6]),
        .O(\increment_r[1]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFD7)) 
    \increment_r[1]_i_4 
       (.I0(sel0__0[0]),
        .I1(sel0__0[13]),
        .I2(sel0__0[14]),
        .I3(\counter_r_reg_n_0_[0] ),
        .I4(\increment_r[1]_i_9_n_0 ),
        .O(\increment_r[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \increment_r[1]_i_5 
       (.I0(sel0__0[13]),
        .I1(keys_in_IBUF),
        .I2(sel0__0[4]),
        .I3(sel0__0[3]),
        .I4(sel0__0[12]),
        .I5(sel0__0[11]),
        .O(\increment_r[1]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hDFFF)) 
    \increment_r[1]_i_6 
       (.I0(sel0__0[0]),
        .I1(\counter_r_reg_n_0_[0] ),
        .I2(sel0__0[9]),
        .I3(sel0__0[10]),
        .O(\increment_r[1]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \increment_r[1]_i_7 
       (.I0(sel0__0[5]),
        .I1(sel0__0[6]),
        .I2(sel0__0[1]),
        .I3(sel0__0[2]),
        .O(\increment_r[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h8100000000000081)) 
    \increment_r[1]_i_8 
       (.I0(sel0__0[9]),
        .I1(sel0__0[10]),
        .I2(sel0__0[11]),
        .I3(sel0__0[1]),
        .I4(sel0__0[2]),
        .I5(sel0__0[3]),
        .O(\increment_r[1]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h7EFFFFFFFFFFFF7E)) 
    \increment_r[1]_i_9 
       (.I0(sel0__0[11]),
        .I1(sel0__0[12]),
        .I2(sel0__0[13]),
        .I3(sel0__0[7]),
        .I4(sel0__0[8]),
        .I5(sel0__0[9]),
        .O(\increment_r[1]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \increment_r_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\increment_r[1]_i_1_n_0 ),
        .Q(in));
endmodule

(* ORIG_REF_NAME = "wave_gen" *) 
module wave_gen__parameterized1
   (\result_r_reg[16] ,
    DI,
    D,
    S,
    \result_r_reg[8] ,
    \result_r_reg[12] ,
    \result_r_reg[16]_0 ,
    CLK,
    rst_n,
    keys_in_IBUF,
    sel0__0);
  output [13:0]\result_r_reg[16] ;
  output [0:0]DI;
  output [0:0]D;
  output [3:0]S;
  output [3:0]\result_r_reg[8] ;
  output [3:0]\result_r_reg[12] ;
  output [2:0]\result_r_reg[16]_0 ;
  input CLK;
  input rst_n;
  input [0:0]keys_in_IBUF;
  input [14:0]sel0__0;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [0:0]D;
  wire [0:0]DI;
  wire [3:0]S;
  wire \counter_r[13]_i_2_n_0 ;
  wire \counter_r[13]_i_3_n_0 ;
  wire \counter_r[13]_i_4_n_0 ;
  wire \counter_r[13]_i_5_n_0 ;
  wire \counter_r[13]_i_6_n_0 ;
  wire \counter_r[1]_i_1_n_0 ;
  wire \counter_r[2]_i_2_n_0 ;
  wire \counter_r[2]_i_3_n_0 ;
  wire \counter_r[2]_i_4_n_0 ;
  wire \counter_r[2]_i_5_n_0 ;
  wire \counter_r[2]_i_6_n_0 ;
  wire \counter_r[2]_i_7_n_0 ;
  wire \counter_r[2]_i_8_n_0 ;
  wire \counter_r[5]_i_2_n_0 ;
  wire \counter_r[5]_i_3_n_0 ;
  wire \counter_r[5]_i_4_n_0 ;
  wire \counter_r[5]_i_5_n_0 ;
  wire \counter_r[5]_i_6_n_0 ;
  wire \counter_r[5]_i_7_n_0 ;
  wire \counter_r[5]_i_8_n_0 ;
  wire \counter_r[5]_i_9_n_0 ;
  wire \counter_r[9]_i_2_n_0 ;
  wire \counter_r[9]_i_3_n_0 ;
  wire \counter_r[9]_i_4_n_0 ;
  wire \counter_r[9]_i_5_n_0 ;
  wire \counter_r[9]_i_6_n_0 ;
  wire \counter_r[9]_i_7_n_0 ;
  wire \counter_r[9]_i_8_n_0 ;
  wire \counter_r[9]_i_9_n_0 ;
  wire \counter_r_reg[13]_i_1_n_2 ;
  wire \counter_r_reg[13]_i_1_n_3 ;
  wire \counter_r_reg[13]_i_1_n_5 ;
  wire \counter_r_reg[13]_i_1_n_6 ;
  wire \counter_r_reg[13]_i_1_n_7 ;
  wire \counter_r_reg[2]_i_1_n_0 ;
  wire \counter_r_reg[2]_i_1_n_1 ;
  wire \counter_r_reg[2]_i_1_n_2 ;
  wire \counter_r_reg[2]_i_1_n_3 ;
  wire \counter_r_reg[2]_i_1_n_4 ;
  wire \counter_r_reg[2]_i_1_n_5 ;
  wire \counter_r_reg[2]_i_1_n_6 ;
  wire \counter_r_reg[5]_i_1_n_0 ;
  wire \counter_r_reg[5]_i_1_n_1 ;
  wire \counter_r_reg[5]_i_1_n_2 ;
  wire \counter_r_reg[5]_i_1_n_3 ;
  wire \counter_r_reg[5]_i_1_n_4 ;
  wire \counter_r_reg[5]_i_1_n_5 ;
  wire \counter_r_reg[5]_i_1_n_6 ;
  wire \counter_r_reg[5]_i_1_n_7 ;
  wire \counter_r_reg[9]_i_1_n_0 ;
  wire \counter_r_reg[9]_i_1_n_1 ;
  wire \counter_r_reg[9]_i_1_n_2 ;
  wire \counter_r_reg[9]_i_1_n_3 ;
  wire \counter_r_reg[9]_i_1_n_4 ;
  wire \counter_r_reg[9]_i_1_n_5 ;
  wire \counter_r_reg[9]_i_1_n_6 ;
  wire \counter_r_reg[9]_i_1_n_7 ;
  wire \increment_r[2]_i_1_n_0 ;
  wire \increment_r[2]_i_2_n_0 ;
  wire \increment_r[2]_i_3_n_0 ;
  wire \increment_r[2]_i_4_n_0 ;
  wire \increment_r[2]_i_5_n_0 ;
  wire \increment_r[2]_i_6_n_0 ;
  wire \increment_r[2]_i_7_n_0 ;
  wire \increment_r[2]_i_8_n_0 ;
  wire \increment_r[2]_i_9_n_0 ;
  wire \increment_r_reg_n_0_[2] ;
  wire [0:0]keys_in_IBUF;
  wire [3:0]\result_r_reg[12] ;
  wire [13:0]\result_r_reg[16] ;
  wire [2:0]\result_r_reg[16]_0 ;
  wire [3:0]\result_r_reg[8] ;
  wire rst_n;
  wire [14:0]sel0__0;
  wire [15:15]sel0__0__0;
  wire [3:0]\NLW_counter_r_reg[2]_i_1_O_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[13]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[13]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[13]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[13]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[13]_i_4 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(sel0__0__0),
        .I2(keys_in_IBUF),
        .O(\counter_r[13]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[13]_i_5 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [13]),
        .I2(keys_in_IBUF),
        .O(\counter_r[13]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[13]_i_6 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [12]),
        .I2(keys_in_IBUF),
        .O(\counter_r[13]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[1]_i_1 
       (.I0(\result_r_reg[16] [0]),
        .I1(keys_in_IBUF),
        .O(\counter_r[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[2]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[2]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[2]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[2]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[2]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[2]_i_5 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [3]),
        .I2(keys_in_IBUF),
        .O(\counter_r[2]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[2]_i_6 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [2]),
        .I2(keys_in_IBUF),
        .O(\counter_r[2]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[2]_i_7 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [1]),
        .I2(keys_in_IBUF),
        .O(\counter_r[2]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[2]_i_8 
       (.I0(\result_r_reg[16] [0]),
        .I1(keys_in_IBUF),
        .O(\counter_r[2]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[5]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[5]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[5]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[5]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[5]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[5]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[5]_i_6 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [7]),
        .I2(keys_in_IBUF),
        .O(\counter_r[5]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[5]_i_7 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [6]),
        .I2(keys_in_IBUF),
        .O(\counter_r[5]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[5]_i_8 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [5]),
        .I2(keys_in_IBUF),
        .O(\counter_r[5]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[5]_i_9 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [4]),
        .I2(keys_in_IBUF),
        .O(\counter_r[5]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[9]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[9]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[9]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[9]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[9]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[9]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[2] ),
        .O(\counter_r[9]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[9]_i_6 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [11]),
        .I2(keys_in_IBUF),
        .O(\counter_r[9]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[9]_i_7 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [10]),
        .I2(keys_in_IBUF),
        .O(\counter_r[9]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[9]_i_8 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [9]),
        .I2(keys_in_IBUF),
        .O(\counter_r[9]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[9]_i_9 
       (.I0(\increment_r_reg_n_0_[2] ),
        .I1(\result_r_reg[16] [8]),
        .I2(keys_in_IBUF),
        .O(\counter_r[9]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[9]_i_1_n_6 ),
        .Q(\result_r_reg[16] [9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[9]_i_1_n_5 ),
        .Q(\result_r_reg[16] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[9]_i_1_n_4 ),
        .Q(\result_r_reg[16] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[13]_i_1_n_7 ),
        .Q(\result_r_reg[16] [12]));
  CARRY4 \counter_r_reg[13]_i_1 
       (.CI(\counter_r_reg[9]_i_1_n_0 ),
        .CO({\counter_r_reg[13]_i_1_n_2 ,\counter_r_reg[13]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\counter_r[13]_i_2_n_0 ,\counter_r[13]_i_3_n_0 }),
        .O({\counter_r_reg[13]_i_1_n_5 ,\counter_r_reg[13]_i_1_n_6 ,\counter_r_reg[13]_i_1_n_7 }),
        .S({\<const0> ,\counter_r[13]_i_4_n_0 ,\counter_r[13]_i_5_n_0 ,\counter_r[13]_i_6_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[13]_i_1_n_6 ),
        .Q(\result_r_reg[16] [13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[13]_i_1_n_5 ),
        .Q(sel0__0__0));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[1] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r[1]_i_1_n_0 ),
        .Q(\result_r_reg[16] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[2]_i_1_n_6 ),
        .Q(\result_r_reg[16] [1]));
  CARRY4 \counter_r_reg[2]_i_1 
       (.CI(\<const0> ),
        .CO({\counter_r_reg[2]_i_1_n_0 ,\counter_r_reg[2]_i_1_n_1 ,\counter_r_reg[2]_i_1_n_2 ,\counter_r_reg[2]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[2]_i_2_n_0 ,\counter_r[2]_i_3_n_0 ,\counter_r[2]_i_4_n_0 ,keys_in_IBUF}),
        .O({\counter_r_reg[2]_i_1_n_4 ,\counter_r_reg[2]_i_1_n_5 ,\counter_r_reg[2]_i_1_n_6 ,\NLW_counter_r_reg[2]_i_1_O_UNCONNECTED [0]}),
        .S({\counter_r[2]_i_5_n_0 ,\counter_r[2]_i_6_n_0 ,\counter_r[2]_i_7_n_0 ,\counter_r[2]_i_8_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[2]_i_1_n_5 ),
        .Q(\result_r_reg[16] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[2]_i_1_n_4 ),
        .Q(\result_r_reg[16] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[5]_i_1_n_7 ),
        .Q(\result_r_reg[16] [4]));
  CARRY4 \counter_r_reg[5]_i_1 
       (.CI(\counter_r_reg[2]_i_1_n_0 ),
        .CO({\counter_r_reg[5]_i_1_n_0 ,\counter_r_reg[5]_i_1_n_1 ,\counter_r_reg[5]_i_1_n_2 ,\counter_r_reg[5]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[5]_i_2_n_0 ,\counter_r[5]_i_3_n_0 ,\counter_r[5]_i_4_n_0 ,\counter_r[5]_i_5_n_0 }),
        .O({\counter_r_reg[5]_i_1_n_4 ,\counter_r_reg[5]_i_1_n_5 ,\counter_r_reg[5]_i_1_n_6 ,\counter_r_reg[5]_i_1_n_7 }),
        .S({\counter_r[5]_i_6_n_0 ,\counter_r[5]_i_7_n_0 ,\counter_r[5]_i_8_n_0 ,\counter_r[5]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[5]_i_1_n_6 ),
        .Q(\result_r_reg[16] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[5]_i_1_n_5 ),
        .Q(\result_r_reg[16] [6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[5]_i_1_n_4 ),
        .Q(\result_r_reg[16] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[9]_i_1_n_7 ),
        .Q(\result_r_reg[16] [8]));
  CARRY4 \counter_r_reg[9]_i_1 
       (.CI(\counter_r_reg[5]_i_1_n_0 ),
        .CO({\counter_r_reg[9]_i_1_n_0 ,\counter_r_reg[9]_i_1_n_1 ,\counter_r_reg[9]_i_1_n_2 ,\counter_r_reg[9]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[9]_i_2_n_0 ,\counter_r[9]_i_3_n_0 ,\counter_r[9]_i_4_n_0 ,\counter_r[9]_i_5_n_0 }),
        .O({\counter_r_reg[9]_i_1_n_4 ,\counter_r_reg[9]_i_1_n_5 ,\counter_r_reg[9]_i_1_n_6 ,\counter_r_reg[9]_i_1_n_7 }),
        .S({\counter_r[9]_i_6_n_0 ,\counter_r[9]_i_7_n_0 ,\counter_r[9]_i_8_n_0 ,\counter_r[9]_i_9_n_0 }));
  LUT6 #(
    .INIT(64'h2000FFFF20000000)) 
    \increment_r[2]_i_1 
       (.I0(\increment_r[2]_i_2_n_0 ),
        .I1(\increment_r[2]_i_3_n_0 ),
        .I2(\result_r_reg[16] [12]),
        .I3(\increment_r[2]_i_4_n_0 ),
        .I4(\increment_r[2]_i_5_n_0 ),
        .I5(\increment_r_reg_n_0_[2] ),
        .O(\increment_r[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \increment_r[2]_i_2 
       (.I0(\increment_r[2]_i_6_n_0 ),
        .I1(\result_r_reg[16] [2]),
        .I2(\result_r_reg[16] [8]),
        .I3(\result_r_reg[16] [5]),
        .I4(\result_r_reg[16] [7]),
        .I5(\result_r_reg[16] [6]),
        .O(\increment_r[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \increment_r[2]_i_3 
       (.I0(\result_r_reg[16] [11]),
        .I1(keys_in_IBUF),
        .I2(\result_r_reg[16] [0]),
        .I3(\result_r_reg[16] [1]),
        .I4(\result_r_reg[16] [10]),
        .I5(\result_r_reg[16] [9]),
        .O(\increment_r[2]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \increment_r[2]_i_4 
       (.I0(\result_r_reg[16] [13]),
        .I1(sel0__0__0),
        .O(\increment_r[2]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h5555555555555D55)) 
    \increment_r[2]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r[2]_i_7_n_0 ),
        .I2(\increment_r[2]_i_8_n_0 ),
        .I3(\result_r_reg[16] [1]),
        .I4(\result_r_reg[16] [0]),
        .I5(\increment_r[2]_i_9_n_0 ),
        .O(\increment_r[2]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \increment_r[2]_i_6 
       (.I0(\result_r_reg[16] [4]),
        .I1(\result_r_reg[16] [3]),
        .O(\increment_r[2]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2400000000000024)) 
    \increment_r[2]_i_7 
       (.I0(\result_r_reg[16] [13]),
        .I1(sel0__0__0),
        .I2(\result_r_reg[16] [12]),
        .I3(\result_r_reg[16] [3]),
        .I4(\result_r_reg[16] [4]),
        .I5(\result_r_reg[16] [2]),
        .O(\increment_r[2]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFE)) 
    \increment_r[2]_i_8 
       (.I0(\result_r_reg[16] [5]),
        .I1(\result_r_reg[16] [4]),
        .I2(\result_r_reg[16] [7]),
        .I3(\result_r_reg[16] [8]),
        .I4(\result_r_reg[16] [6]),
        .O(\increment_r[2]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFE)) 
    \increment_r[2]_i_9 
       (.I0(\result_r_reg[16] [9]),
        .I1(\result_r_reg[16] [8]),
        .I2(\result_r_reg[16] [11]),
        .I3(\result_r_reg[16] [12]),
        .I4(\result_r_reg[16] [10]),
        .O(\increment_r[2]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \increment_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\increment_r[2]_i_1_n_0 ),
        .Q(\increment_r_reg_n_0_[2] ));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_1
       (.I0(\result_r_reg[16] [7]),
        .I1(sel0__0[7]),
        .O(\result_r_reg[8] [3]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_2
       (.I0(\result_r_reg[16] [6]),
        .I1(sel0__0[6]),
        .O(\result_r_reg[8] [2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_3
       (.I0(\result_r_reg[16] [5]),
        .I1(sel0__0[5]),
        .O(\result_r_reg[8] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_4
       (.I0(\result_r_reg[16] [4]),
        .I1(sel0__0[4]),
        .O(\result_r_reg[8] [0]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_1
       (.I0(\result_r_reg[16] [11]),
        .I1(sel0__0[11]),
        .O(\result_r_reg[12] [3]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_2
       (.I0(\result_r_reg[16] [10]),
        .I1(sel0__0[10]),
        .O(\result_r_reg[12] [2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_3
       (.I0(\result_r_reg[16] [9]),
        .I1(sel0__0[9]),
        .O(\result_r_reg[12] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_4
       (.I0(\result_r_reg[16] [8]),
        .I1(sel0__0[8]),
        .O(\result_r_reg[12] [0]));
  LUT1 #(
    .INIT(2'h1)) 
    result_r0__0_carry__2_i_1
       (.I0(sel0__0__0),
        .O(DI));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__2_i_2
       (.I0(sel0__0__0),
        .I1(sel0__0[14]),
        .O(\result_r_reg[16]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__2_i_3
       (.I0(\result_r_reg[16] [13]),
        .I1(sel0__0[13]),
        .O(\result_r_reg[16]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__2_i_4
       (.I0(\result_r_reg[16] [12]),
        .I1(sel0__0[12]),
        .O(\result_r_reg[16]_0 [0]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_1
       (.I0(\result_r_reg[16] [3]),
        .I1(sel0__0[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_2
       (.I0(\result_r_reg[16] [2]),
        .I1(sel0__0[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_3
       (.I0(\result_r_reg[16] [1]),
        .I1(sel0__0[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_4
       (.I0(\result_r_reg[16] [0]),
        .I1(sel0__0[0]),
        .O(S[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[1]_i_1 
       (.I0(\result_r_reg[16] [0]),
        .I1(sel0__0[0]),
        .O(D));
endmodule

(* ORIG_REF_NAME = "wave_gen" *) 
module wave_gen__parameterized3
   (sel0,
    sel0__1,
    CLK,
    rst_n,
    keys_in_IBUF);
  output [0:0]sel0;
  output [12:0]sel0__1;
  input CLK;
  input rst_n;
  input [0:0]keys_in_IBUF;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire \counter_r[10]_i_2_n_0 ;
  wire \counter_r[10]_i_3_n_0 ;
  wire \counter_r[10]_i_4_n_0 ;
  wire \counter_r[10]_i_5_n_0 ;
  wire \counter_r[10]_i_6_n_0 ;
  wire \counter_r[10]_i_7_n_0 ;
  wire \counter_r[10]_i_8_n_0 ;
  wire \counter_r[10]_i_9_n_0 ;
  wire \counter_r[14]_i_2_n_0 ;
  wire \counter_r[14]_i_3_n_0 ;
  wire \counter_r[14]_i_4_n_0 ;
  wire \counter_r[2]_i_1_n_0 ;
  wire \counter_r[3]_i_2_n_0 ;
  wire \counter_r[3]_i_3_n_0 ;
  wire \counter_r[3]_i_4_n_0 ;
  wire \counter_r[3]_i_5_n_0 ;
  wire \counter_r[3]_i_6_n_0 ;
  wire \counter_r[3]_i_7_n_0 ;
  wire \counter_r[3]_i_8_n_0 ;
  wire \counter_r[6]_i_2_n_0 ;
  wire \counter_r[6]_i_3_n_0 ;
  wire \counter_r[6]_i_4_n_0 ;
  wire \counter_r[6]_i_5_n_0 ;
  wire \counter_r[6]_i_6_n_0 ;
  wire \counter_r[6]_i_7_n_0 ;
  wire \counter_r[6]_i_8_n_0 ;
  wire \counter_r[6]_i_9_n_0 ;
  wire \counter_r_reg[10]_i_1_n_0 ;
  wire \counter_r_reg[10]_i_1_n_1 ;
  wire \counter_r_reg[10]_i_1_n_2 ;
  wire \counter_r_reg[10]_i_1_n_3 ;
  wire \counter_r_reg[10]_i_1_n_4 ;
  wire \counter_r_reg[10]_i_1_n_5 ;
  wire \counter_r_reg[10]_i_1_n_6 ;
  wire \counter_r_reg[10]_i_1_n_7 ;
  wire \counter_r_reg[14]_i_1_n_3 ;
  wire \counter_r_reg[14]_i_1_n_6 ;
  wire \counter_r_reg[14]_i_1_n_7 ;
  wire \counter_r_reg[3]_i_1_n_0 ;
  wire \counter_r_reg[3]_i_1_n_1 ;
  wire \counter_r_reg[3]_i_1_n_2 ;
  wire \counter_r_reg[3]_i_1_n_3 ;
  wire \counter_r_reg[3]_i_1_n_4 ;
  wire \counter_r_reg[3]_i_1_n_5 ;
  wire \counter_r_reg[3]_i_1_n_6 ;
  wire \counter_r_reg[6]_i_1_n_0 ;
  wire \counter_r_reg[6]_i_1_n_1 ;
  wire \counter_r_reg[6]_i_1_n_2 ;
  wire \counter_r_reg[6]_i_1_n_3 ;
  wire \counter_r_reg[6]_i_1_n_4 ;
  wire \counter_r_reg[6]_i_1_n_5 ;
  wire \counter_r_reg[6]_i_1_n_6 ;
  wire \counter_r_reg[6]_i_1_n_7 ;
  wire \increment_r[3]_i_1_n_0 ;
  wire \increment_r[3]_i_2_n_0 ;
  wire \increment_r[3]_i_3_n_0 ;
  wire \increment_r[3]_i_4_n_0 ;
  wire \increment_r[3]_i_5_n_0 ;
  wire \increment_r[3]_i_6_n_0 ;
  wire \increment_r[3]_i_7_n_0 ;
  wire \increment_r[3]_i_8_n_0 ;
  wire \increment_r[3]_i_9_n_0 ;
  wire \increment_r_reg_n_0_[3] ;
  wire [0:0]keys_in_IBUF;
  wire rst_n;
  wire [0:0]sel0;
  wire [12:0]sel0__1;
  wire [3:0]\NLW_counter_r_reg[3]_i_1_O_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[10]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[10]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[10]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[10]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[10]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[10]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[10]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[10]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[10]_i_6 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[10]),
        .I2(keys_in_IBUF),
        .O(\counter_r[10]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[10]_i_7 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[9]),
        .I2(keys_in_IBUF),
        .O(\counter_r[10]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[10]_i_8 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[8]),
        .I2(keys_in_IBUF),
        .O(\counter_r[10]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[10]_i_9 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[7]),
        .I2(keys_in_IBUF),
        .O(\counter_r[10]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[14]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[14]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[14]_i_3 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[12]),
        .I2(keys_in_IBUF),
        .O(\counter_r[14]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[14]_i_4 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[11]),
        .I2(keys_in_IBUF),
        .O(\counter_r[14]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[2]_i_1 
       (.I0(sel0),
        .I1(keys_in_IBUF),
        .O(\counter_r[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[3]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[3]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[3]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[3]_i_5 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[2]),
        .I2(keys_in_IBUF),
        .O(\counter_r[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[3]_i_6 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[1]),
        .I2(keys_in_IBUF),
        .O(\counter_r[3]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[3]_i_7 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[0]),
        .I2(keys_in_IBUF),
        .O(\counter_r[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[3]_i_8 
       (.I0(sel0),
        .I1(keys_in_IBUF),
        .O(\counter_r[3]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[6]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[6]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[6]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[6]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[6]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[6]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[3] ),
        .O(\counter_r[6]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[6]_i_6 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[6]),
        .I2(keys_in_IBUF),
        .O(\counter_r[6]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[6]_i_7 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[5]),
        .I2(keys_in_IBUF),
        .O(\counter_r[6]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[6]_i_8 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[4]),
        .I2(keys_in_IBUF),
        .O(\counter_r[6]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[6]_i_9 
       (.I0(\increment_r_reg_n_0_[3] ),
        .I1(sel0__1[3]),
        .I2(keys_in_IBUF),
        .O(\counter_r[6]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[10]_i_1_n_7 ),
        .Q(sel0__1[7]));
  CARRY4 \counter_r_reg[10]_i_1 
       (.CI(\counter_r_reg[6]_i_1_n_0 ),
        .CO({\counter_r_reg[10]_i_1_n_0 ,\counter_r_reg[10]_i_1_n_1 ,\counter_r_reg[10]_i_1_n_2 ,\counter_r_reg[10]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[10]_i_2_n_0 ,\counter_r[10]_i_3_n_0 ,\counter_r[10]_i_4_n_0 ,\counter_r[10]_i_5_n_0 }),
        .O({\counter_r_reg[10]_i_1_n_4 ,\counter_r_reg[10]_i_1_n_5 ,\counter_r_reg[10]_i_1_n_6 ,\counter_r_reg[10]_i_1_n_7 }),
        .S({\counter_r[10]_i_6_n_0 ,\counter_r[10]_i_7_n_0 ,\counter_r[10]_i_8_n_0 ,\counter_r[10]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[10]_i_1_n_6 ),
        .Q(sel0__1[8]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[10]_i_1_n_5 ),
        .Q(sel0__1[9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[10]_i_1_n_4 ),
        .Q(sel0__1[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[14]_i_1_n_7 ),
        .Q(sel0__1[11]));
  CARRY4 \counter_r_reg[14]_i_1 
       (.CI(\counter_r_reg[10]_i_1_n_0 ),
        .CO(\counter_r_reg[14]_i_1_n_3 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\counter_r[14]_i_2_n_0 }),
        .O({\counter_r_reg[14]_i_1_n_6 ,\counter_r_reg[14]_i_1_n_7 }),
        .S({\<const0> ,\<const0> ,\counter_r[14]_i_3_n_0 ,\counter_r[14]_i_4_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[14]_i_1_n_6 ),
        .Q(sel0__1[12]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[2] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r[2]_i_1_n_0 ),
        .Q(sel0));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[3]_i_1_n_6 ),
        .Q(sel0__1[0]));
  CARRY4 \counter_r_reg[3]_i_1 
       (.CI(\<const0> ),
        .CO({\counter_r_reg[3]_i_1_n_0 ,\counter_r_reg[3]_i_1_n_1 ,\counter_r_reg[3]_i_1_n_2 ,\counter_r_reg[3]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[3]_i_2_n_0 ,\counter_r[3]_i_3_n_0 ,\counter_r[3]_i_4_n_0 ,keys_in_IBUF}),
        .O({\counter_r_reg[3]_i_1_n_4 ,\counter_r_reg[3]_i_1_n_5 ,\counter_r_reg[3]_i_1_n_6 ,\NLW_counter_r_reg[3]_i_1_O_UNCONNECTED [0]}),
        .S({\counter_r[3]_i_5_n_0 ,\counter_r[3]_i_6_n_0 ,\counter_r[3]_i_7_n_0 ,\counter_r[3]_i_8_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[3]_i_1_n_5 ),
        .Q(sel0__1[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[3]_i_1_n_4 ),
        .Q(sel0__1[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[6]_i_1_n_7 ),
        .Q(sel0__1[3]));
  CARRY4 \counter_r_reg[6]_i_1 
       (.CI(\counter_r_reg[3]_i_1_n_0 ),
        .CO({\counter_r_reg[6]_i_1_n_0 ,\counter_r_reg[6]_i_1_n_1 ,\counter_r_reg[6]_i_1_n_2 ,\counter_r_reg[6]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[6]_i_2_n_0 ,\counter_r[6]_i_3_n_0 ,\counter_r[6]_i_4_n_0 ,\counter_r[6]_i_5_n_0 }),
        .O({\counter_r_reg[6]_i_1_n_4 ,\counter_r_reg[6]_i_1_n_5 ,\counter_r_reg[6]_i_1_n_6 ,\counter_r_reg[6]_i_1_n_7 }),
        .S({\counter_r[6]_i_6_n_0 ,\counter_r[6]_i_7_n_0 ,\counter_r[6]_i_8_n_0 ,\counter_r[6]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[6]_i_1_n_6 ),
        .Q(sel0__1[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[6]_i_1_n_5 ),
        .Q(sel0__1[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[6]_i_1_n_4 ),
        .Q(sel0__1[6]));
  LUT5 #(
    .INIT(32'hF2220222)) 
    \increment_r[3]_i_1 
       (.I0(\increment_r[3]_i_2_n_0 ),
        .I1(\increment_r[3]_i_3_n_0 ),
        .I2(keys_in_IBUF),
        .I3(\increment_r[3]_i_4_n_0 ),
        .I4(\increment_r_reg_n_0_[3] ),
        .O(\increment_r[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00008000)) 
    \increment_r[3]_i_2 
       (.I0(sel0__1[6]),
        .I1(sel0__1[5]),
        .I2(sel0__1[8]),
        .I3(sel0__1[7]),
        .I4(\increment_r[3]_i_5_n_0 ),
        .O(\increment_r[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF7F)) 
    \increment_r[3]_i_3 
       (.I0(sel0__1[9]),
        .I1(sel0__1[11]),
        .I2(sel0__1[10]),
        .I3(sel0__1[12]),
        .I4(sel0),
        .I5(\increment_r[3]_i_6_n_0 ),
        .O(\increment_r[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFEFFFFFFFF)) 
    \increment_r[3]_i_4 
       (.I0(\increment_r[3]_i_7_n_0 ),
        .I1(\increment_r[3]_i_8_n_0 ),
        .I2(sel0__1[1]),
        .I3(sel0__1[2]),
        .I4(sel0__1[3]),
        .I5(\increment_r[3]_i_9_n_0 ),
        .O(\increment_r[3]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \increment_r[3]_i_5 
       (.I0(sel0__1[0]),
        .I1(keys_in_IBUF),
        .I2(sel0__1[1]),
        .I3(sel0__1[2]),
        .O(\increment_r[3]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \increment_r[3]_i_6 
       (.I0(sel0__1[4]),
        .I1(sel0__1[3]),
        .O(\increment_r[3]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFE)) 
    \increment_r[3]_i_7 
       (.I0(sel0__1[6]),
        .I1(sel0__1[7]),
        .I2(sel0__1[3]),
        .I3(sel0__1[4]),
        .I4(sel0__1[5]),
        .O(\increment_r[3]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFBBF)) 
    \increment_r[3]_i_8 
       (.I0(sel0),
        .I1(sel0__1[0]),
        .I2(sel0__1[11]),
        .I3(sel0__1[12]),
        .O(\increment_r[3]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h80000001)) 
    \increment_r[3]_i_9 
       (.I0(sel0__1[7]),
        .I1(sel0__1[8]),
        .I2(sel0__1[10]),
        .I3(sel0__1[11]),
        .I4(sel0__1[9]),
        .O(\increment_r[3]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \increment_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\increment_r[3]_i_1_n_0 ),
        .Q(\increment_r_reg_n_0_[3] ));
endmodule

(* ORIG_REF_NAME = "wave_gen" *) 
module wave_gen__parameterized5
   (\result_r_reg[14] ,
    DI,
    D,
    S,
    \result_r_reg[10] ,
    \result_r_reg[14]_0 ,
    \result_r_reg[16] ,
    CLK,
    rst_n,
    keys_in_IBUF,
    sel0__1);
  output [11:0]\result_r_reg[14] ;
  output [0:0]DI;
  output [0:0]D;
  output [3:0]S;
  output [3:0]\result_r_reg[10] ;
  output [3:0]\result_r_reg[14]_0 ;
  output [0:0]\result_r_reg[16] ;
  input CLK;
  input rst_n;
  input [0:0]keys_in_IBUF;
  input [12:0]sel0__1;

  wire \<const0> ;
  wire \<const1> ;
  wire CLK;
  wire [0:0]D;
  wire [0:0]DI;
  wire [3:0]S;
  wire \counter_r[11]_i_2_n_0 ;
  wire \counter_r[11]_i_3_n_0 ;
  wire \counter_r[11]_i_4_n_0 ;
  wire \counter_r[11]_i_5_n_0 ;
  wire \counter_r[11]_i_6_n_0 ;
  wire \counter_r[11]_i_7_n_0 ;
  wire \counter_r[11]_i_8_n_0 ;
  wire \counter_r[11]_i_9_n_0 ;
  wire \counter_r[15]_i_2_n_0 ;
  wire \counter_r[3]_i_1_n_0 ;
  wire \counter_r[4]_i_2__0_n_0 ;
  wire \counter_r[4]_i_3__0_n_0 ;
  wire \counter_r[4]_i_4__0_n_0 ;
  wire \counter_r[4]_i_5__0_n_0 ;
  wire \counter_r[4]_i_6__0_n_0 ;
  wire \counter_r[4]_i_7__0_n_0 ;
  wire \counter_r[4]_i_8__0_n_0 ;
  wire \counter_r[7]_i_2_n_0 ;
  wire \counter_r[7]_i_3_n_0 ;
  wire \counter_r[7]_i_4_n_0 ;
  wire \counter_r[7]_i_5_n_0 ;
  wire \counter_r[7]_i_6_n_0 ;
  wire \counter_r[7]_i_7_n_0 ;
  wire \counter_r[7]_i_8_n_0 ;
  wire \counter_r[7]_i_9_n_0 ;
  wire \counter_r_reg[11]_i_1_n_0 ;
  wire \counter_r_reg[11]_i_1_n_1 ;
  wire \counter_r_reg[11]_i_1_n_2 ;
  wire \counter_r_reg[11]_i_1_n_3 ;
  wire \counter_r_reg[11]_i_1_n_4 ;
  wire \counter_r_reg[11]_i_1_n_5 ;
  wire \counter_r_reg[11]_i_1_n_6 ;
  wire \counter_r_reg[11]_i_1_n_7 ;
  wire \counter_r_reg[15]_i_1_n_7 ;
  wire \counter_r_reg[4]_i_1__0_n_0 ;
  wire \counter_r_reg[4]_i_1__0_n_1 ;
  wire \counter_r_reg[4]_i_1__0_n_2 ;
  wire \counter_r_reg[4]_i_1__0_n_3 ;
  wire \counter_r_reg[4]_i_1__0_n_4 ;
  wire \counter_r_reg[4]_i_1__0_n_5 ;
  wire \counter_r_reg[4]_i_1__0_n_6 ;
  wire \counter_r_reg[7]_i_1_n_0 ;
  wire \counter_r_reg[7]_i_1_n_1 ;
  wire \counter_r_reg[7]_i_1_n_2 ;
  wire \counter_r_reg[7]_i_1_n_3 ;
  wire \counter_r_reg[7]_i_1_n_4 ;
  wire \counter_r_reg[7]_i_1_n_5 ;
  wire \counter_r_reg[7]_i_1_n_6 ;
  wire \counter_r_reg[7]_i_1_n_7 ;
  wire \increment_r[4]_i_1_n_0 ;
  wire \increment_r[4]_i_2_n_0 ;
  wire \increment_r[4]_i_3_n_0 ;
  wire \increment_r[4]_i_4_n_0 ;
  wire \increment_r[4]_i_5_n_0 ;
  wire \increment_r[4]_i_6_n_0 ;
  wire \increment_r[4]_i_7_n_0 ;
  wire \increment_r_reg_n_0_[4] ;
  wire [0:0]keys_in_IBUF;
  wire [3:0]\result_r_reg[10] ;
  wire [11:0]\result_r_reg[14] ;
  wire [3:0]\result_r_reg[14]_0 ;
  wire [0:0]\result_r_reg[16] ;
  wire rst_n;
  wire [12:0]sel0__1;
  wire [15:15]sel0__2;
  wire [3:0]\NLW_counter_r_reg[4]_i_1__0_O_UNCONNECTED ;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[11]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[11]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[11]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[11]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[11]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[11]_i_6 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [11]),
        .I2(keys_in_IBUF),
        .O(\counter_r[11]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[11]_i_7 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [10]),
        .I2(keys_in_IBUF),
        .O(\counter_r[11]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[11]_i_8 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [9]),
        .I2(keys_in_IBUF),
        .O(\counter_r[11]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[11]_i_9 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [8]),
        .I2(keys_in_IBUF),
        .O(\counter_r[11]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[15]_i_2 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(sel0__2),
        .I2(keys_in_IBUF),
        .O(\counter_r[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[3]_i_1 
       (.I0(\result_r_reg[14] [0]),
        .I1(keys_in_IBUF),
        .O(\counter_r[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_2__0 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[4]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_3__0 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[4]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[4]_i_4__0 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[4]_i_4__0_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_5__0 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [3]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_5__0_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_6__0 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [2]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_6__0_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[4]_i_7__0 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [1]),
        .I2(keys_in_IBUF),
        .O(\counter_r[4]_i_7__0_n_0 ));
  LUT2 #(
    .INIT(4'h4)) 
    \counter_r[4]_i_8__0 
       (.I0(\result_r_reg[14] [0]),
        .I1(keys_in_IBUF),
        .O(\counter_r[4]_i_8__0_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[7]_i_2 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[7]_i_3 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[7]_i_4 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \counter_r[7]_i_5 
       (.I0(keys_in_IBUF),
        .I1(\increment_r_reg_n_0_[4] ),
        .O(\counter_r[7]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[7]_i_6 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [7]),
        .I2(keys_in_IBUF),
        .O(\counter_r[7]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[7]_i_7 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [6]),
        .I2(keys_in_IBUF),
        .O(\counter_r[7]_i_7_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[7]_i_8 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [5]),
        .I2(keys_in_IBUF),
        .O(\counter_r[7]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \counter_r[7]_i_9 
       (.I0(\increment_r_reg_n_0_[4] ),
        .I1(\result_r_reg[14] [4]),
        .I2(keys_in_IBUF),
        .O(\counter_r[7]_i_9_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[10] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[7]_i_1_n_4 ),
        .Q(\result_r_reg[14] [7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[11] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[11]_i_1_n_7 ),
        .Q(\result_r_reg[14] [8]));
  CARRY4 \counter_r_reg[11]_i_1 
       (.CI(\counter_r_reg[7]_i_1_n_0 ),
        .CO({\counter_r_reg[11]_i_1_n_0 ,\counter_r_reg[11]_i_1_n_1 ,\counter_r_reg[11]_i_1_n_2 ,\counter_r_reg[11]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[11]_i_2_n_0 ,\counter_r[11]_i_3_n_0 ,\counter_r[11]_i_4_n_0 ,\counter_r[11]_i_5_n_0 }),
        .O({\counter_r_reg[11]_i_1_n_4 ,\counter_r_reg[11]_i_1_n_5 ,\counter_r_reg[11]_i_1_n_6 ,\counter_r_reg[11]_i_1_n_7 }),
        .S({\counter_r[11]_i_6_n_0 ,\counter_r[11]_i_7_n_0 ,\counter_r[11]_i_8_n_0 ,\counter_r[11]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[12] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[11]_i_1_n_6 ),
        .Q(\result_r_reg[14] [9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[13] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[11]_i_1_n_5 ),
        .Q(\result_r_reg[14] [10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[14] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[11]_i_1_n_4 ),
        .Q(\result_r_reg[14] [11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[15] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[15]_i_1_n_7 ),
        .Q(sel0__2));
  CARRY4 \counter_r_reg[15]_i_1 
       (.CI(\counter_r_reg[11]_i_1_n_0 ),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(\counter_r_reg[15]_i_1_n_7 ),
        .S({\<const0> ,\<const0> ,\<const0> ,\counter_r[15]_i_2_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[3] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r[3]_i_1_n_0 ),
        .Q(\result_r_reg[14] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1__0_n_6 ),
        .Q(\result_r_reg[14] [1]));
  CARRY4 \counter_r_reg[4]_i_1__0 
       (.CI(\<const0> ),
        .CO({\counter_r_reg[4]_i_1__0_n_0 ,\counter_r_reg[4]_i_1__0_n_1 ,\counter_r_reg[4]_i_1__0_n_2 ,\counter_r_reg[4]_i_1__0_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[4]_i_2__0_n_0 ,\counter_r[4]_i_3__0_n_0 ,\counter_r[4]_i_4__0_n_0 ,keys_in_IBUF}),
        .O({\counter_r_reg[4]_i_1__0_n_4 ,\counter_r_reg[4]_i_1__0_n_5 ,\counter_r_reg[4]_i_1__0_n_6 ,\NLW_counter_r_reg[4]_i_1__0_O_UNCONNECTED [0]}),
        .S({\counter_r[4]_i_5__0_n_0 ,\counter_r[4]_i_6__0_n_0 ,\counter_r[4]_i_7__0_n_0 ,\counter_r[4]_i_8__0_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[5] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1__0_n_5 ),
        .Q(\result_r_reg[14] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[6] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[4]_i_1__0_n_4 ),
        .Q(\result_r_reg[14] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[7] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[7]_i_1_n_7 ),
        .Q(\result_r_reg[14] [4]));
  CARRY4 \counter_r_reg[7]_i_1 
       (.CI(\counter_r_reg[4]_i_1__0_n_0 ),
        .CO({\counter_r_reg[7]_i_1_n_0 ,\counter_r_reg[7]_i_1_n_1 ,\counter_r_reg[7]_i_1_n_2 ,\counter_r_reg[7]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\counter_r[7]_i_2_n_0 ,\counter_r[7]_i_3_n_0 ,\counter_r[7]_i_4_n_0 ,\counter_r[7]_i_5_n_0 }),
        .O({\counter_r_reg[7]_i_1_n_4 ,\counter_r_reg[7]_i_1_n_5 ,\counter_r_reg[7]_i_1_n_6 ,\counter_r_reg[7]_i_1_n_7 }),
        .S({\counter_r[7]_i_6_n_0 ,\counter_r[7]_i_7_n_0 ,\counter_r[7]_i_8_n_0 ,\counter_r[7]_i_9_n_0 }));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[8] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[7]_i_1_n_6 ),
        .Q(\result_r_reg[14] [5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_r_reg[9] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\counter_r_reg[7]_i_1_n_5 ),
        .Q(\result_r_reg[14] [6]));
  LUT6 #(
    .INIT(64'hFF00200000002000)) 
    \increment_r[4]_i_1 
       (.I0(\increment_r[4]_i_2_n_0 ),
        .I1(\increment_r[4]_i_3_n_0 ),
        .I2(\result_r_reg[14] [7]),
        .I3(keys_in_IBUF),
        .I4(\increment_r[4]_i_4_n_0 ),
        .I5(\increment_r_reg_n_0_[4] ),
        .O(\increment_r[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \increment_r[4]_i_2 
       (.I0(\result_r_reg[14] [4]),
        .I1(\result_r_reg[14] [3]),
        .I2(\result_r_reg[14] [2]),
        .I3(\result_r_reg[14] [5]),
        .I4(\result_r_reg[14] [6]),
        .O(\increment_r[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF7FFFFF)) 
    \increment_r[4]_i_3 
       (.I0(\result_r_reg[14] [11]),
        .I1(\result_r_reg[14] [10]),
        .I2(\result_r_reg[14] [9]),
        .I3(sel0__2),
        .I4(\result_r_reg[14] [8]),
        .I5(\increment_r[4]_i_5_n_0 ),
        .O(\increment_r[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF7EFFFFFFFF)) 
    \increment_r[4]_i_4 
       (.I0(\result_r_reg[14] [8]),
        .I1(\result_r_reg[14] [10]),
        .I2(\result_r_reg[14] [9]),
        .I3(\increment_r[4]_i_5_n_0 ),
        .I4(\increment_r[4]_i_6_n_0 ),
        .I5(\increment_r[4]_i_7_n_0 ),
        .O(\increment_r[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \increment_r[4]_i_5 
       (.I0(\result_r_reg[14] [0]),
        .I1(\result_r_reg[14] [1]),
        .O(\increment_r[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFE)) 
    \increment_r[4]_i_6 
       (.I0(\result_r_reg[14] [5]),
        .I1(\result_r_reg[14] [4]),
        .I2(\result_r_reg[14] [7]),
        .I3(\result_r_reg[14] [8]),
        .I4(\result_r_reg[14] [6]),
        .O(\increment_r[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h2400000000000024)) 
    \increment_r[4]_i_7 
       (.I0(\result_r_reg[14] [11]),
        .I1(sel0__2),
        .I2(\result_r_reg[14] [10]),
        .I3(\result_r_reg[14] [3]),
        .I4(\result_r_reg[14] [4]),
        .I5(\result_r_reg[14] [2]),
        .O(\increment_r[4]_i_7_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \increment_r_reg[4] 
       (.C(CLK),
        .CE(\<const1> ),
        .CLR(rst_n),
        .D(\increment_r[4]_i_1_n_0 ),
        .Q(\increment_r_reg_n_0_[4] ));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_1__0
       (.I0(\result_r_reg[14] [7]),
        .I1(sel0__1[7]),
        .O(\result_r_reg[10] [3]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_2__0
       (.I0(\result_r_reg[14] [6]),
        .I1(sel0__1[6]),
        .O(\result_r_reg[10] [2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_3__0
       (.I0(\result_r_reg[14] [5]),
        .I1(sel0__1[5]),
        .O(\result_r_reg[10] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__0_i_4__0
       (.I0(\result_r_reg[14] [4]),
        .I1(sel0__1[4]),
        .O(\result_r_reg[10] [0]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_1__0
       (.I0(\result_r_reg[14] [11]),
        .I1(sel0__1[11]),
        .O(\result_r_reg[14]_0 [3]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_2__0
       (.I0(\result_r_reg[14] [10]),
        .I1(sel0__1[10]),
        .O(\result_r_reg[14]_0 [2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_3__0
       (.I0(\result_r_reg[14] [9]),
        .I1(sel0__1[9]),
        .O(\result_r_reg[14]_0 [1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__1_i_4__0
       (.I0(\result_r_reg[14] [8]),
        .I1(sel0__1[8]),
        .O(\result_r_reg[14]_0 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    result_r0__0_carry__2_i_1__0
       (.I0(sel0__2),
        .O(DI));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry__2_i_2__0
       (.I0(sel0__2),
        .I1(sel0__1[12]),
        .O(\result_r_reg[16] ));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_1__0
       (.I0(\result_r_reg[14] [3]),
        .I1(sel0__1[3]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_2__0
       (.I0(\result_r_reg[14] [2]),
        .I1(sel0__1[2]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_3__0
       (.I0(\result_r_reg[14] [1]),
        .I1(sel0__1[1]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h6)) 
    result_r0__0_carry_i_4__0
       (.I0(\result_r_reg[14] [0]),
        .I1(sel0__1[0]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \result_r[3]_i_1 
       (.I0(\result_r_reg[14] [0]),
        .I1(sel0__1[0]),
        .O(D));
endmodule
