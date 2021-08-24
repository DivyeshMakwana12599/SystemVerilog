module HalfAdder_tb;
    reg A, B;
    wire Sum, Carry;

    HalfAdder A1 (.Sum(Sum), .Carry(Carry), .A(A), .B(B));
    
    task fail; begin
        $display("A, B = %b%b and Sum = %b, Carry = %b is wrong", A, B, Sum, Carry);
        $finish();
    end
    endtask

    task pass; 
        $display("A, B = %b%b and Sum = %b, Carry = %b", A, B, Sum, Carry);
    endtask
    
    integer i;
    reg [1:0]temp;

    initial begin
        for (i = 0; i<4; i++) begin
            {A, B} = i;
            temp = A + B;
            #10;
            if(temp[0] == Sum & temp[1] == Carry) pass();
            else fail();
        end
    end
endmodule