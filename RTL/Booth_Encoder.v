`timescale 1ns / 1ps

module Booth_Encoder(input wire [15:0] M, input wire [15:0] Q,
output wire [31:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8);
    //M is 16-bit multiplicand, Q is 16-bit multiplier
    //PP1~8 is 32-bit partial product

    //Booth Encoding of multiplier
    wire Q_init = 1'b0; //Q(-1)
    //We will have 8 windows for a 16-bit signed multiplier
    wire [2:0] W1,W2,W3,W4,W5,W6,W7,W8;
    //Each window is in the form of [Qi+1,Qi,Qi-1]
    //There is one-bit overlap bewtween each window
    assign W1 = {Q[1],Q[0],Q_init};
    assign W2 = {Q[3],Q[2],Q[1]};
    assign W3 = {Q[5],Q[4],Q[3]};
    assign W4 = {Q[7],Q[6],Q[5]};
    assign W5 = {Q[9],Q[8],Q[7]};
    assign W6 = {Q[11],Q[10],Q[9]};
    assign W7 = {Q[13],Q[12],Q[11]};
    assign W8 = {Q[15],Q[14],Q[13]};
    //Then we need to calculate partial product PPi
    //First we need to sign-extend the multiplicand M
    wire [31:0] M_se = {{16{M[15]}},M};
    //Then, we need to decode those windows to have partial product for Wallace tree
    //Five different flags of Booth Encoding
    wire [31:0] PP_zero = 32'b0;
    wire [31:0] PP_pos_M = M_se;
    wire [31:0] PP_neg_M;
    KSA_top_level KSA_for_PP_neg_M(.a(~M_se),.b(32'b0),.cin(1'b1),.sum(PP_neg_M),.cout());
    wire [31:0] PP_pos_2M = M_se<<1;
    wire [31:0] PP_neg_2M = PP_neg_M<<1;
    
    //Partial Product 1
    wire [31:0] PP1_flag;
    assign PP1_flag = (W1[2])?(W1[1]?(W1[0]?PP_zero:PP_neg_M):(W1[0]?PP_neg_M:PP_neg_2M))
    :(W1[1]?(W1[0]?PP_pos_2M:PP_pos_M):(W1[0]?PP_pos_M:PP_zero));
    assign PP1 = PP1_flag;
    //Partial Product 2
    wire [31:0] PP2_flag;
    assign PP2_flag = (W2[2])?(W2[1]?(W2[0]?PP_zero:PP_neg_M):(W2[0]?PP_neg_M:PP_neg_2M))
    :(W2[1]?(W2[0]?PP_pos_2M:PP_pos_M):(W2[0]?PP_pos_M:PP_zero));
    assign PP2 = PP2_flag<<2;
    //Partial Product 3
    wire [31:0] PP3_flag;
    assign PP3_flag = (W3[2])?(W3[1]?(W3[0]?PP_zero:PP_neg_M):(W3[0]?PP_neg_M:PP_neg_2M))
    :(W3[1]?(W3[0]?PP_pos_2M:PP_pos_M):(W3[0]?PP_pos_M:PP_zero));
    assign PP3 = PP3_flag<<4;
    //Partial Product 4
    wire [31:0] PP4_flag;
    assign PP4_flag = (W4[2])?(W4[1]?(W4[0]?PP_zero:PP_neg_M):(W4[0]?PP_neg_M:PP_neg_2M))
    :(W4[1]?(W4[0]?PP_pos_2M:PP_pos_M):(W4[0]?PP_pos_M:PP_zero));
    assign PP4 = PP4_flag<<6;
    //Partial Product 5
    wire [31:0] PP5_flag;
    assign PP5_flag = (W5[2])?(W5[1]?(W5[0]?PP_zero:PP_neg_M):(W5[0]?PP_neg_M:PP_neg_2M))
    :(W5[1]?(W5[0]?PP_pos_2M:PP_pos_M):(W5[0]?PP_pos_M:PP_zero));
    assign PP5 = PP5_flag<<8;
    //Partial Product 6
    wire [31:0] PP6_flag;
    assign PP6_flag = (W6[2])?(W6[1]?(W6[0]?PP_zero:PP_neg_M):(W6[0]?PP_neg_M:PP_neg_2M))
    :(W6[1]?(W6[0]?PP_pos_2M:PP_pos_M):(W6[0]?PP_pos_M:PP_zero));
    assign PP6 = PP6_flag<<10;
    //Partial Product 7
    wire [31:0] PP7_flag;
    assign PP7_flag = (W7[2])?(W7[1]?(W7[0]?PP_zero:PP_neg_M):(W7[0]?PP_neg_M:PP_neg_2M))
    :(W7[1]?(W7[0]?PP_pos_2M:PP_pos_M):(W7[0]?PP_pos_M:PP_zero));
    assign PP7 = PP7_flag<<12;
    //Partial Product 8
    wire [31:0] PP8_flag;
    assign PP8_flag = (W8[2])?(W8[1]?(W8[0]?PP_zero:PP_neg_M):(W8[0]?PP_neg_M:PP_neg_2M))
    :(W8[1]?(W8[0]?PP_pos_2M:PP_pos_M):(W8[0]?PP_pos_M:PP_zero));
    assign PP8 = PP8_flag<<14;
endmodule
