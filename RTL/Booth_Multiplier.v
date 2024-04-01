`timescale 1ns / 1ps

module Booth_Multiplier(input wire clk, input wire rst, 
input wire [15:0] M, input wire [15:0] Q,
output wire [31:0] product);
    //Encoder Stage
    // reg [15:0] M_tmp,Q_tmp;
    // always@(posedge clk or negedge rst) begin
    //     if(!rst) begin
    //         M_tmp<=0;
    //         Q_tmp<=0;
    //     end
    //     else begin
    //         M_tmp<=M; Q_tmp<=Q;
    //     end
    // end
    wire [31:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8;
    Booth_Encoder Stage1(.M(M),.Q(Q),.PP1(PP1),.PP2(PP2),.PP3(PP3),
    .PP4(PP4),.PP5(PP5),.PP6(PP6),.PP7(PP7),.PP8(PP8));
    //Pipeline Registers
    reg [31:0] PP1_tmp,PP2_tmp,PP3_tmp,PP4_tmp,PP5_tmp,PP6_tmp,PP7_tmp,PP8_tmp;
    always@(posedge clk) begin
        if(!rst) begin
            PP1_tmp<=0;PP2_tmp<=0;PP3_tmp<=0;PP4_tmp<=0;
            PP5_tmp<=0;PP6_tmp<=0;PP7_tmp<=0;PP8_tmp<=0;
        end
        else begin
            PP1_tmp<=PP1; PP2_tmp<=PP2;
            PP3_tmp<=PP3; PP4_tmp<=PP4;
            PP5_tmp<=PP5; PP6_tmp<=PP6;
            PP7_tmp<=PP7; PP8_tmp<=PP8;
        end
    end
    //Addition Stage
    // wire [31:0] product_temp;
    Wallace_Tree Stage2(.PP1(PP1_tmp),.PP2(PP2_tmp),.PP3(PP3_tmp),.PP4(PP4_tmp),
    .PP5(PP5_tmp),.PP6(PP6_tmp),.PP7(PP7_tmp),.PP8(PP8_tmp),.product(product));

    // always@(posedge clk or negedge rst) begin
    //     if(!rst) begin
    //         product <=0;
    //         product <=0;
    //     end
    //     else begin
    //         product<=product_temp;
    //     end
    // end

endmodule
