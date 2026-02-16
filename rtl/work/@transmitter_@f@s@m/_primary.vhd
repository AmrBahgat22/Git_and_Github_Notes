library verilog;
use verilog.vl_types.all;
entity Transmitter_FSM is
    port(
        baud_rate_tx    : in     vl_logic;
        rst_n           : in     vl_logic;
        tx_enable       : in     vl_logic;
        busy            : out    vl_logic;
        load            : out    vl_logic;
        shift           : out    vl_logic
    );
end Transmitter_FSM;
