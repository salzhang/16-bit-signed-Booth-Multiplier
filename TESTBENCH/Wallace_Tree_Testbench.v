`timescale 1ns / 1ps
module Wallace_Tree_Testbench;
    reg [31:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8;
    wire [31:0] product;
    Wallace_Tree my_Wallace_Tree(.PP1(PP1),.PP2(PP2),.PP3(PP3),.PP4(PP4),
    .PP5(PP5),.PP6(PP6),.PP7(PP7),.PP8(PP8),.product(product));
    reg [31:0] check;
    integer num_correct; // counter to keep track of the number correct
    integer num_wrong;   // counter to keep track of the number wrong

    initial begin
         $display("Running testbench, this may take a minute or two...");
        // initialize the counter variables
        num_correct = 0; num_wrong = 0;
        //Normal case 1
        PP1 = 0; PP2 = 1; PP3 = 2; PP4 = 4;
        PP5 = 8; PP6 = 16; PP7 = 32; PP8 = 64;
        check= $signed(PP1) + $signed(PP2)+ $signed(PP3) + $signed(PP4)
        + $signed(PP5) + $signed(PP6)+ $signed(PP7) + $signed(PP8);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d + %d + %d + %d + %d + %d + %d + %d",
                check, PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8);
        end
        #20
        //Normal case 2
        PP1 = 0; PP2 = 1; PP3 = 3; PP4 = 7;
        PP5 = 15; PP6 = 31; PP7 = 63; PP8 = 127;
        check= $signed(PP1) + $signed(PP2)+ $signed(PP3) + $signed(PP4)
        + $signed(PP5) + $signed(PP6)+ $signed(PP7) + $signed(PP8);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d + %d + %d + %d + %d + %d + %d + %d",
                check, PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8);
        end
        #20
        //Normal case 3
        PP1 = 11111; PP2 = 22222; PP3 = 33333; PP4 = 44444;
        PP5 = 88888; PP6 = 166666; PP7 = 322222; PP8 = 644444;
        check= $signed(PP1) + $signed(PP2)+ $signed(PP3) + $signed(PP4)
        + $signed(PP5) + $signed(PP6)+ $signed(PP7) + $signed(PP8);
        #2
        if (product == check) begin
                num_correct = num_correct + 1;
        end else begin
                num_wrong = num_wrong + 1;
                $display("wrong number %d = %d + %d + %d + %d + %d + %d + %d + %d",
                check, PP1, PP2, PP3, PP4, PP5, PP6, PP7, PP8);
        end
        #20

        $display("num_correct = %d, num_wrong = %d", num_correct, num_wrong);
        $finish;
    end

endmodule
