class packet;
  rand bit d;
  bit q;
  bit q_inverted;
  
  function void display(string whereFrom);
    $display("%s values are d = %b q = %b q' = %b", whereFrom , d, q, q_inverted);
  endfunction
endclass