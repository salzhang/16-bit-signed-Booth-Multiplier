`timescale 1ns / 1ps

module Booth_Encoder_Testbench;
    reg  [15:0] M,Q;
    wire [31:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8;
    Booth_Encoder my_booth_encoder(.M(M),.Q(Q),.PP1(PP1),.PP2(PP2),.PP3(PP3),
    .PP4(PP4),.PP5(PP5),.PP6(PP6),.PP7(PP7),.PP8(PP8));
    reg  [31:0] check;   // 32-bit value to check correctness
    wire [31:0] product;
    assign product = PP1+PP2+PP3+PP4+PP5+PP6+PP7+PP8;
    integer num_correct; // counter to keep track of the number correct
    integer num_wrong;   // counter to keep track of the number wrong

    initial begin
         $display("Running testbench, this may take a minute or two...");
        // initialize the counter variables
        num_correct = 0; num_wrong = 0;
        //Normal case 1
        M = 18; Q = 999;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        #20
        //Normal case 2
        M = 14234; Q = 14244;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        #20
        //Normal case 3
        M = 1; Q = 11111;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        //Normal case 4
        M = -2311; Q = 11111;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        #20
        //Corner case 1
        M = 16'hffff; Q = 16'hffff;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        #20
        //Corner case 2
        M = 16'h7fff; Q = 16'h7fff;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        #20
        //Corner case 3
        M = 16'h8000; Q = 16'h8000;
        check= $signed(M) * $signed(Q);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d * %d", check, M, Q);
        end
        #20

        $display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
        $finish;
    end
    

endmodule
