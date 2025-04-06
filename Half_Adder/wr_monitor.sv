class wr_monitor;
  packet pkt_wm;
  
  mailbox mbx; // LOCAL MAILBOX HANDLE
  
  virtual ha_intf vif; // LOCAL VIRTUAL INTERFACE HANDLE
  
  function new(mailbox wmon2rm,virtual ha_intf vif);
    mbx=wmon2rm;
    this.vif=vif;
  endfunction
  
  task run();
    begin
      pkt_wm=new();
      repeat(5)
        begin
          #1;
          pkt_wm.a = vif.a;
          pkt_wm.b = vif.b;
    
          //pkt_wm.print("WRITE_MONITOR");
          mbx.put(pkt_wm);
        end
    end
  endtask
  
endclass