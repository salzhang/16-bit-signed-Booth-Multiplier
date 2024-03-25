`timescale 1ns / 1ps

module FA(input wire a,b,cin,
output wire sum,cout);
    assign sum = a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule
