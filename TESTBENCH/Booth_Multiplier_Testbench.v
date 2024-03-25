`timescale 1ns / 1ps

module Booth_Multiplier_Testbench;
    reg clk,rst;
    reg  [15:0] M,Q;
    wire [31:0] product;
    Booth_Multiplier my_Booth_Multiplier(.clk(clk),.rst(rst),.M(M),.Q(Q),.product(product));
    

    reg  [31:0] check;   // 32-bit value to check correctness
    //integer num_correct; // counter to keep track of the number correct
    //integer num_wrong;   // counter to keep track of the number wrong
    
    //clk generating
    always begin
        clk = 0 ; #5;
        clk = 1 ; #5;
    end


    initial begin
         $display("Running testbench, this may take a minute or two...");
        //reset generating
        rst = 1'b0;
        M = 0; Q = 0;
        check = 0;
        #2.5 
        rst = 1'b1;

        // initialize the counter variables
        //num_correct = 0; num_wrong = 0;
        //Normal case 1
        M = 18; Q = 999;
        check= $signed(M) * $signed(Q);
        #10
        //Normal case 2
        M = 14234; Q = 14244;
        check= $signed(M) * $signed(Q);
        #10
        //Normal case 3
        M = 1; Q = 11111;
        check= $signed(M) * $signed(Q);
        #10
        //Normal case 4
        M = -2311; Q = 11111;
        check= $signed(M) * $signed(Q);
        #10
        //Corner case 1
        M = 16'hffff; Q = 16'hffff;
        check= $signed(M) * $signed(Q);
        #10
        //Corner case 2
        M = 16'h7fff; Q = 16'h7fff;
        check= $signed(M) * $signed(Q);
        #10
        //Corner case 3
        M = 16'h8000; Q = 16'h8000;
        check= $signed(M) * $signed(Q);
        #100

        //$display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
        $finish;
    end



endmodule
