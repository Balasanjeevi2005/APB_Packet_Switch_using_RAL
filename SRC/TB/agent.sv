class agent extends uvm_agent;
  
  `uvm_component_utils(agent)
  
  monitor mon_h;
  driver drv_h;
  sequencer seq_h;
  apb_config c_h;
  
  function new(string name = "agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    
    if(!uvm_config_db#(apb_config)::get(this,"","apb_config",c_h))
      `uvm_error("config_error","unable to get config in agent");
    mon_h=monitor::type_id::create("mon_h",this);
    
    if(c_h.agnt_is_active==UVM_ACTIVE)begin
      drv_h=driver::type_id::create("drv_h",this);
      seq_h = sequencer::type_id::create("seq_h",this);
    end
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    
    super.connect_phase(phase);
    
    if(c_h.agnt_is_active==UVM_ACTIVE)
      drv_h.seq_item_port.connect(seq_h.seq_item_export);
    
  endfunction
        
endclass
