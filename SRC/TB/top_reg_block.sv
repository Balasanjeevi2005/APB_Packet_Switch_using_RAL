class top_reg_block extends uvm_reg_block;
  
  `uvm_object_utils(top_reg_block)
  
  rand DEVICE_ID     device_id;
  rand VERSION       version;
  rand SWITCH_STATUS switch_status;
  rand PORT_STATUS   port_status;
  rand GEN_STATUS    gen_status;
  
  rand STAT_RX       stat_rx;
  rand STAT_TX       stat_tx;
  rand STAT_DROP     stat_drop;
  rand SWITCH_CTRL   switch_ctrl;
  rand PORT_ENABLE   port_enable;
  
  rand FWD_ENABLE    fwd_enable;
  rand GEN_CTRL      gen_ctrl;
  rand GEN_PKT_CFG   gen_pkt_cfg;
  rand GEN_INTERVAL  gen_interval;
  rand GEN_COUNT     gen_count;
  
  rand IRQ_STATUS    irq_status;
  rand IRQ_ENABLE    irq_enable;
  rand IRQ_FORCE     irq_force;
  rand ERR_STATUS    err_status;
  rand ERR_ENABLE    err_enable;
  
  rand ERR_INJECT    err_inject;
  rand ERR_COUNT     err_count;
  rand ERR_INFO      err_info;
  rand LOCK          lock;
  rand SOFT_RESET    soft_reset;
  
  
  function new(string name = "top_reg_block");
    super.new(name,build_coverage(UVM_NO_COVERAGE));
  endfunction
  
  function void build;
    
    //1
    device_id = DEVICE_ID::type_id::create("device_id");
    device_id.build();
    device_id.configure(this);
    
    //2
    version = VERSION::type_id::create("version");
    version.build();
    version.configure(this);
    
    //3
    switch_status = SWITCH_STATUS::type_id::create("switch_status");
    switch_status.build();
    switch_status.configure(this);
    
    //4
    port_status = PORT_STATUS::type_id::create("port_status");
    port_status.build();
    port_status.configure(this);
    
    //5
    gen_status = GEN_STATUS::type_id::create("gen_status");
    gen_status.build();
    gen_status.configure(this);
    
    //6
    stat_rx = STAT_RX::type_id::create("stat_rx");
    stat_rx.build();
    stat_rx.configure(this);
    
    //7
    stat_tx = STAT_TX::type_id::create("stat_tx");
    stat_tx.build();
    stat_tx.configure(this);
    
    //8
    stat_drop = STAT_DROP::type_id::create("stat_drop");
    stat_drop.build();
    stat_drop.configure(this);
    
    //9
    switch_ctrl = SWITCH_CTRL::type_id::create("switch_ctrl");
    switch_ctrl.build();
    switch_ctrl.configure(this);
    
    //10
    port_enable = PORT_ENABLE::type_id::create("port_enable");
    port_enable.build();
    port_enable.configure(this);
    
    //11
    fwd_enable = FWD_ENABLE::type_id::create("fwd_enable");
    fwd_enable.build();
    fwd_enable.configure(this);
    
    //12
    gen_ctrl = GEN_CTRL::type_id::create("gen_ctrl");
    gen_ctrl.build();
    gen_ctrl.configure(this);
    
    //13
    gen_pkt_cfg = GEN_PKT_CFG::type_id::create("gen_pkt_cfg");
    gen_pkt_cfg.build();
    gen_pkt_cfg.configure(this);
    
    //14
    gen_interval = GEN_INTERVAL::type_id::create("gen_interval");
    gen_interval.build();
    gen_interval.configure(this);
    
    //15
    gen_count = GEN_COUNT::type_id::create("gen_count");
    gen_count.build();
    gen_count.configure(this);
    
    //16
    irq_status = IRQ_STATUS::type_id::create("irq_status");
    irq_status.build();
    irq_status.configure(this);
    
    //17
    irq_enable = IRQ_ENABLE::type_id::create("irq_enable");
    irq_enable.build();
    irq_enable.configure(this);
    
    //18
    irq_force = IRQ_FORCE::type_id::create("irq_force");
    irq_force.build();
    irq_force.configure(this);
    
    //19
    err_status = ERR_STATUS::type_id::create("err_status");
    err_status.build();
    err_status.configure(this);
    
    //20
    err_enable = ERR_ENABLE::type_id::create("err_enable");
    err_enable.build();
    err_enable.configure(this);
    
    //21
    err_inject = ERR_INJECT::type_id::create("err_inject");
    err_inject.build();
    err_inject.configure(this);
    
    //22
    err_count = ERR_COUNT::type_id::create("err_count");
    err_count.build();
    err_count.configure(this);
    
    //23
    err_info = ERR_INFO::type_id::create("err_info");
    err_info.build();
    err_info.configure(this);
    
    //24
    lock = LOCK::type_id::create("lock");
    lock.build();
    lock.configure(this);
    
    //25
    soft_reset = SOFT_RESET::type_id::create("soft_reset");
    soft_reset.build();
    soft_reset.configure(this);
   
    
    default_map=create_map("default_map",32'h0000_0000,4,UVM_LITTLE_ENDIAN);
    default_map.add_reg(device_id,    'h00, "RW" );
    default_map.add_reg(version,      'h04, "RW" );
    default_map.add_reg(switch_status,'h08, "RW" );
    default_map.add_reg(port_status,  'h0C, "RW" );
    default_map.add_reg(gen_status,   'h10, "RW" );
    
    default_map.add_reg(stat_rx,      'h14, "RW" );
    default_map.add_reg(stat_tx,      'h18, "RW" );
    default_map.add_reg(stat_drop,    'h1C, "RW" );
    default_map.add_reg(switch_ctrl,  'h20, "RW" );
    default_map.add_reg(port_enable,  'h24, "RW" );
    
    default_map.add_reg(fwd_enable,   'h28, "RW" );
    default_map.add_reg(gen_ctrl,     'h2C, "RW" );
    default_map.add_reg(gen_pkt_cfg,  'h30, "RW" );
    default_map.add_reg(gen_interval, 'h34, "RW" );
    default_map.add_reg(gen_count,    'h38, "RW" );
    
    default_map.add_reg(irq_status,   'h3C, "RW" );
    default_map.add_reg(irq_enable,   'h40, "RW" );
    default_map.add_reg(irq_force,    'h44, "RW" );
    default_map.add_reg(err_status,   'h48, "RW" );
    default_map.add_reg(err_enable,   'h4C, "RW" );
    
    default_map.add_reg(err_inject,   'h50, "RW" );
    default_map.add_reg(err_count,    'h54, "RW" );
    default_map.add_reg(err_info,     'h58, "RW" );
    default_map.add_reg(lock,         'h5C, "RW" );
    default_map.add_reg(soft_reset,   'h60, "RW" );

    default_map.set_auto_predict(1);
    
    lock_model();
    
  endfunction
endclass
