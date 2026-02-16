library verilog;
use verilog.vl_types.all;
entity Baud_Rate_Generator_Tx is
    generic(
        CLK             : integer := 100000000;
        BAUD_RATE       : integer := 9600
    );
    port(
        sys_clk         : in     vl_logic;
        rst_n           : in     vl_logic;
        baud_rate_tx    : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK : constant is 1;
    attribute mti_svvh_generic_type of BAUD_RATE : constant is 1;
end Baud_Rate_Generator_Tx;
