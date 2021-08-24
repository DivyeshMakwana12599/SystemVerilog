`timescale 1ns/1ps

module mux21_tb;
    reg a, b, c, d;
    reg [1:0]sel;
    wire out;

    mux41 M1(out, a, b, c, d, sel);

    task fail; begin
        $display("a, b, c, d, sel = %b%b%b%b%0d and out = %b is wrong", a, b, c, d, sel, out);
        $finish();
    end
    endtask

    task pass; 
        $display("a, b, sel = %b%b%b and out = %b", a, b, sel, out);
    endtask

    task verify; begin
        if (sel == 2'b00 & out != a) fail();
        else if (sel == 2'b01 & out != b) fail();
        else if (sel == 2'b10 & out != c) fail();
        else if (sel == 2'b11 & out != d) fail();
        else pass();
    end
    endtask

    integer i;
    
    initial begin
        // $dumpfile("ww.vcd");
        // $dumpfile(0, mux21_tb);
        
        // for (i = 0; i<64; i = i + 1) begin
        //     {a, b, c, d, sel} = i;
        //     #10;
        //     verify();
        // end

        // using fault modeling teqniques 
        for(i = 0; i<4; i = i + 1) begin
            sel = i;
            {d,c,b,a} = 1'b1 << i;
            #10;
            verify();
            {d,c,b,a} = ~(1'b1 << i);
            #10;
            verify();
        end

        $display("Testbench sucessfully completed");
        $finish();

    end
endmodule