class driver;
    virtual intf vif;
    mailbox m_box;
    function  new(virtual intf vif, mailbox m_box);
        this.vif = vif;
        this.m_box = m_box;        
    endfunction: new

endclass: driver