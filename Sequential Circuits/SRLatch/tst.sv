`timescale 1ns/100ps
module tst;
reg r, s,en;
wire q, q_inverted;
SRLatch uut(.r(r), .s(s), .en(en), .q(q), .q_inverted(q_inverted));

initial begin
    $dumpfile("tst.vcd");
    $dumpvars(0, tst);

    r = 0;
    s = 0;
    en = 1;
    #10;
    r = 0;
    s = 1;
    #10;    
    r = 1;
    s = 0;
    #10;    
    r = 1;
    s = 1;
    #10;
    r = 0;
    s = 0;
    #10;
    r = 1;
    s = 1;
    #30;
    $finish;
    $stop;
end
endmodule
