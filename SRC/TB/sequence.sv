// RO
class ro_reg_seq extends uvm_sequence#(transaction);
  
  `uvm_object_utils(ro_reg_seq)
  
  top_reg_block regblock_inst;
  
  function new(string name = "ro_reg_seq");
    super.new(name);
  endfunction
  
  task body();
    
    uvm_status_e status;
    bit[`DATA_W-1:0]r_data;
    regblock_inst.lock.write(status, 32'hA5A5C3C3);
    
    //ro_reg_1
    regblock_inst.device_id.read(status,r_data);
    `uvm_info("|ro_reg_1|device_id",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_2
    regblock_inst.version.read(status,r_data);
    `uvm_info("|ro_reg_2|version",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_3
    regblock_inst.switch_status.read(status,r_data);
    `uvm_info("|ro_reg_3|switch_status",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_4
    regblock_inst.port_status.read(status,r_data);
    `uvm_info("|ro_reg_4|port_status",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_5
    regblock_inst.gen_status.read(status,r_data);
    `uvm_info("|ro_reg_5|gen_status",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_6
    regblock_inst.stat_rx.read(status,r_data);
    `uvm_info("|ro_reg_6|stat_rx",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_7
    regblock_inst.stat_tx.read(status,r_data);
    `uvm_info("|ro_reg_7|stat_tx",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_8
    regblock_inst.stat_drop.read(status,r_data);
    `uvm_info("|ro_reg_8|stat_drop",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_9
    regblock_inst.err_count.read(status,r_data);
    `uvm_info("|ro_reg_22|err_count",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //ro_reg_10
    regblock_inst.err_info.read(status,r_data);
    `uvm_info("|ro_reg_23|err_info",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
  endtask
  
endclass

// WO
class wo_reg_seq extends uvm_sequence#(transaction);
  
  `uvm_object_utils(wo_reg_seq)
  
  top_reg_block regblock_inst;
  
  function new(string name = "wo_reg_seq");
    super.new(name);
  endfunction
  
  task body();
    
    uvm_status_e status;
    bit[`DATA_W-1:0]w_data;
    
    //unlock configuration
    regblock_inst.lock.write(status, 32'hA5A5_C3C3);
    //enable all four ports
    regblock_inst.port_enable.write(status, 32'h0000_000F);
    //allow all destinations
    regblock_inst.fwd_enable.write(status, 32'h0000_000F);
    //enable switch & global interrupt
    regblock_inst.switch_ctrl.write(status, 32'h0000_0009);
    //seed(10),length(4),source(0),destination(1)
    regblock_inst.gen_pkt_cfg.write(status, 32'h0010_0401);
    //2_cycle inter packet gap
    regblock_inst.gen_interval.write(status, 32'h0000_0002);
    //generate four packets
    regblock_inst.gen_count.write(status, 32'h0000_0004);
    //enable gen_done & start_ack interrupts
    regblock_inst.irq_enable.write(status, 32'h0000_0041);
    //set enbale & pulse start
    regblock_inst.gen_ctrl.write(status, 32'h0000_0003);

    
    //write
    
    //wo_reg_1

    regblock_inst.irq_force.write(status,w_data);
    des=regblock_inst.irq_force.get();
    mir=regblock_inst.irq_force.get_mirrored_value();
    `uvm_info("|wo_reg_18|device_id",$sformatf("write Tx to DUT -> Desired_value : %0h | Mirror_value : %0h | w_data : %0h | status : %0s",des,mir,w_data,status),UVM_NONE);
    
    //wo_reg_2
    regblock_inst.err_inject.write(status,w_data);
    des=regblock_inst.err_inject.get();
    mir=regblock_inst.err_inject.get_mirrored_value();
    `uvm_info("|wo_reg_21|device_id",$sformatf("write Tx to DUT -> Desired_value : %0h | Mirror_value : %0h | w_data : %0h | status : %0s",des,mir,w_data,status),UVM_NONE);
    
    //wo_reg_3
    regblock_inst.soft_reset.write(status,w_data);
    des=regblock_inst.soft_reset.get();
    mir=regblock_inst.soft_reset.get_mirrored_value();
    `uvm_info("|wo_reg_25|device_id",$sformatf("write Tx to DUT -> Desired_value : %0h | Mirror_value : %0h | w_data : %0h | status : %0s",des,mir,w_data,status),UVM_NONE);
    
    //read 
    
    //wo_reg_1
    regblock_inst.irq_force.read(status,r_data);
    `uvm_info("|wo_reg_18|irq_force",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //wo_reg_2
    regblock_inst.err_inject.read(status,r_data);
    `uvm_info("|wo_reg_21|err_inject",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //wo_reg_3
    regblock_inst.soft_reset.read(status,r_data);
    `uvm_info("|wo_reg_25|soft_reset",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
  endtask
  
endclass

// RW
class rw_reg_seq extends uvm_sequence#(transaction);
  
  `uvm_object_utils(rw_reg_seq)
  
  top_reg_block regblock_inst;
  
  function new(string name = "rw_reg_seq");
    super.new(name);
  endfunction
  
  task body();
    
    uvm_status_e status;
    bit[`DATA_W-1:0]r_data;
    regblock_inst.lock.write(status, 32'hA5A5C3C3);
    
    //rw_reg_1
    regblock_inst.port_enable.read(status,r_data);
    `uvm_info("|rw_reg_10|port_enable",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //rw_reg_2
    regblock_inst.fwd_enable.read(status,r_data);
    `uvm_info("|rw_reg_11|fwd_enable",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //rw_reg_3
    regblock_inst.gen_pkt_cfg.read(status,r_data);
    `uvm_info("|rw_reg_13|gen_pkt_cfg",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //rw_reg_4
    regblock_inst.gen_interval.read(status,r_data);
    `uvm_info("|rw_reg_14|gen_interval",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //rw_reg_5
    regblock_inst.gen_count.read(status,r_data);
    `uvm_info("|rw_reg_15|gen_count",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //rw_reg_6
    regblock_inst.irq_enable.read(status,r_data);
    `uvm_info("|rw_reg_17|irq_enable",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    //rw_reg_7
    regblock_inst.error_enable.read(status,r_data);
    `uvm_info("|rw_reg_20|error_enabl",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
 
  endtask
  
endclass

// other regsiter 
class rw_reg_seq extends uvm_sequence#(transaction);
  
  `uvm_object_utils(rw_reg_seq)
  
  top_reg_block regblock_inst;
  
  function new(string name = "rw_reg_seq");
    super.new(name);
  endfunction
  
  task body();
    
    uvm_status_e status;
    bit[`DATA_W-1:0]r_data;
    regblock_inst.lock.write(status, 32'hA5A5C3C3);
    
    // rw/wo_reg_1
    regblock_inst.switch_ctrl.read(status,r_data);
    `uvm_info("|rw/wo_reg_9|switch_ctrl",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    // rw/wo_reg_2
    regblock_inst.gen_ctrl.read(status,r_data);
    `uvm_info("|rw/wo_reg_12|gen_ctrl",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    // w1c_reg_3
    regblock_inst.irq_status.read(status,r_data);
    `uvm_info("|w1c_reg_16|irq_status",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    // w1c_reg_4
    regblock_inst.error_status.read(status,r_data);
    `uvm_info("|w1c_reg_19|error_status",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
    // key_w/ro_reg_5
    regblock_inst.lock.read(status,r_data);
    `uvm_info("|key_w/ro_reg_24|lock",$sformatf("Read Rx from DUT -> r_data : %0h | status : %0s",r_data,status),UVM_NONE);
    
  endtask
  
endclass
