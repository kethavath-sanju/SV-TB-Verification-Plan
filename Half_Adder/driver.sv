class driver;
  packet pkt_d;
  
  mailbox mbx; // LOCAL HANDLE OF MAILBOX
  
  virtual ha_intf vif; // LOCAL HANDLE OF VIRTUAL INTERFACE 
  
  function new (mailbox gen2drv, virtual ha_intf vif);
    mbx=gen2drv;
    this.vif=vif;
  endfunction
  
  task run();
    begin
      forever
        begin
          mbx.get(pkt_d);
          pkt_d.print("DRIVER");
          
          vif.a <= pkt_d.a; //why non_blocking assignments? 
          vif.b <= pkt_d.b;
          #1;
        end
    end
  endtask
endclass