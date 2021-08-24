module FullAdder (Sum, Carry, A, B, Cin);
    output Sum, Carry;
    input A, B, Cin;
    wire w1, w2, w3;

    HalfAdder A1(.Sum(w1), .Carry(w2), .A(A), .B(B));
    HalfAdder A2(.Sum(Sum), .Carry(w3), .A(w1), .B(Cin));
    assign Carry = w2 | w3;
endmodule