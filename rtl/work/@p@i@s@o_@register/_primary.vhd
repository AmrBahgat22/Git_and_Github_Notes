library verilog;
use verilog.vl_types.all;
entity PISO_Register is
    port(
        baud_rate_tx    : in     vl_logic;
        rst_n           : in     vl_logic;
        load            : in     vl_logic;
        shift           : in     vl_logic;
        parity_bit      : in     vl_logic;
        p_data_in       : in     vl_logic_vector(0 to 7);
        s_data_out      : out    vl_logic
    );
end PISO_Register;
