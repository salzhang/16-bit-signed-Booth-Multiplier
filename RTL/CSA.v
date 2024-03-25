`timescale 1ns / 1ps

module CSA(input wire [31:0] A,B,D,
output wire [31:0] PS, PC);
    //A + B + D
    //PS stands for Partial Sum
    //PC stands for Partial Carry
    FA FA0(.a(A[0]),.b(B[0]),.cin(D[0]),.sum(PS[0]),.cout(PC[0]));
    FA FA1(.a(A[1]),.b(B[1]),.cin(D[1]),.sum(PS[1]),.cout(PC[1]));
    FA FA2(.a(A[2]),.b(B[2]),.cin(D[2]),.sum(PS[2]),.cout(PC[2]));
    FA FA3(.a(A[3]), .b(B[3]), .cin(D[3]), .sum(PS[3]), .cout(PC[3]));
    FA FA4(.a(A[4]), .b(B[4]), .cin(D[4]), .sum(PS[4]), .cout(PC[4]));
    FA FA5(.a(A[5]), .b(B[5]), .cin(D[5]), .sum(PS[5]), .cout(PC[5]));
    FA FA6(.a(A[6]), .b(B[6]), .cin(D[6]), .sum(PS[6]), .cout(PC[6]));
    FA FA7(.a(A[7]), .b(B[7]), .cin(D[7]), .sum(PS[7]), .cout(PC[7]));
    FA FA8(.a(A[8]), .b(B[8]), .cin(D[8]), .sum(PS[8]), .cout(PC[8]));
    FA FA9(.a(A[9]), .b(B[9]), .cin(D[9]), .sum(PS[9]), .cout(PC[9]));
    FA FA10(.a(A[10]), .b(B[10]), .cin(D[10]), .sum(PS[10]), .cout(PC[10]));
    FA FA11(.a(A[11]), .b(B[11]), .cin(D[11]), .sum(PS[11]), .cout(PC[11]));
    FA FA12(.a(A[12]), .b(B[12]), .cin(D[12]), .sum(PS[12]), .cout(PC[12]));
    FA FA13(.a(A[13]), .b(B[13]), .cin(D[13]), .sum(PS[13]), .cout(PC[13]));
    FA FA14(.a(A[14]), .b(B[14]), .cin(D[14]), .sum(PS[14]), .cout(PC[14]));
    FA FA15(.a(A[15]), .b(B[15]), .cin(D[15]), .sum(PS[15]), .cout(PC[15]));
    FA FA16(.a(A[16]), .b(B[16]), .cin(D[16]), .sum(PS[16]), .cout(PC[16]));
    FA FA17(.a(A[17]), .b(B[17]), .cin(D[17]), .sum(PS[17]), .cout(PC[17]));
    FA FA18(.a(A[18]), .b(B[18]), .cin(D[18]), .sum(PS[18]), .cout(PC[18]));
    FA FA19(.a(A[19]), .b(B[19]), .cin(D[19]), .sum(PS[19]), .cout(PC[19]));
    FA FA20(.a(A[20]), .b(B[20]), .cin(D[20]), .sum(PS[20]), .cout(PC[20]));
    FA FA21(.a(A[21]), .b(B[21]), .cin(D[21]), .sum(PS[21]), .cout(PC[21]));
    FA FA22(.a(A[22]), .b(B[22]), .cin(D[22]), .sum(PS[22]), .cout(PC[22]));
    FA FA23(.a(A[23]), .b(B[23]), .cin(D[23]), .sum(PS[23]), .cout(PC[23]));
    FA FA24(.a(A[24]), .b(B[24]), .cin(D[24]), .sum(PS[24]), .cout(PC[24]));
    FA FA25(.a(A[25]), .b(B[25]), .cin(D[25]), .sum(PS[25]), .cout(PC[25]));
    FA FA26(.a(A[26]), .b(B[26]), .cin(D[26]), .sum(PS[26]), .cout(PC[26]));
    FA FA27(.a(A[27]), .b(B[27]), .cin(D[27]), .sum(PS[27]), .cout(PC[27]));
    FA FA28(.a(A[28]), .b(B[28]), .cin(D[28]), .sum(PS[28]), .cout(PC[28]));
    FA FA29(.a(A[29]), .b(B[29]), .cin(D[29]), .sum(PS[29]), .cout(PC[29]));
    FA FA30(.a(A[30]), .b(B[30]), .cin(D[30]), .sum(PS[30]), .cout(PC[30]));
    FA FA31(.a(A[31]), .b(B[31]), .cin(D[31]), .sum(PS[31]), .cout(PC[31]));
endmodule
