module HalfAdder_tb;
    reg A, B, Cin;
    wire Sum, Carry;

    FullAdder dut (.Sum(Sum), .Carry(Carry), .A(A), .B(B), .Cin(Cin));
    
    task fail; begin
        $display("A, B, Cin = %b%b%b and Sum = %b, Carry = %b is wrong", A, B, Cin, Sum, Carry);
        $finish();
    end
    endtask

    task pass; 
        $display("A, B = %b%b%b and Sum = %b, Carry = %b", A, B, Cin, Sum, Carry);
    endtask
    
    integer i;
    reg [1:0]temp;

    initial begin
        for (i = 0; i<8; i++) begin
            {A, B, Cin} = i;
            temp = A + B + Cin;
            #10;
            if(temp[0] == Sum & temp[1] == Carry) pass();
            else fail();
        end
    end
endmodule