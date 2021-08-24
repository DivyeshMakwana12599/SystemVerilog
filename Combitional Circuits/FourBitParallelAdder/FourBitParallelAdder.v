module FourBitParallelAdder (Sum, Carry, A, B, Cin);
    output [3:0]Sum;
    output Carry;
    input [3:0]A, B;
    input Cin;
    wire [2:0]w;


    FullAdder A0(.Sum(Sum[0]), .Carry(w[0]), .A(A[0]), .B(B[0]), .Cin(Cin));
    FullAdder A1(.Sum(Sum[1]), .Carry(w[1]), .A(A[1]), .B(B[1]), .Cin(w[0]));
    FullAdder A2(.Sum(Sum[2]), .Carry(w[2]), .A(A[2]), .B(B[2]), .Cin(w[1]));
    FullAdder A3(.Sum(Sum[3]), .Carry(Carry), .A(A[3]), .B(B[3]), .Cin(w[2]));
    

endmodule