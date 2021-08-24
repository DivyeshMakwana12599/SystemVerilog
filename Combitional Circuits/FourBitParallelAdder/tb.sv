module tb;
    reg [3:0]A, B;
    reg Cin;
    wire [3:0]Sum;
    wire Carry;


    FourBitParallelAdder dut(Sum, Carry, A, B, Cin);
    integer i;
    reg [4:0]temp;
    
    initial begin 
        for (i = 0; i<512; i++) begin
            {A, B, Cin} = i;
            temp = A + B + Cin;
            #10;
            if(temp[3:0] == Sum & temp[4] == Carry) $display("passed coz A=%0d B=%0d Cin=%b Sum=%0d Carry=%b & temp=%0d", A, B, Cin, Sum, Carry, temp);
            else begin
                $display("failed coz A=%0d B=%0d Cin=%b Sum=%0d Carry=%b & temp=%0d", A, B, Cin, Sum, Carry, temp);
                $finish();
            end
        end
    end

endmodule 