module DFlipFlop (output reg q, output reg q_inverted,input a, input clk);
    initial begin
        q = 0;
        q_inverted = 1;
    end
    always @(posedge clk) begin
        q = a;
        q_inverted = ~q; 
    end
endmodule