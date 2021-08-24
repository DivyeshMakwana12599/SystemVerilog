module dff(output reg q, output q_inverted, input d, input clk);
  initial q = 0;
  assign q_inverted = ~q;
  always@(posedge clk)begin
    q = d;
  end
endmodule: dff