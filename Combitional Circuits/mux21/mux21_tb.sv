module mux21_tb;
    reg a, b, sel;
    wire out;

    mux21 M1(out, a, b, sel);

    task fail; begin
        $display("a, b, sel = %b%b%b and out = %b is wrong", a, b, sel, out);
        $finish();
    end
    endtask
    task pass; 
        $display("a, b, sel = %b%b%b and out = %b", a, b, sel, out);
    endtask
    
    integer i;
    
    initial begin
        // $dumpfile("ww.vcd");
        // $dumpfile(0, mux21_tb);
        for (i = 0; i<8; i = i + 1) begin
            {a, b, sel} = i;
            #10;
            if (sel == 1'b0 & out != a) fail();
            else if (sel == 1'b1 & out != b) fail();
            else pass();
        end
        $display("Testbench sucessfully completed");
        $finish();
    end
endmodule
