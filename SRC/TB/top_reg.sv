//1
class DEVICE_ID extends uvm_reg;
  
  `uvm_object_utils(DEVICE_ID)
  
  rand uvm_reg_field REVISION;
  rand uvm_reg_field VENDOR_ID;
  rand uvm_reg_field PRODUCT_ID;
  
  covergroup cg_1_DEVICE_ID;
    coverpoint REVISION.value[7:0]
    {
      bins revision_rst = {8'h02};
    }
    coverpoint VENDOR_ID.value[7:0]
    {
      bins vendor_rst = {8'hA5};
    }
    coverpoint PRODUCT_ID.value[15:0]
    {
      bins product_rst = {16'h5357};
    }
  endgroup
  
  function new(string name = "DEVICE_ID");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_1_DEVICE_ID = new();
  endfunction
  
  function void build;
    
    REVISION   = uvm_reg_field::type_id::create("REVISION");
    VENDOR_ID  = uvm_reg_field::type_id::create("VENDOR_ID");
    PRODUCT_ID = uvm_reg_field::type_id::create("PRODUCT_ID");
    
    REVISION.configure  (this, 8,24,"RO",0,8'h02   ,1,1,1);
    VENDOR_ID.configure (this, 8,16,"RO",0,8'hA5   ,1,1,1);
    PRODUCT_ID.configure(this,16, 0,"RO",0,16'h5357,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_1_DEVICE_ID.sample();
    $display("inside device_id sample function");
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_1_DEVICE_ID.sample();
    $display("inside device_id sample_values function");
  endfunction
  
endclass

//2
class VERSION extends uvm_reg;
  
  `uvm_object_utils(VERSION)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field MAJOR;
  rand uvm_reg_field MINOR;
  rand uvm_reg_field PATCH;
  
  covergroup cg_2_VERSION;
    coverpoint RESERVED.value[7:0]
    {
      bins reserved_rst = {8'h00};
    }
    coverpoint MAJOR.value[7:0]
    {
      bins major_rst = {8'h01};
    }
    coverpoint MINOR.value[7:0]
    {
      bins minor_rst = {8'h02};
    }
    coverpoint PATCH.value[7:0]
    {
      bins patch_rst = {8'h00};
    }
      
  endgroup
  
  function new(string name = "VERSION");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_2_VERSION = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    MAJOR    = uvm_reg_field::type_id::create("MAJOR");
    MINOR    = uvm_reg_field::type_id::create("MINOR");
    PATCH    = uvm_reg_field::type_id::create("PATCH");
    
    RESERVED.configure(this,8,24,"RO",0,0,1,1,1);
    MAJOR.configure   (this,8,16,"RO",0,1,1,1,1);
    MINOR.configure   (this,8, 8,"RO",0,2,1,1,1);
    PATCH.configure   (this,8, 0,"RO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_2_VERSION.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_2_VERSION.sample();
  endfunction
  
endclass

//3
class SWITCH_STATUS extends uvm_reg;
  
  `uvm_object_utils(SWITCH_STATUS)
  
  rand uvm_reg_field RESERVED_0;
  rand uvm_reg_field GEN_FSM;
  rand uvm_reg_field RESERVED_1;
  rand uvm_reg_field ERR_PENDING;
  rand uvm_reg_field GEN_RUNNING;
  
  rand uvm_reg_field PORT_ENABLED;
  rand uvm_reg_field LOCKED;
  rand uvm_reg_field SWITCH_ENABLED;
  rand uvm_reg_field BUSY;
  rand uvm_reg_field READY;
  
  covergroup cg_3_SWITCH_STATUS;
    
    coverpoint RESERVED_0.value[13:0]
    {
      bins reserved_0 = {14'd0};
    }
    coverpoint GEN_FSM.value[1:0]
    {
      bins gen_fsm = {2'd0};
    }
    coverpoint RESERVED_1.value[5:0]
    {
      bins reserved_1 = {6'd0};
    }
    coverpoint ERR_PENDING.value
    {
      bins err_pending = {1'b0};
    }
    coverpoint GEN_RUNNING.value
    {
      bins gen_running = {1'b0};
    }
     
    coverpoint PORT_ENABLED.value[3:0]
    {
      bins port_enabled = {4'hf};
    }
    coverpoint LOCKED.value
    {
      bins locked = {1'b1};
    }
    coverpoint SWITCH_ENABLED.value
    {
      bins switch_enabled = {1'b0};
    }
    coverpoint BUSY.value
    {
      bins busy = {1'b0};
    }
    coverpoint READY.value
    {
      bins ready = {1'b1};
    }
   
  endgroup
  
  function new(string name = "SWITCH_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_3_SWITCH_STATUS = new();
  endfunction
  
  function void build;
    
    RESERVED_0     = uvm_reg_field::type_id::create("RESERVED_0");
    GEN_FSM        = uvm_reg_field::type_id::create("GEN_FSM");
    RESERVED_1     = uvm_reg_field::type_id::create("RESERVED_1");
    ERR_PENDING    = uvm_reg_field::type_id::create("ERR_PENDING");
    GEN_RUNNING    = uvm_reg_field::type_id::create("GEN_RUNNING");
    
    PORT_ENABLED   = uvm_reg_field::type_id::create("PORT_ENABLED");
    LOCKED         = uvm_reg_field::type_id::create("LOCKED");
    SWITCH_ENABLED = uvm_reg_field::type_id::create("SWITCH_ENABLED");
    BUSY           = uvm_reg_field::type_id::create("BUSY");
    READY          = uvm_reg_field::type_id::create("READY");
    
    RESERVED_0.configure    (this,14,18,"RO",0,   0,1,1,1);
    GEN_FSM.configure       (this, 2,16,"RO",1,   0,1,1,1);
    RESERVED_1.configure    (this, 6,10,"RO",0,   0,1,1,1);
    ERR_PENDING.configure   (this, 1, 9,"RO",1,   0,1,1,1);
    GEN_RUNNING.configure   (this, 1, 8,"RO",1,   0,1,1,1);
    
    PORT_ENABLED.configure  (this, 4, 4,"RO",1,4'hF,1,1,1);
    LOCKED.configure        (this, 1, 3,"RO",1,   1,1,1,1);
    SWITCH_ENABLED.configure(this, 1, 2,"RO",1,   0,1,1,1);
    BUSY.configure          (this, 1, 1,"RO",1,   0,1,1,1);
    READY.configure         (this, 1, 0,"RO",1,   1,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_3_SWITCH_STATUS.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_3_SWITCH_STATUS.sample();
  endfunction
  
endclass
//4
class PORT_STATUS extends uvm_reg;
  
  `uvm_object_utils(PORT_STATUS)
  
  rand uvm_reg_field PORT3_LEVEL;
  rand uvm_reg_field PORT2_LEVEL;
  rand uvm_reg_field PORT1_LEVEL;
  rand uvm_reg_field PORT0_LEVEL;
  
  covergroup cg_4_PORT_STATUS;
    coverpoint PORT3_LEVEL.value[7:0]
    {
      bins port3_level_rst = {8'd0};
    }
    coverpoint PORT2_LEVEL.value[7:0]
    {
      bins port2_level_rst = {8'd0};
    }
    coverpoint PORT1_LEVEL.value[7:0]
    {
      bins port1_level_rst = {8'd0};
    }
    coverpoint PORT0_LEVEL.value[7:0]
    {
      bins port0_level_rst = {8'd0};
    }
  endgroup
  
  function new(string name = "PORT_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_4_PORT_STATUS = new();
  endfunction
  
  function void build;
    
    PORT3_LEVEL = uvm_reg_field::type_id::create("PORT3_LEVEL");
    PORT2_LEVEL = uvm_reg_field::type_id::create("PORT2_LEVEL");
    PORT1_LEVEL= uvm_reg_field::type_id::create("PORT1_LEVEL");
    PORT0_LEVEL= uvm_reg_field::type_id::create("PORT0_LEVEL");
    
    PORT3_LEVEL.configure(this,8,24,"RO",1,0,1,1,1);
    PORT2_LEVEL.configure(this,8,16,"RO",1,0,1,1,1);
    PORT1_LEVEL.configure(this,8, 8,"RO",1,0,1,1,1);
    PORT0_LEVEL.configure(this,8, 0,"RO",1,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_4_PORT_STATUS.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_4_PORT_STATUS.sample();
  endfunction
  
endclass

//5
class GEN_STATUS extends uvm_reg;
  
  `uvm_object_utils(GEN_STATUS)
  
  rand uvm_reg_field RESERVED_0;
  rand uvm_reg_field REMAINING;
  rand uvm_reg_field RESERVED_1;
  rand uvm_reg_field FSM;
  rand uvm_reg_field DONE;
  rand uvm_reg_field RUNNING;
  
  covergroup cg_5_GEN_STATUS;
    coverpoint RESERVED_0.value[7:0]
    {
      bins reserved_0_rst = {8'd0};
    }
    coverpoint REMAINING.value[15:0]
    {
      bins remaining_rst = {16'd0};
    }
    coverpoint RESERVED_1.value[3:0]
    {
      bins reserved_1_rst = {4'd0};
    }
    coverpoint FSM.value[1:0]
    {
      bins fsm_rst = {2'd0};
    }
    coverpoint DONE.value{
      bins done_rst = {1'd0};
    }
    coverpoint RUNNING.value{
      bins running_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "GEN_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_5_GEN_STATUS = new();
  endfunction
  
  function void build;
    
    RESERVED_0 = uvm_reg_field::type_id::create("RESERVED_0");
    REMAINING  = uvm_reg_field::type_id::create("REMAINING");
    RESERVED_1 = uvm_reg_field::type_id::create("RESERVED_1");
    FSM        = uvm_reg_field::type_id::create("FSM");
    DONE       = uvm_reg_field::type_id::create("DONE");
    RUNNING    = uvm_reg_field::type_id::create("RUNNING");
    
    RESERVED_0.configure (this, 8,24,"RO",0,0,1,1,1);
    REMAINING.configure  (this,16, 8,"RO",1,0,1,1,1);
    RESERVED_1.configure (this, 4, 4,"RO",0,0,1,1,1);
    FSM.configure        (this, 2, 2,"RO",1,0,1,1,1);
    DONE.configure       (this, 1, 1,"RO",1,0,1,1,1);
    RUNNING.configure    (this, 1, 0,"RO",1,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_5_GEN_STATUS.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_5_GEN_STATUS.sample();
  endfunction
  
endclass

//6
class STAT_RX extends uvm_reg;
  
  `uvm_object_utils(STAT_RX)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field RX_PACKETS;
  
  covergroup cg_6_STAT_RX;
    coverpoint RESERVED.value[15:0]
    {
      bins reserved_rst = {16'd0};
    }
    coverpoint RX_PACKETS.value[15:0]
    {
      bins rx_packets_rst = {16'd0};
    }
  endgroup
  
  function new(string name = "STAT_RX");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_6_STAT_RX = new();
  endfunction
  
  function void build;
    
    RESERVED   = uvm_reg_field::type_id::create("RESERVED");
    RX_PACKETS = uvm_reg_field::type_id::create("RX_PACKETS");
    
    RESERVED.configure  (this,16,16,"RO",0,0,1,1,1);
    RX_PACKETS.configure(this,16, 0,"RO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_6_STAT_RX.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_6_STAT_RX.sample();
  endfunction
  
endclass

//7
class STAT_TX extends uvm_reg;
  
  `uvm_object_utils(STAT_TX)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field TX_PACKETS;
  
  covergroup cg_7_STAT_TX;
    coverpoint RESERVED.value[15:0]
    {
      bins reserved_rst = {16'd0};
    }
    coverpoint TX_PACKETS.value[15:0]
    {
      bins tx_packets_rst = {16'd0};
    }
  endgroup
  
  function new(string name = "STAT_TX");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_7_STAT_TX = new();
  endfunction
  
  function void build;
    
    RESERVED   = uvm_reg_field::type_id::create("RESERVED");
    TX_PACKETS = uvm_reg_field::type_id::create("TX_PACKETS");
    
    RESERVED.configure  (this,16,16,"RO",0,0,1,1,1);
    TX_PACKETS.configure(this,16, 0,"RO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_7_STAT_TX.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_7_STAT_TX.sample();
  endfunction
  
endclass

//8
class STAT_DROP extends uvm_reg;
  
  `uvm_object_utils(STAT_DROP)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field DROPPED_PACKETS;
  
  covergroup cg_8_STAT_DROP;
    coverpoint RESERVED.value[15:0]
    {
      bins reserved_rst = {16'd0};
    }
    coverpoint DROPPED_PACKETS.value[15:0]
    {
      bins dropped_packets_rst = {16'd0};
    }
  endgroup
  
  function new(string name = "STAT_DROP");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_8_STAT_DROP = new();
  endfunction
  
  function void build;
    RESERVED        = uvm_reg_field::type_id::create("RESERVED");
    DROPPED_PACKETS = uvm_reg_field::type_id::create("DROPPED_PACKETS");
    
    RESERVED.configure       (this,16,16,"RO",0,0,1,1,1);
    DROPPED_PACKETS.configure(this,16, 0,"RO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_8_STAT_DROP.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_8_STAT_DROP.sample();
  endfunction
  
endclass

//9
class SWITCH_CTRL extends uvm_reg;
  
  `uvm_object_utils(SWITCH_CTRL)
  
  rand uvm_reg_field RESERVED_0;
  rand uvm_reg_field IRQ_GLOBAL_EN;
  rand uvm_reg_field RESERVED_1;
  rand uvm_reg_field STAT_CLEAR;
  rand uvm_reg_field ENABLE;
  
  covergroup cg_9_SWITCH_CTRL;
    coverpoint RESERVED_0.value[27:0]
    {
      bins reserved_0_rst = {28'd0};
    }
    coverpoint IRQ_GLOBAL_EN.value
    {
      bins irq_global_en = {1'd1};
      bins irq_global_en_rst = {1'd0};
    }
    coverpoint RESERVED_1.value
    {
      bins reserved_1_rst = {1'd0};
    }
    coverpoint STAT_CLEAR.value
    {
      bins stat_clear = {1'd1};
      bins stat_clear_rst = {1'd0};
    }
    coverpoint ENABLE.value
    {
      bins enable = {1'd1};
      bins enable_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "SWITCH_CTRL");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_9_SWITCH_CTRL = new();
  endfunction
  
  function void build;
    
    RESERVED_0    = uvm_reg_field::type_id::create("RESERVED_0");
    IRQ_GLOBAL_EN = uvm_reg_field::type_id::create("IRQ_GLOBAL_EN");
    RESERVED_1    = uvm_reg_field::type_id::create("RESERVED_1");
    STAT_CLEAR    = uvm_reg_field::type_id::create("STAT_CLEAR");
    ENABLE        = uvm_reg_field::type_id::create("ENABLE");
    
    RESERVED_0.configure    (this,28,4,"RO",0,0,1,1,1);
    IRQ_GLOBAL_EN.configure (this, 1,3,"RW",0,0,1,1,1);
    RESERVED_1.configure    (this, 1,2,"RO",0,0,1,1,1);
    STAT_CLEAR.configure    (this, 1,1,"WO",0,0,1,1,1);
    ENABLE.configure        (this, 1,0,"RW",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_9_SWITCH_CTRL.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_9_SWITCH_CTRL.sample();
  endfunction
  
endclass

//10
class PORT_ENABLE extends uvm_reg;
  
  `uvm_object_utils(PORT_ENABLE)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field PORT3_EN;
  rand uvm_reg_field PORT2_EN;
  rand uvm_reg_field PORT1_EN;
  rand uvm_reg_field PORT0_EN;
  
  covergroup cg_10_PORT_ENABLE;
    coverpoint RESERVED.value[27:0]
    {
      bins reserved_rst = {28'd0};
    }
    coverpoint PORT3_EN.value
    {
      bins port3_en  = {1'd0};
      bins port3_en_rst = {1'd1};
    }
    coverpoint PORT2_EN.value
    {
      bins port2_en = {1'd0};
      bins port2_en_rst = {1'd1};
    }
    coverpoint PORT1_EN.value
    {
      bins port1_en  = {1'd0};
      bins port1_en_rst = {1'd1};
    }
    coverpoint PORT0_EN.value
    {
      bins port0_en = {1'd0};
      bins port0_en_rst = {1'd1};
    }
  endgroup
  
  function new(string name = "PORT_ENABLE");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_10_PORT_ENABLE = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    PORT3_EN = uvm_reg_field::type_id::create("PORT3_EN");
    PORT2_EN = uvm_reg_field::type_id::create("PORT2_EN");
    PORT1_EN = uvm_reg_field::type_id::create("PORT1_EN");
    PORT0_EN = uvm_reg_field::type_id::create("PORT0_EN");
    
    RESERVED.configure(this,28,4,"RO",0,0,1,1,1);
    PORT3_EN.configure(this, 1,3,"RW",0,1,1,1,1);
    PORT2_EN.configure(this, 1,2,"RW",0,1,1,1,1);
    PORT1_EN.configure(this, 1,1,"RW",0,1,1,1,1);
    PORT0_EN.configure(this, 1,0,"RW",0,1,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_10_PORT_ENABLE.sample();
    
    $display("inside port_enable sample function");
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_10_PORT_ENABLE.sample();
    
    $display("inside port_enable sample_values function");
  endfunction
  
endclass

//11
class FWD_ENABLE extends uvm_reg;
  
  `uvm_object_utils(FWD_ENABLE)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field FWD3_EN;
  rand uvm_reg_field FWD2_EN;
  rand uvm_reg_field FWD1_EN;
  rand uvm_reg_field FWD0_EN;
  
  covergroup cg_11_FWD_ENABLE;
    coverpoint RESERVED.value[27:0]
    {
      bins reserved_rst = {28'd0};
    }
    coverpoint FWD3_EN.value
    {
      bins fwd_en3  = {1'd0};
      bins fwd_en3_rst = {1'd1};
    }
    coverpoint FWD2_EN.value
    {
      bins fwd_en2 = {1'd0};
      bins fwd_en2_rst = {1'd1};
    }
    coverpoint FWD1_EN.value
    {
      bins fwd_en1  = {1'd0};
      bins fwd_en1_rst = {1'd1};
    }
    coverpoint FWD0_EN.value
    {
      bins fwd_en0 = {1'd0};
      bins fwd_en0_rst = {1'd1};
    }
  endgroup
  
  function new(string name = "FWD_ENABLE");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_11_FWD_ENABLE = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    FWD3_EN  = uvm_reg_field::type_id::create("FWD3_EN");
    FWD2_EN  = uvm_reg_field::type_id::create("FWD2_EN");
    FWD1_EN  = uvm_reg_field::type_id::create("FWD1_EN");
    FWD0_EN  = uvm_reg_field::type_id::create("FWD0_EN");
    
    RESERVED.configure(this,28,4,"RO",0,0,1,1,1);
    FWD3_EN.configure (this, 1,3,"RW",0,1,1,1,1);
    FWD2_EN.configure (this, 1,2,"RW",0,1,1,1,1);
    FWD1_EN.configure (this, 1,1,"RW",0,1,1,1,1);
    FWD0_EN.configure (this, 1,0,"RW",0,1,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_11_FWD_ENABLE.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_11_FWD_ENABLE.sample();
  endfunction
  
endclass

//12
class GEN_CTRL extends uvm_reg;
  
  `uvm_object_utils(GEN_CTRL)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field CONTINUOUS;
  rand uvm_reg_field STOP;
  rand uvm_reg_field START;
  rand uvm_reg_field ENABLE;
  
  covergroup cg_12_GEN_CTRL;
    coverpoint RESERVED.value[27:0]
    {
      bins reserved_rst = {28'd0};
    }
    coverpoint CONTINUOUS.value
    {
      bins continuous  = {1'd1};
      bins continuous_rst = {1'd0};
    }
    coverpoint STOP.value
    {
      bins stop = {1'd1};
      bins stop_rst = {1'd0};
    }
    coverpoint START.value
    {
      bins start  = {1'd1};
      bins start_rst = {1'd0};
    }
    coverpoint ENABLE.value
    {
      bins enable = {1'd1};
      bins enable_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "GEN_CTRL");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_12_GEN_CTRL = new();
  endfunction
  
  function void build;
    
    RESERVED   = uvm_reg_field::type_id::create("RESERVED");
    CONTINUOUS = uvm_reg_field::type_id::create("CONTINUOUS");
    STOP       = uvm_reg_field::type_id::create("STOP");
    START      = uvm_reg_field::type_id::create("START");
    ENABLE     = uvm_reg_field::type_id::create("ENABLE");
    
    RESERVED.configure  (this,28,4,"RO",0,0,1,1,1);
    CONTINUOUS.configure(this, 1,3,"RW",0,0,1,1,1);
    STOP.configure      (this, 1,2,"WO",0,0,1,1,1);
    START.configure     (this, 1,1,"WO",0,0,1,1,1);
    ENABLE.configure    (this, 1,0,"RW",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_12_GEN_CTRL.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_12_GEN_CTRL.sample();
  endfunction
  
endclass
//13
class GEN_PKT_CFG extends uvm_reg;
  
  `uvm_object_utils(GEN_PKT_CFG)
  
  rand uvm_reg_field RESERVED_0;
  rand uvm_reg_field SEED;
  rand uvm_reg_field LENGTH;
  rand uvm_reg_field RESERVED_1;
  rand uvm_reg_field SRC_PORT;
  rand uvm_reg_field DST_PORT;
  
  covergroup cg_13_GEN_PKT_CFG;
    coverpoint RESERVED_0.value[7:0]
    {
      bins reserved_0_rst = {8'h00};
    }
    coverpoint SEED.value[7:0]
    {
      bins seed  = {[8'h01:8'hff]};
      bins seed_rst = {8'h00};
    }
    coverpoint LENGTH.value[7:0]
    {
      bins length = {[8'h00:8'h03],[8'h05:8'hff]};
      bins length_rst = {8'h04};
    }
    coverpoint RESERVED_1.value[3:0]
    {
      bins reserved_1_rst = {4'd0};
    }
    coverpoint SRC_PORT.value[1:0]
    {
      bins src_port  = {2'b00,2'b10,2'b11};
      bins src_port_rst = {2'b01};
    }
    coverpoint DST_PORT.value[1:0]
    {
      bins dst_port = {2'b00,2'b10,2'b11};
      bins dst_port_rst = {2'b01};
    }
  endgroup
  
  function new(string name = "GEN_PKT_CFG");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_13_GEN_PKT_CFG = new();
  endfunction
  
  function void build;
    
    RESERVED_0 = uvm_reg_field::type_id::create("RESERVED_0");
    SEED       = uvm_reg_field::type_id::create("SEED");
    LENGTH     = uvm_reg_field::type_id::create("LENGTH");
    RESERVED_1 = uvm_reg_field::type_id::create("RESERVED_1");
    SRC_PORT   = uvm_reg_field::type_id::create("SRC_PORT");
    DST_PORT   = uvm_reg_field::type_id::create("DST_PORT");
    
    RESERVED_0.configure(this,8,24,"RO",0,0,1,1,1);
    SEED.configure      (this,8,16,"RW",0,0,1,1,1);
    LENGTH.configure    (this,8, 8,"RW",0,4,1,1,1);
    RESERVED_1.configure(this,4, 4,"RO",0,0,1,1,1);
    SRC_PORT.configure  (this,2, 2,"RW",0,0,1,1,1);
    DST_PORT.configure  (this,2, 0,"RW",0,1,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_13_GEN_PKT_CFG.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_13_GEN_PKT_CFG.sample();
  endfunction
  
endclass

//14
class GEN_INTERVAL extends uvm_reg;
  
  `uvm_object_utils(GEN_INTERVAL)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field INTERVAL;
  
  covergroup cg_14_GEN_INTERVAL;
    coverpoint RESERVED.value[15:0]
    {
      bins reserved_rst = {16'h0000};
    }
    coverpoint INTERVAL.value[15:0]
    {
      bins interval  = {[16'h0000:16'h0001],[16'h0003:16'hffff]};
      bins interval_rst = {16'h0002};
    }
  endgroup
  
  function new(string name = "GEN_INTERVAL");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_14_GEN_INTERVAL = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    INTERVAL = uvm_reg_field::type_id::create("INTERVAL");
    
    RESERVED.configure(this,16,16,"RO",0,0,1,1,1);
    INTERVAL.configure(this,16, 0,"RW",0,2,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_14_GEN_INTERVAL.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_14_GEN_INTERVAL.sample();
  endfunction
  
endclass

//15
class GEN_COUNT extends uvm_reg;
  
  `uvm_object_utils(GEN_COUNT)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field PACKET_COUNT;
  
  covergroup cg_15_GEN_COUNT;
    coverpoint RESERVED.value[15:0]
    {
      bins reserved_rst = {16'h0000};
    }
    coverpoint PACKET_COUNT.value[15:0]
    {
      bins packet_count  = {[16'h0000:16'h0003],[16'h0005:16'hffff]};
      bins packet_count_rst = {16'd4};
    }
  endgroup
  
  function new(string name = "GEN_COUNT");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_15_GEN_COUNT = new();
  endfunction
  
  function void build;
    
    RESERVED     = uvm_reg_field::type_id::create("RESERVED");
    PACKET_COUNT = uvm_reg_field::type_id::create("PACKET_COUNT");
    
    RESERVED.configure    (this,16,16,"RO",0,0,1,1,1);
    PACKET_COUNT.configure(this,16, 0,"RW",0,4,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_15_GEN_COUNT.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_15_GEN_COUNT.sample();
  endfunction
  
endclass

//16
class IRQ_STATUS extends uvm_reg;
  
  `uvm_object_utils(IRQ_STATUS)
  
  rand uvm_reg_field RESERVED;
  
  rand uvm_reg_field SW_EVENT;
  rand uvm_reg_field START_ACK;
  rand uvm_reg_field QUEUE_ALMOST_FULL;
  rand uvm_reg_field PACKET_FORWARDED;
  
  rand uvm_reg_field PACKET_DROPPED;
  rand uvm_reg_field QUEUE_OVERFLOW;
  rand uvm_reg_field ERROR;
  rand uvm_reg_field GEN_DONE;
  
  covergroup cg_16_IRQ_STATUS;
    coverpoint RESERVED.value[23:0]
    {
      bins reserved_rst = {24'd0};
    }
    coverpoint SW_EVENT.value
    {
      bins sw_event  = {1'd1};
      bins sw_event_rst = {1'd0};
    }
    coverpoint START_ACK.value
    {
      bins start_ack = {1'd1};
      bins start_ack_rst = {1'd0};
    }
    coverpoint QUEUE_ALMOST_FULL.value
    {
      bins queue_almost_full  = {1'd1};
      bins queue_almost_full_rst = {1'd0};
    }
    coverpoint PACKET_FORWARDED.value
    {
      bins packet_forwarded = {1'd1};
      bins packet_forwarded_rst = {1'd0};
    }
    
    coverpoint PACKET_DROPPED.value
    {
      bins packet_dropped  = {1'd1};
      bins packet_dropped_rst = {1'd0};
    }
    coverpoint QUEUE_OVERFLOW.value
    {
      bins queue_overflow = {1'd1};
      bins queue_overflow_rst = {1'd0};
    }
    coverpoint ERROR.value
    {
      bins error  = {1'd1};
      bins error_rst = {1'd0};
    }
    coverpoint GEN_DONE.value
    {
      bins gen_done = {1'd1};
      bins gen_done_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "IRQ_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_16_IRQ_STATUS = new();
  endfunction
  
  function void build;
    
    RESERVED		  = uvm_reg_field::type_id::create("RESERVED");
    
    SW_EVENT 		  = uvm_reg_field::type_id::create("SW_EVENT");
    START_ACK         = uvm_reg_field::type_id::create("START_ACK");
    QUEUE_ALMOST_FULL = uvm_reg_field::type_id::create("QUEUE_ALMOST_FULL");
    PACKET_FORWARDED  = uvm_reg_field::type_id::create("PACKET_FORWARDED");
    
    PACKET_DROPPED    = uvm_reg_field::type_id::create("PACKET_DROPPED");
    QUEUE_OVERFLOW    = uvm_reg_field::type_id::create("QUEUE_OVERFLOW");
    ERROR			  = uvm_reg_field::type_id::create("ERROR");
    GEN_DONE 		  = uvm_reg_field::type_id::create("GEN_DONE");
    
    RESERVED.configure		   (this,24,8,"RO" ,0,0,1,1,1);
    SW_EVENT.configure		   (this, 1,7,"W1C",0,0,1,1,1);
    START_ACK.configure		   (this, 1,6,"W1C",0,0,1,1,1);
    QUEUE_ALMOST_FULL.configure(this, 1,5,"W1C",0,0,1,1,1);
    PACKET_FORWARDED.configure (this, 1,4,"W1C",0,0,1,1,1);
    
    PACKET_DROPPED.configure   (this, 1,3,"W1C",0,0,1,1,1);
    QUEUE_OVERFLOW.configure   (this, 1,2,"W1C",0,0,1,1,1);
    ERROR.configure			   (this, 1,1,"W1C",0,0,1,1,1);
    GEN_DONE.configure		   (this, 1,0,"W1C",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_16_IRQ_STATUS.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_16_IRQ_STATUS.sample();
  endfunction
  
endclass

//17
class IRQ_ENABLE extends uvm_reg;
  
  `uvm_object_utils(IRQ_ENABLE)
  
  rand uvm_reg_field RESERVED;
  
  rand uvm_reg_field SW_EVENT_EN;
  rand uvm_reg_field START_ACK_EN;
  rand uvm_reg_field QUEUE_AF_EN;
  rand uvm_reg_field PACKET_FWD_EN;
  
  rand uvm_reg_field PACKET_DROP_EN;
  rand uvm_reg_field OVERFLOW_EN;
  rand uvm_reg_field ERROR_EN;
  rand uvm_reg_field GEN_DONE_EN;
  
  covergroup cg_17_IRQ_ENABLE;
    coverpoint RESERVED.value[23:0]
    {
      bins reserved_rst = {24'd0};
    }
    coverpoint SW_EVENT_EN.value
    {
      bins sw_event_en  = {1'd1};
      bins sw_event_en_rst = {1'd0};
    }
    coverpoint START_ACK_EN.value
    {
      bins start_ack_en = {1'd1};
      bins start_ack_en_rst = {1'd0};
    }
    coverpoint QUEUE_AF_EN.value
    {
      bins queue_af_en = {1'd1};
      bins queue_af_en_rst = {1'd0};
    }
    coverpoint PACKET_FWD_EN.value
    {
      bins packet_fwd_en  = {1'd1};
      bins packet_fwd_en_rst = {1'd0};
    }
    coverpoint PACKET_DROP_EN.value
    {
      bins packet_drop_en = {1'd1};
      bins packet_drop_en_rst = {1'd0};
    }
    coverpoint OVERFLOW_EN.value
    {
      bins overflow_en = {1'd1};
      bins overflow_en_rst = {1'd0};
    }
    coverpoint ERROR_EN.value
    {
      bins error_en  = {1'd1};
      bins error_en_rst = {1'd0};
    }
    coverpoint GEN_DONE_EN.value
    {
      bins gen_done_en = {1'd1};
      bins gen_done_en_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "IRQ_ENABLE");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_17_IRQ_ENABLE = new();
  endfunction
  
  function void build;
    
    RESERVED 	   = uvm_reg_field::type_id::create("RESERVED");
    
    SW_EVENT_EN    = uvm_reg_field::type_id::create("SW_EVENT_EN");
    START_ACK_EN   = uvm_reg_field::type_id::create("START_ACK_EN");
    QUEUE_AF_EN    = uvm_reg_field::type_id::create("QUEUE_AF_EN");
    PACKET_FWD_EN  = uvm_reg_field::type_id::create("PACKET_FWD_EN");
    
    PACKET_DROP_EN = uvm_reg_field::type_id::create("PACKET_DROP_EN");
    OVERFLOW_EN    = uvm_reg_field::type_id::create("OVERFLOW_EN");
    ERROR_EN	   = uvm_reg_field::type_id::create("ERROR_EN");
    GEN_DONE_EN    = uvm_reg_field::type_id::create("GEN_DONE_EN");
    
    
    RESERVED.configure      (this,24,8,"RO",0,0,1,1,1);
    SW_EVENT_EN.configure   (this, 1,7,"RW",0,0,1,1,1);
    START_ACK_EN.configure  (this, 1,6,"RW",0,0,1,1,1);
    QUEUE_AF_EN.configure   (this, 1,5,"RW",0,0,1,1,1);
    PACKET_FWD_EN.configure (this, 1,4,"RW",0,0,1,1,1);
    
    PACKET_DROP_EN.configure(this, 1,3,"RW",0,0,1,1,1);
    OVERFLOW_EN.configure   (this, 1,2,"RW",0,0,1,1,1);
    ERROR_EN.configure	    (this, 1,1,"RW",0,0,1,1,1);
    GEN_DONE_EN.configure   (this, 1,0,"RW",0,0,1,1,1);
    
  endfunction
   
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_17_IRQ_ENABLE.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_17_IRQ_ENABLE.sample();
  endfunction
  
endclass

//18
class IRQ_FORCE extends uvm_reg;
  
  `uvm_object_utils(IRQ_FORCE)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field FORCE;
  
  covergroup cg_18_IRQ_FORCE;
    coverpoint RESERVED.value[23:0]
    {
      bins reserved_rst = {24'd0};
    }
    coverpoint FORCE.value[7:0]
    {
      bins Force  = {[8'h01:8'hff]};
      bins Force_rst = {8'h00};
    }
  endgroup
  
  function new(string name = "IRQ_FORCE");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_18_IRQ_FORCE = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    FORCE    = uvm_reg_field::type_id::create("FORCE");
    
    RESERVED.configure(this,24,8,"RO",0,0,1,1,1);
    FORCE.configure   (this, 8,0,"WO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_18_IRQ_FORCE.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_18_IRQ_FORCE.sample();
  endfunction
  
endclass

//19
class ERR_STATUS extends uvm_reg;
  
  `uvm_object_utils(ERR_STATUS)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field INJECTED;
  rand uvm_reg_field LENGTH_ERROR;
  rand uvm_reg_field CRC_ERROR;
  rand uvm_reg_field PROTOCOL_ERROR;
  
  rand uvm_reg_field UNDERSIZE;
  rand uvm_reg_field QUEUE_OVERFLOW;
  rand uvm_reg_field DEST_ERROR;
  rand uvm_reg_field BUS_ERROR;
  
  covergroup cg_19_ERR_STATUS;
    coverpoint RESERVED.value[23:0]
    {
      bins reserved_rst = {24'd0};
    }
    coverpoint INJECTED.value
    {
      bins injected  = {1'd1};
      bins injected_rst = {1'd0};
    }
    coverpoint LENGTH_ERROR.value
    {
      bins length_error = {1'd1};
      bins length_error_rst = {1'd0};
    }
    coverpoint CRC_ERROR.value
    {
      bins crc_error = {1'd1};
      bins crc_error_rst = {1'd0};
    }
    coverpoint PROTOCOL_ERROR.value
    {
      bins protocol_error  = {1'd1};
      bins protocol_error_rst = {1'd0};
    }
    coverpoint UNDERSIZE.value{
      bins undersize = {1'd1};
      bins undersize_rst = {1'd0};
    }
    coverpoint QUEUE_OVERFLOW.value
    {
      bins queue_overflow = {1'd1};
      bins queue_overflow_rst = {1'd0};
    }
    coverpoint DEST_ERROR.value
    {
      bins dest_error  = {1'd1};
      bins dest_error_rst = {1'd0};
    }
    coverpoint BUS_ERROR.value
    {
      bins bus_error = {1'd1};
      bins bus_error_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "ERR_STATUS");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_19_ERR_STATUS = new();
  endfunction
  
  function void build;
    
    RESERVED       = uvm_reg_field::type_id::create("RESERVED");
    INJECTED       = uvm_reg_field::type_id::create("INJECTED");
    LENGTH_ERROR   = uvm_reg_field::type_id::create("LENGTH_ERROR");
    CRC_ERROR      = uvm_reg_field::type_id::create("CRC_ERROR");
    PROTOCOL_ERROR = uvm_reg_field::type_id::create("PROTOCOL_ERROR");
    
    UNDERSIZE      = uvm_reg_field::type_id::create("UNDERSIZE");
    QUEUE_OVERFLOW = uvm_reg_field::type_id::create("QUEUE_OVERFLOW");
    DEST_ERROR     = uvm_reg_field::type_id::create("DEST_ERROR");
    BUS_ERROR      = uvm_reg_field::type_id::create("BUS_ERROR");
    
    RESERVED.configure      (this,24,8,"RO" ,0,0,1,1,1);
    INJECTED.configure      (this, 1,7,"W1C",0,0,1,1,1);
    LENGTH_ERROR.configure  (this, 1,6,"W1C",0,0,1,1,1);
    CRC_ERROR.configure     (this, 1,5,"W1C",0,0,1,1,1);
    PROTOCOL_ERROR.configure(this, 1,4,"W1C",0,0,1,1,1);
    
    UNDERSIZE.configure     (this, 1,3,"W1C",0,0,1,1,1);
    QUEUE_OVERFLOW.configure(this, 1,2,"W1C",0,0,1,1,1);
    DEST_ERROR.configure    (this, 1,1,"W1C",0,0,1,1,1);
    BUS_ERROR.configure     (this, 1,0,"W1C",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_19_ERR_STATUS.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_19_ERR_STATUS.sample();
  endfunction
  
endclass

//20
class ERR_ENABLE extends uvm_reg;
  
  `uvm_object_utils(ERR_ENABLE)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field INJECTED_EN;
  rand uvm_reg_field LENGTH_EN;
  rand uvm_reg_field CRC_EN;
  rand uvm_reg_field PROTOCOL_EN;
  
  rand uvm_reg_field UNDERSIZE_EN;
  rand uvm_reg_field OVERFLOW_EN;
  rand uvm_reg_field DEST_EN;
  rand uvm_reg_field BUS_EN;
  
  covergroup cg_20_ERR_ENABLE;
    coverpoint RESERVED.value[23:0]
    {
      bins reserved_rst = {24'd0};
    }
    coverpoint INJECTED_EN.value
    {
      bins injected_en  = {1'd1};
      bins injected_en_rst = {1'd0};
    }
    coverpoint LENGTH_EN.value
    {
      bins length_en = {1'd1};
      bins length_en_rst = {1'd0};
    }
    coverpoint CRC_EN.value
    {
      bins crc_en = {1'd1};
      bins crc_en_rst = {1'd0};
    }
    coverpoint PROTOCOL_EN.value
    {
      bins protocol_en  = {1'd1};
      bins protocol_en_rst = {1'd0};
    }
    coverpoint UNDERSIZE_EN.value
    {
      bins undersize_en = {1'd1};
      bins undersize_en_rst = {1'd0};
    }
    coverpoint OVERFLOW_EN.value
    {
      bins overflow_en = {1'd1};
      bins overflow_en_rst = {1'd0};
    }
    coverpoint DEST_EN.value
    {
      bins dest_en = {1'd1};
      bins dest_en_rst = {1'd0};
    }
    coverpoint BUS_EN.value
    {
      bins bus_en  = {1'd1};
      bins bus_en_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "ERR_ENABLE");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_20_ERR_ENABLE = new();
  endfunction
  
  function void build;
    
    RESERVED     = uvm_reg_field::type_id::create("RESERVED");
    INJECTED_EN  = uvm_reg_field::type_id::create("INJECTED_EN");
    LENGTH_EN    = uvm_reg_field::type_id::create("LENGTH_EN");
    CRC_EN       = uvm_reg_field::type_id::create("CRC_EN");
    PROTOCOL_EN  = uvm_reg_field::type_id::create("PROTOCOL_EN");
    
    UNDERSIZE_EN = uvm_reg_field::type_id::create("UNDERSIZE_EN");
    OVERFLOW_EN  = uvm_reg_field::type_id::create("OVERFLOW_EN");
    DEST_EN      = uvm_reg_field::type_id::create("DEST_EN");
    BUS_EN       = uvm_reg_field::type_id::create("BUS_EN");
    
    RESERVED.configure    (this,24,8,"RO",0,0,1,1,1);
    INJECTED_EN.configure (this, 1,7,"RW",0,0,1,1,1);
    LENGTH_EN.configure   (this, 1,6,"RW",0,0,1,1,1);
    CRC_EN.configure      (this, 1,5,"RW",0,0,1,1,1);
    PROTOCOL_EN.configure (this, 1,4,"RW",0,0,1,1,1);
    
    UNDERSIZE_EN.configure(this, 1,3,"RW",0,0,1,1,1);
    OVERFLOW_EN.configure (this, 1,2,"RW",0,0,1,1,1);
    DEST_EN.configure     (this, 1,1,"RW",0,0,1,1,1);
    BUS_EN.configure      (this, 1,0,"RW",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_20_ERR_ENABLE.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_20_ERR_ENABLE.sample();
  endfunction
  
endclass

//21
class ERR_INJECT extends uvm_reg;
  
  `uvm_object_utils(ERR_INJECT)
  
  rand uvm_reg_field CLEAR_COUNT;
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field INJECTED;
  rand uvm_reg_field LENGTH;
  rand uvm_reg_field CRC;
  
  rand uvm_reg_field PROTOCOL;
  rand uvm_reg_field UNDERSIZE;
  rand uvm_reg_field OVERFLOW;
  rand uvm_reg_field DEST;
  rand uvm_reg_field BUS;
  
  covergroup cg_21_ERR_INJECT;
    coverpoint CLEAR_COUNT.value
    {
      bins clear_count = {1'd1};
      bins clear_count_rst = {1'd0};
    }
    coverpoint RESERVED.value[22:0]
    {
      bins reserved_rst = {23'd0};
    }
    coverpoint INJECTED.value
    {
      bins injected = {1'd1};
      bins injected_rst = {1'd0};
    }
    coverpoint LENGTH.value
    {
      bins length = {1'd1};
      bins length_rst = {1'd0};
    }
    coverpoint CRC.value
    {
      bins crc  = {1'd1};
      bins crc_rst = {1'd0};
    }
    coverpoint PROTOCOL.value
    {
      bins protocol = {1'd1};
      bins protocol_rst = {1'd0};
    }
    coverpoint UNDERSIZE.value
    {
      bins undersize = {1'd1};
      bins undersize_rst = {1'd0};
    }
    coverpoint OVERFLOW.value
    {
      bins overflow  = {1'd1};
      bins overflow_rst = {1'd0};
    }
    coverpoint DEST.value
    {
      bins dest = {1'd1};
      bins dest_rst = {1'd0};
    }
    coverpoint BUS.value
    {
      bins bus = {1'd1};
      bins bus_rst = {1'd0};
    }
  endgroup
  
  function new(string name = "ERR_INJECT");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_21_ERR_INJECT = new();
  endfunction
  
  function void build;
    
    CLEAR_COUNT = uvm_reg_field::type_id::create("CLEAR_COUNT");
    RESERVED    = uvm_reg_field::type_id::create("RESERVED");
    INJECTED    = uvm_reg_field::type_id::create("INJECTED");
    LENGTH      = uvm_reg_field::type_id::create("LENGTH");
    CRC         = uvm_reg_field::type_id::create("CRC");
     
    PROTOCOL    = uvm_reg_field::type_id::create("PROTOCOL");
    UNDERSIZE   = uvm_reg_field::type_id::create("UNDERSIZE");
    OVERFLOW    = uvm_reg_field::type_id::create("OVERFLOW");
    DEST        = uvm_reg_field::type_id::create("DEST");
    BUS         = uvm_reg_field::type_id::create("BUS");
    
    CLEAR_COUNT.configure(this, 1,31,"WO",0,0,1,1,1);
    RESERVED.configure   (this,23, 8,"RO",0,0,1,1,1);
    INJECTED.configure   (this, 1, 7,"WO",0,0,1,1,1);
    LENGTH.configure     (this, 1, 6,"WO",0,0,1,1,1);
    CRC.configure        (this, 1, 5,"WO",0,0,1,1,1);
    
    PROTOCOL.configure   (this, 1, 4,"WO",0,0,1,1,1);
    UNDERSIZE.configure  (this, 1, 3,"WO",0,0,1,1,1);
    OVERFLOW.configure   (this, 1, 2,"WO",0,0,1,1,1);
    DEST.configure       (this, 1, 1,"WO",0,0,1,1,1);
    BUS.configure        (this, 1, 0,"WO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_21_ERR_INJECT.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_21_ERR_INJECT.sample();
  endfunction
  
endclass

//22
class ERR_COUNT extends uvm_reg;
  
  `uvm_object_utils(ERR_COUNT)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field ERROR_COUNT;
  
  covergroup cg_22_ERR_COUNT;
    coverpoint RESERVED.value[15:0]
    {
      bins reserved_rst = {16'd0};
    }
    coverpoint ERROR_COUNT.value[15:0]
    {
      bins error_count_rst = {16'd0};
    }
  endgroup
  
  function new(string name = "ERR_COUNT");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_22_ERR_COUNT = new();
  endfunction
  
  function void build;
    
    RESERVED    = uvm_reg_field::type_id::create("RESERVED");
    ERROR_COUNT = uvm_reg_field::type_id::create("ERROR_COUNT");
    
    RESERVED.configure   (this,16,16,"RO",0,0,1,1,1);
    ERROR_COUNT.configure(this,16, 0,"RO",1,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_22_ERR_COUNT.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_22_ERR_COUNT.sample();
  endfunction
  
endclass

//23
class ERR_INFO extends uvm_reg;
  
  `uvm_object_utils(ERR_INFO)
  
  rand uvm_reg_field TX_SNAPSHOT;
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field DEST_PORT;
  rand uvm_reg_field SOURCE;
  rand uvm_reg_field LAST_CODE;
  
  covergroup cg_23_ERR_INFO;
    coverpoint TX_SNAPSHOT.value[11:0]
    {
      bins tx_snapshot_rst = {12'd0};
    }
    coverpoint RESERVED.value[1:0]
    {
      bins reserved_rst = {2'd0};
    }
    coverpoint DEST_PORT.value[1:0]
    {
      bins dest_port_rst = {2'd0};
    }
    coverpoint SOURCE.value[7:0]
    {
      bins source_rst = {8'h00};
    }
    coverpoint LAST_CODE.value[7:0]
    {
      bins last_code_rst = {8'h00};
    }
  endgroup
  
  function new(string name = "ERR_INFO");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_23_ERR_INFO = new();
  endfunction
  
  function void build;
    
    TX_SNAPSHOT = uvm_reg_field::type_id::create("TX_SNAPSHOT");
    RESERVED    = uvm_reg_field::type_id::create("RESERVED");
    DEST_PORT   = uvm_reg_field::type_id::create("DEST_PORT");
    SOURCE      = uvm_reg_field::type_id::create("SOURCE");
    LAST_CODE   = uvm_reg_field::type_id::create("LAST_CODE");
    
    TX_SNAPSHOT.configure(this,12,20,"RO",1,0,1,1,1);
    RESERVED.configure   (this, 2,18,"RO",1,0,1,1,1);
    DEST_PORT.configure  (this, 2,16,"RO",1,0,1,1,1);
    SOURCE.configure     (this, 8, 8,"RO",1,0,1,1,1);
    LAST_CODE.configure  (this, 8, 0,"RO",1,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_23_ERR_INFO.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_23_ERR_INFO.sample();
  endfunction
  
endclass

//24
class LOCK extends uvm_reg;
  
  `uvm_object_utils(LOCK)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field LOCKED;
  
  covergroup cg_24_LOCK;
    coverpoint RESERVED.value[30:0]
    {
      //bins reserved = {[8'h00:8'hff]};
      bins reserved_rst = {31'd0};
    }
    coverpoint LOCKED.value
    {
      bins locked_rst = {1'b1};
    }
  endgroup
  
  function new(string name = "LOCK");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_24_LOCK = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    LOCKED   = uvm_reg_field::type_id::create("LOCKED");
    
    RESERVED.configure(this,31,1,"WO",0,0,1,1,1);
    LOCKED.configure  (this, 1,0,"RO",0,1,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_24_LOCK.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_24_LOCK.sample();
  endfunction
  
endclass

//25
class SOFT_RESET extends uvm_reg;
  
  `uvm_object_utils(SOFT_RESET)
  
  rand uvm_reg_field RESERVED;
  rand uvm_reg_field PULSE;
  
  covergroup cg_25_SOFT_RESET;
    coverpoint RESERVED.value[30:0]
    {
      bins reserved_rst = {31'd0};
    }
    coverpoint PULSE.value
    {
      bins pulse  = {1'b1};
      bins pulse_rst = {1'b0};
    }
  endgroup
  
  function new(string name = "SOFT_RESET");
    super.new(name,32,UVM_CVR_FIELD_VALS);
    if(has_coverage(UVM_CVR_FIELD_VALS))
      cg_25_SOFT_RESET = new();
  endfunction
  
  function void build;
    
    RESERVED = uvm_reg_field::type_id::create("RESERVED");
    PULSE    = uvm_reg_field::type_id::create("PULSE");
    
    RESERVED.configure(this,31,1,"RO",0,0,1,1,1);
    PULSE.configure   (this, 1,0,"WO",0,0,1,1,1);
    
  endfunction
  
  virtual function void sample(uvm_reg_data_t data,
                               uvm_reg_data_t byte_en,
                               bit is_read,
                               uvm_reg_map map);
    cg_25_SOFT_RESET.sample();
  endfunction
  
  virtual function void sample_values();
    super.sample_values();
    cg_25_SOFT_RESET.sample();
  endfunction
  
endclass  


//reg 16,23,24
