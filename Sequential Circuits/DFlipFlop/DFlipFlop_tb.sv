`timescale 1ns/100ps
module DFlipFlop_tb;
    reg a, clk;
    wire q, q_inverted;
    DFlipFlop D1(q, q_inverted, a, clk);
    integer i;
    always #10 clk = ~clk;
    initial begin
        clk = 0;
        a = 0;
        $dumpfile("ww.vcd");
        $dumpvars(0, DFlipFlop_tb);
        for (i = 0; i<30; i = i + 1) begin
            a = ~a;
            #3;
        end
        $finish();
    end
endmodule