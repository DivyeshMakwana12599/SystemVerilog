`include "packet.sv"

class genrator;
  rand packet p;
  int count = 32'd1;
  mailbox m_box;
  event ended;
  function new(mailbox m_box); begin
    this.m_box = m_box;
  end
  endfunction: new
  task createRandomPacket;
    repeat(count) begin
        p = new();
        if(!p.randomize()) 
            $fatal("packet randomization failed");
        m_box.put(p);
    end
    ->ended;
  endtask: createRandomPacket
endclass: genrator