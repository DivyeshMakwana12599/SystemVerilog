module tb;
    reg [3:0]A, B;
    reg Sel;
    wire [3:0]Sum;
    wire Carry;


    FourBitAdderSubractor dut(.Sum(Sum), .Carry(Carry), .A(A), .B(B), .Sel(Sel));
    integer i;
    reg [4:0]Addition, Subraction;
    
    initial begin 
        $dumpfile("ww.vcd");
        $dumpvars(0, tb);
        for (i = 0; i<512; i++) begin
            {A, B, Sel} = i;
            Addition = A + B + Sel;
            Subraction = A - B;
            #10;
            if(Sel == 0 & Addition[3:0] == Sum & Addition[4] == Carry) 
                $display("pased coz A=%0d B=%0d Sel=%b Sum=%0d Carry=%b & Addition=%0d Subraction=%0d", A, B, Sel, Sum, Carry, Addition, Subraction);
            else if(Sel == 1 & Subraction[3:0] == Sum & Subraction[4] == ~Carry) 
                $display("pased coz A=%0d B=%0d Sel=%b Sum=%0d Carry=%b & Addition=%0d Subraction=%0d", A, B, Sel, Sum, Carry, Addition, Subraction);
            else begin
                $display("failed coz A=%0d B=%0d Sel=%b Sum=%0d Carry=%b & Addition=%0d Subraction=%0d", A, B, Sel, Sum, Carry, Addition, Subraction);
                $finish();
            end
        end
    end

endmodule 