module FourBitAdderSubractor (Sum, Carry, A, B, Sel);
    output [3:0]Sum;
    output Carry;
    input [3:0]A, B;
    input Sel;
    wire [2:0]w;
    wire [3:0]i;

    assign i = B ^ {4{Sel}};
    FullAdder A0(.Sum(Sum[0]), .Carry(w[0]), .A(A[0]), .B(i[0]), .Cin(Sel));
    FullAdder A1(.Sum(Sum[1]), .Carry(w[1]), .A(A[1]), .B(i[1]), .Cin(w[0]));
    FullAdder A2(.Sum(Sum[2]), .Carry(w[2]), .A(A[2]), .B(i[2]), .Cin(w[1]));
    FullAdder A3(.Sum(Sum[3]), .Carry(Carry), .A(A[3]), .B(i[3]), .Cin(w[2]));
    

endmodule