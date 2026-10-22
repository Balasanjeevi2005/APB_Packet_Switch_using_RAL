class monitor extends uvm_monitor;
  
  `uvm_component_utils(monitor)
  
  uvm_analysis_port#(transaction)mon_port;
  
  apb_config c_h;
  virtual apb_if.MON_CB vif;
  
  function new( string name = "monitor",uvm_component parent);
    super.new(name,parent);  
  endfunction : new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",c_h))
      `uvm_error("config_error","unable to get config in monitor");
    mon_port = new("mon_port",this);
  endfunction : build_phase
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    vif = c_h.vif;
  endfunction : connect_phase
  
  task run_phase(uvm_phase phase);
    forever begin
      monitor_vif();
    end
  endtask : run_phase
  
  task monitor_vif();
    
    transaction tr;
    
    tr=transaction::type_id::create("tr");
    
    @(vif.mon_cb);
    
   // tr.presetn = vif.mon_cb.presetn;
    tr.psel    = vif.mon_cb.psel;
    tr.penable = vif.mon_cb.penable;
    tr.pwrite  = vif.mon_cb.pwrite ;
    tr.paddr   = vif.mon_cb.paddr;
    tr.pwdata  = vif.mon_cb.pwdata;

    tr.prdata  = vif.mon_cb.prdata;
    tr.pready  = vif.mon_cb.pready;
    tr.pslverr = vif.mon_cb.pslverr;
    tr.irq     = vif.mon_cb.irq;
    
    mon_port.write(tr);
    
  endtask
  
endclass
