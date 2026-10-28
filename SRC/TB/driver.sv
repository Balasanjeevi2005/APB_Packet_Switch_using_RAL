class driver extends uvm_driver#(transaction);
  
  `uvm_component_utils(driver)
  
  apb_config c_h;
  virtual apb_if.DRV_CB vif;
  transaction req;
  
  function new(string name = "driver",uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",c_h))
      `uvm_error("config_error","unable to get config in driver");
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    vif=c_h.vif;
    
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive(req);
      seq_item_port.item_done(req);
    end
    
  endtask
  
  task drive(transaction tr);
    idle(tr);
    setup(tr);
    access(tr);
  endtask
  
  task idle(transaction tr);
    @(vif.drv_cb);
    vif.drv_cb.psel    <= 1'b0;
    vif.drv_cb.penable <= 1'b0;
    vif.drv_cb.pwrite  <= 1'b0;;
    vif.drv_cb.paddr   <= `ADDR_W'd0;
    vif.drv_cb.pwdata  <= `DATA_W'd0;
    $display("|psel = %0h|penable = %0h|pwrite = %0h|paddr = %0h|pwdata = %0h|",
             vif.drv_cb.psel,
             vif.drv_cb.penable,
             vif.drv_cb.pwrite,
             vif.drv_cb.paddr, 
             vif.drv_cb.pwdata
            );
  endtask
  
  task setup(transaction tr);
    @(vif.drv_cb);
    vif.drv_cb.psel    <= 1'b1;
    vif.drv_cb.penable <= 1'b0;
    vif.drv_cb.pwrite  <= tr.pwrite;
    vif.drv_cb.paddr   <= tr.paddr;
    if(tr.pwrite)begin
      vif.drv_cb.pwdata  <= tr.pwdata;
    end
    $display("|psel = %0h|penable = %0h|pwrite = %0h|paddr = %0h|pwdata = %0h|",
             vif.drv_cb.psel,
             vif.drv_cb.penable,
             vif.drv_cb.pwrite,
             vif.drv_cb.paddr, 
             vif.drv_cb.pwdata
            );
  endtask
  
  task access(transaction tr);
    @(vif.drv_cb);
    vif.drv_cb.psel    <= 1'b1;
    vif.drv_cb.penable <= 1'b1;
    while(!vif.drv_cb.pready)begin
      @(vif.drv_cb);
    end
    tr.prdata  = vif.drv_cb.prdata;
    tr.pslverr = vif.drv_cb.pslverr;
    tr.irq 	   = vif.drv_cb.irq;
    $display("|psel = %0h|penable = %0h|pwrite = %0h|paddr = %0h|pwdata = %0h|prdata = %0h|pslverr = %0h|irq = %0h|",
             vif.drv_cb.psel,
             vif.drv_cb.penable,
             vif.drv_cb.pwrite,
             vif.drv_cb.paddr, 
             vif.drv_cb.pwdata, 
             vif.drv_cb.prdata, 
             vif.drv_cb.pslverr, 
             vif.drv_cb.irq
            );
  endtask
  
endclass
    
