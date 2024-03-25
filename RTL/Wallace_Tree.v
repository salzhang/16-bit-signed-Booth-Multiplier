`timescale 1ns / 1ps

module Wallace_Tree(input wire [31:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8,
output wire [31:0] product);
    //Stage-1
    wire [31:0] S1A1_PS,S1A1_PC,S1A2_PS,S1A2_PC;
    CSA Stage1_CSA1(.A(PP1),.B(PP2),.D(PP3),.PS(S1A1_PS),.PC(S1A1_PC));
    CSA Stage1_CSA2(.A(PP4),.B(PP5),.D(PP6),.PS(S1A2_PS),.PC(S1A2_PC));
    //Stage-2
    wire [31:0] S2A1_PS,S2A1_PC,S2A2_PS,S2A2_PC;
    CSA Stage2_CSA1(.A(S1A1_PS),.B(S1A1_PC<<1),.D(S1A2_PS),.PS(S2A1_PS),.PC(S2A1_PC));
    CSA Stage2_CSA2(.A(S1A2_PC<<1),.B(PP7),.D(PP8),.PS(S2A2_PS),.PC(S2A2_PC));
    //Stage-3
    wire [31:0] S3_PC,S3_PS;
    CSA Stage3_CSA(.A(S2A2_PS),.B(S2A1_PS),.D(S2A1_PC<<1),.PS(S3_PS),.PC(S3_PC));
    //Stage-4
    wire [31:0] S4_PS,S4_PC;
    CSA Stage4_CSA(.A(S2A2_PC<<1),.B(S3_PC<<1),.D(S3_PS),.PS(S4_PS),.PC(S4_PC));
    //Stage-5
    KSA_top_level Stage5_KSA(.a(S4_PS),.b({S4_PC[30:0],1'b0}),.cin(1'b0),.sum(product),.cout());
endmodule
