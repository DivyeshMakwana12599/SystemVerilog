module mux21 (output out, input a, input b, input sel);
    assign out = (sel==0)?a:b;
endmodule

module mux41(output out , input a, b, c, d, input [1:0]sel);
    wire [1:0]w;
    mux21 M1(w[0], a, b, sel[0]);
    mux21 M2(w[1], c, d, sel[0]);
    mux21 M3(out, w[0], w[1], sel[1]);
endmodule