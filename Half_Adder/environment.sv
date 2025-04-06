class environment;
  
  generator gen; // all components should be declated with handles
  driver drv;
  wr_monitor wr_mon;
  rd_monitor rd_mon;
  ref_model rm;
  scoreboard sbc;
  
  mailbox gen2drv=new(); //all mailbox's is created 
  mailbox wmon2rm=new();
  mailbox rmon2sbc=new();
  mailbox ref2sbc=new();
  
 // virtual ha_intf vif;
  
  function new(virtual ha_intf vif);
    //construct new in this you have to call all                                  //your new constructs from different components
    gen=new(gen2drv);
    drv=new(gen2drv,vif);
    wr_mon=new(wmon2rm,vif);
    rd_mon=new(vif,rmon2sbc);
    rm=new(wmon2rm,ref2sbc);
    sbc=new(ref2sbc,rmon2sbc);
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      wr_mon.run();
      rd_mon.run();
      rm.run();
      sbc.run();
    join
  endtask
endclass