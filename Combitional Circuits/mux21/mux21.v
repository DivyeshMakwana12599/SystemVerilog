module mux21 (output out, input a, input b, input sel);
    assign out = (sel==0)?a:b;
endmodule