class rd_monitor;
  packet pkt_rm;
  
  virtual ha_intf vif;
  
  mailbox rmon2sbc;
  
  function new(virtual ha_intf vif,mailbox rmon2sbc);
    this.vif=vif;
    this.rmon2sbc=rmon2sbc;
  endfunction
  
  task run();
    begin
      pkt_rm=new();
      repeat(5)
        begin
          #1;
          pkt_rm.a = vif.a;
          pkt_rm.b = vif.b;
          
          pkt_rm.sum=vif.sum;
          pkt_rm.carry=vif.carry;
          
          //pkt_rm.print("READ_MONITOR");
          rmon2sbc.put(pkt_rm);
        end
    end
  endtask
endclass