module HalfAdder(Sum, Carry, A, B);
    output Sum, Carry;
    input A, B;
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule

