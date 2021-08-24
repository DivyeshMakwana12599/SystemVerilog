module SRLatch (
    input r, s, en, output reg q, q_inverted
);
assign en = 1;
always@(*) begin
    case ({r,s})
        2'b00: q = q;
        2'b01: q = 1'b1;
        2'b10: q = 1'b0;
        2'b11: q = 0;
        default: q = 0;
    endcase
    q_inverted = ~q;
end
initial begin
    q_inverted = 0;
    q = 0;
end
endmodule