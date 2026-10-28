interface apb_if(input logic pclk,presetn);
  
  logic penable;
  logic pwrite;
  logic [`ADDR_W-1:0]paddr;
  logic [`DATA_W-1:0]pwdata;
  logic [`DATA_W-1:0]prdata;
  logic pready;
  logic pslverr;
  logic irq;
  logic psel;
    
  
  clocking drv_cb@(posedge pclk);
    
    default input #1 output #1;
    
    //output presetn;
    output psel;
    output penable;
    output pwrite;
    output paddr;
    output pwdata;
    
    input pready;
    input prdata;
    input pslverr;
    input irq;
    
  endclocking
  
  clocking mon_cb@(posedge pclk);
    
    default input #1 output #1;
    
    //input presetn;
    
    input psel;
    input penable;
    input pwrite;
    input paddr;
    input pwdata;

    input prdata;
    input pready;
    input pslverr;
    input irq;
    
  endclocking
  
  modport DRV_CB(clocking drv_cb);
  modport MON_CB(clocking mon_cb);
  
endinterface
