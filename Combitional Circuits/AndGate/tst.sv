`timescale 1ns/100ps
module tst;
    reg a;
    reg b;
    wire y;

    AndGate uut(.a(a),.b(b),.y(y));
    initial begin
        $dumpfile("tst.vcd");
        $dumpvars(0, tst);
        a = 0;
        b = 0;
        #10;
        a = 0;
        b = 1;
        #10;
        a = 1;
        b = 0;
        #10;
        a = 1;
        b = 1;
        #10;

    end
    
    initial begin
        $monitor("t=%3d x=%d,y=%d,z=%d \n",$time, a, b, y);
    end
endmodule
